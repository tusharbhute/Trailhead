public class AnimalLocator 
{
    public static string getAnimalNameById(Integer Id)
    {
        String animalName;
        String textId = String.valueOf(Id);
        
        Http http = new Http();
        
        HTTPRequest request = new HTTPRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+textId);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
        //If the request is successfull parse the JSON response
        if(response.getStatusCode() == 200)
        {
            // Deserializes the JSON string into collections of primitive data types
            map<String,Object> result = (map<String,Object>) JSON.deserializeUntyped(response.getBody());
            map<String,Object> animal = (Map<String,Object>) result.get('animal');
            //map<String,Object> aName = (map<String,Object>) animal[1];
            animalName = (String) animal.get('name');
            
        }
        return animalName;
    }

}