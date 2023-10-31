public class GetRandomNumberInvocable {
    
    @InvocableMethod
    public static List<Decimal> execute(List<Request> requests) {

        List<Decimal> responses = new List<Decimal>();

        for(Request r : requests) {
            responses.add(generate(r.min, r.max));
        }

        return responses;

    }
    
    public static Decimal generate(Decimal min, Decimal max) {
        
        Decimal theRandom = Math.random();
        
        if(min == 0 && max == 1) return theRandom;

        if (min > max) {
            Decimal tempMax = min;
            max = min;
            min = tempMax;
        }

        return min + theRandom * (max - min);

    }

    public class Request {
        @InvocableVariable
        public Decimal min;
        @InvocableVariable
        public Decimal max;
    }


    /*
    GetRandomNumberInvocable.Request r = new GetRandomNumberInvocable.Request();
    r.min = 1;
    r.max = 10;

    for(Integer x = 0; x < 100; x++) {
        List<Decimal> outs = GetRandomNumberInvocable.execute(new List<GetRandomNumberInvocable.Request> { r });
        system.debug(outs[0]);
    }

    */
    
}