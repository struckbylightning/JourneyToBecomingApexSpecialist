public class AnimalLocator {
    public class cls_animal {
        public Integer id;	
        public String name;	
        public String eats;	
        public String says;	
    }    
    public class JSONOutput{
        public cls_animal animal;
    }
    
    public static String getAnimalNameById (Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        jsonOutput results = (jsonOutput) JSON.deserialize(response.getBody(), jsonOutput.class);
        return(results.animal.name);
    }    
}