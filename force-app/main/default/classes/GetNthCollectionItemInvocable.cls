public class GetNthCollectionItemInvocable {
    
    @InvocableMethod
    public static List<Response> execute(List<Request> requests) {

        List<Response> responses = new List<Response>();

        for(Request r : requests) {

            Response response = new Response();

            if(r.index < 0) {
                response.record = r.records.get(r.records.size() - 1);
            }
            else {
                response.record = r.records.get(r.index);
            }

            responses.add(response);

        }

        return responses;

    }

    public class Request {
        @InvocableVariable
        public List<sObject> records;
        @InvocableVariable
        public Integer index;
    }

    public class Response {
        @InvocableVariable
        public sObject record;
    }

}