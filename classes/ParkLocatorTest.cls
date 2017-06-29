@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        List <String> parkResults = ParkLocator.country('Test');
        system.assert(new List<String>{'a', 'b'}==parkResults);
    }
}