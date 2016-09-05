@isTest
private class AnimalsCalloutsTest 
{

	private static testMethod void testGetCallout() 
	{
        //Create the mock response based on a static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        
        //Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);
        
        //Call method to test
        HttpResponse result = AnimalsCallouts.makeGetCallout();
        
        //Verify mock response is not null
        system.assertNotEquals(null, result, 'The Callout Returned A Null Response');
        
        //Verify Status code
        system.assertEquals(200, result.getStatusCode(), 'Status Code is Not 200');
        
        //Verify content type 
        system.assertEquals('application/json;charset=UTF-8', result.getHeader('Content-Type'), 'The Content-Type value is not as expected');
        
        //Verify the array contains 3 items
        Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(result.getBody());
        List<Object> animals = (List<Object>) results.get('animals');
        system.assertEquals(3, animals.size(), 'The array should contain only 3 items');

        
	}
	
	private static testMethod void testPostCallout()
	{
	    //set mock callout class
	    Test.setMock(HttpCalloutMock.class, new AnimalsHttpCalloutMock());
	    
	    //This causes a fake response to be sent from the class that implements HttpCalloutMock
	    HttpResponse response = AnimalsCallouts.makePostCallout();
	    
	    //Verify that the response received constains fake values
	    String contentType = response.getHeader('Content-Type');
	    system.assert(contentType == 'application/json');
	    
	    String actualValue = response.getBody();
	    String expectedValue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
	    system.assertEquals(actualValue, expectedValue);
	    
	    System.assertEquals(200, response.getStatusCode());

	}

}