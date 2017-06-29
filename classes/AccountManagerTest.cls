@Istest(SeeAllData=true)
public class AccountManagerTest {
    @IsTest
    public static void testaccountmanager() {
        Account acc = new Account(Name = 'Test');
        insert acc;
        Contact con = new Contact(FirstName = 'Test', LastName = 'Test');
        con.AccountId = acc.Id;
        insert con;
        RestRequest request = new RestRequest();
        request.requestUri = 'https://resourceful-badger-294733-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+acc.Id+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account returnedAcc = AccountManager.getAccount();
        System.assert('Test' == returnedAcc.Name);
        System.assert(1 == returnedAcc.contacts.size());
    }
}