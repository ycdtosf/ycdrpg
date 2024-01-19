public with sharing class GetCollectionItemByProbabilityInvocable {
    
    public static Decimal testRandom;

    @InvocableMethod
    public static List<Response> execute(List<Request> requests) {

        List<Response> responses = new List<Response>();

        for(Request request : requests) {

            Response response = new Response();

            GetRandomNumberInvocable.Request r = new GetRandomNumberInvocable.Request();
            r.min = 0;
            r.max = 1;

            List<Decimal> outs = GetRandomNumberInvocable.execute(new List<GetRandomNumberInvocable.Request> { r });
            
            Decimal theRandom = outs[0];
            if(testRandom != null) theRandom = testRandom;

            theRandom = theRandom * 100;

            List<Odds> allOdds = new List<Odds>();
            Odds lastOdds;

            List<Sorted> sortedRecords = new List<Sorted>();
            for(sObject record : request.records) {
                sortedRecords.add(new Sorted(record, request.probabilityField, false));
            }
            sortedRecords.sort();

            for(Sorted sortedRecord : sortedRecords) {

                system.debug('RANDOM = ' + theRandom);
                system.debug('PROBABILITY = ' + (Decimal)sortedRecord.record.get(request.probabilityField));

                Odds odds = new Odds();
                odds.record = sortedRecord.record;
                if(lastOdds == null) {
                    odds.min = 0;
                    odds.max = (Decimal)odds.record.get(request.probabilityField);
                }
                else {
                    odds.min = lastOdds.max + .0001;
                    odds.max = lastOdds.max + (Decimal)odds.record.get(request.probabilityField);
                }

                if(theRandom >= odds.min && theRandom <= odds.max) {
                    // WINNER!
                    response.record = odds.record;
                    break;
                }

                allOdds.add(odds);
                lastOdds = odds;
            }

            responses.add(response);

        }

        return responses;

    }

    public class Sorted implements Comparable {

        sObject record;
        String sortFieldName;
        Boolean ascending = true;

        public Sorted(sObject record, String sortFieldName) {
            this.record = record;
            this.sortFieldName = sortFieldName;
        }

        public Sorted(sObject record, String sortFieldName, Boolean ascending) {
            this.record = record;
            this.sortFieldName = sortFieldName;
            this.ascending = ascending;
        }

        public Integer compareTo(Object compareTo) {
            Sorted compare = (Sorted)compareTo;

            Integer out = 0;

            // descending sort
            if((Decimal)this.record.get(this.sortFieldName) > (Decimal)compare.record.get(this.sortFieldName)) {
                out = 1;
            }
            else if((Decimal)this.record.get(this.sortFieldName) < (Decimal)compare.record.get(this.sortFieldName)) {
                out = -1;
            }

            if(ascending == false) out = out * -1;

            return out;

        }

    }

    private class Odds {
        sObject record;
        Decimal min;
        Decimal max;
    }


    public class Request {
        @InvocableVariable
        public List<sObject> records;
        @InvocableVariable
        public String probabilityField;
    }

    public class Response {
        @InvocableVariable
        public sObject record;
    }

}