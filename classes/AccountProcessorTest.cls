@IsTest
public class AccountProcessorTest {
    public static testmethod void createContactsTest() {
        Account acc = new Account(Name = 'Test');
        insert acc;
        Contact con = new Contact(FirstName = 'Test', LastName = 'Test');
        con.AccountId = acc.Id;
        insert con;
        
        Test.startTest();
        AccountProcessor.countContacts(new List<Id>{acc.Id});
        Test.stopTest();
        Account updatedAcc = [SELECT Number_of_Contacts__c FROM Account WHERE id = :acc.Id];
        System.assertEquals(1, updatedAcc.Number_of_Contacts__c);
    }
}