//HTTP callout from trailhead 11
public class AnimalsCallouts 
{
    //GET Callout
    public static HttpResponse makeGetCallout()
    {
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
        //If the request is successfull parse the JSON response
        if(response.getStatusCode() == 200)
        {
            // Deserializes the JSON string into collections of primitive data types
            Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            system.debug('Received The Following Animals:');
            for(Object animal : animals)
                system.debug(animal);

        }
        
        return response;
    }
    
    public static HttpResponse makePostCallout()
    {
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty moose"}');
        
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if(response.getStatusCode() != 201)
            system.debug('The Status Code Returned Was Not Expected: '+response.getStatusCode()+' '+response.getStatus());
        else
            system.debug(response.getBody());
        
        return response;
    }

   
}