@IsTest
public class AnimalLocatorTest {
    @isTest
    public static void testAnimalLocator() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        Test.startTest();
        String s =  AnimalLocator.getAnimalNameById(1);
        Test.stopTest();
        System.assert('chicken'==s);
    }
}