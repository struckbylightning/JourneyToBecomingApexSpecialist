@isTest
private class TestRestrictContactByName{
    static testMethod void contactInsertSuccess(){
        Boolean insertFailed = false;
        Contact con=new Contact(FirstName='XX', LastName='YY');
        try{
            Test.startTest();
            insert con;
            Test.stopTest();
        }
        catch(Exception e){
            insertFailed = true;
        }
        System.assertEquals(false, insertFailed);
    }
    static testMethod void contactInsertFail(){
        Boolean insertFailed;
        Contact con=new Contact(FirstName='XX', LastName='INVALIDNAME');
        try{
            Test.startTest();
            insert con;
            Test.stopTest();
        }
        catch(Exception e){
            insertFailed = true;
        }
        System.assertEquals(true,insertFailed);
    }
}