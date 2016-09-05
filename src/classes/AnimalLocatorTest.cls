@isTest
private class AnimalLocatorTest 
{

	private static testMethod void testGetAnimalNameById()
	{
	    String animalName;
	    
	    // Set mock callout class
	    test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
	    
	    animalName = AnimalLocator.getAnimalNameById(1);
	    system.assertEquals(animalName, 'chicken');
	    
	}

}