public class AddPrimaryContact implements Queueable {
    public contact c;
    public String state;
    
    public AddPrimaryContact(Contact c, String state) {
        this.c = c;
        this.state = state;
    }
    
    public void execute(QueueableContext qc) {
        system.debug('this.c = '+this.c+' this.state = '+this.state);
        List<Contact> contactsToInsert = new List<Contact>();
        for(Account a: [select id, name, BillingState from account where BillingState = :this.state limit 200]) {
            Contact con = this.c.clone(false, false, false, false);
            con.AccountId = a.Id;
            contactsToInsert.add(con);
        }
        if(!contactsToInsert.isEmpty())insert contactsToInsert;
    }
}