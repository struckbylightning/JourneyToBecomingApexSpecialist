@IsTest
public class AddPrimaryContactTest {
    
    @IsTest
    public static void testContactCreation() {
        List<account> acc_lst = new List<account>();
        for (Integer i=0; i<50;i++) {
            account a = new account(name=string.valueOf(i),billingstate='NY');
            acc_lst.add(a);
        }
        for (Integer i=0; i<50;i++) {
            account a = new account(name=string.valueOf(50+i),billingstate='CA');
            acc_lst.add(a);
        }      
        insert acc_lst;
        contact dummyContact = new contact(lastname='alex');
        AddPrimaryContact apc = new AddPrimaryContact(dummyContact,'CA');
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
        List<contact> contactsInserted = [select id from contact where account.billingstate='CA'];
        system.assertEquals(50, contactsInserted.size());
    }    
}