@isTest
public class LeadProcessorTest {
    static testMethod void leadProcessorTrailTest(){
        List<Lead> leadList = new List<Lead>();
        for(integer i = 0; i<200; i++){
            Lead leads = new Lead();
            leads.FirstName = 'X';
            leads.LastName = 'Y'+i;
            leads.Company = 'Z';
            leadList.add(leads);           
        }
        insert leadList;
        Test.startTest();
        LeadProcessor L = new LeadProcessor();
        Database.executeBatch(L);
        Test.stopTest();
        for(Lead updatedLead: [SELECT LeadSource from Lead]){
            System.assert(updatedLead.LeadSource == 'Dreamforce');
        }
    }
}