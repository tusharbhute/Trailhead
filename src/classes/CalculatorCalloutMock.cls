@isTest
Global class CalculatorCalloutMock implements WebServiceMock 
{

	Global void doInvoke(
	    Object stub,
	    Object request,
	    Map<String,Object> response,
	    String endpoint,
	    String soapAction,
	    String requestName,
	    String responseNS,
	    String responseName,
	    String responseType)
	    {
	        // start - specify the response you want to send
	        calculatorServices.doAddResponse response_x = new calculatorServices.doAddResponse();
	        response_x.return_x = 3.0;
	        
	        response.put('response_x',response_x);

	    }
	    

	

}