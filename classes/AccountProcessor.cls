public class AccountProcessor {
    @future
    public static void countContacts(List<Id> ids) {
        List<Account> accountsToUpdate = new List<Account>();
        for (Account a : [SELECT Name, (SELECT LastName FROM Contacts) FROM Account WHERE Id in :ids]) {
            System.debug(a.Id + ', ' + a.name + ', Contacts:' + a.contacts.size());
            a.Number_of_Contacts__c = a.contacts.size();
            accountsToUpdate.add(a);
        }
        if(!accountsToUpdate.isEmpty())update accountsToUpdate;        
    }
}