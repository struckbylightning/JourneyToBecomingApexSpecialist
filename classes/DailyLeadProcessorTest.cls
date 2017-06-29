@isTest
public class DailyLeadProcessorTest {
    
    @isTest
    public static void testUpdateLeadSource() {        
        List<lead> testLeads = new List<lead>();
        for(Integer i=0;i<200;i++) {
            testLeads.add(new lead(lastname = 'lastname'+i, 
                                   Company = 'company'+i));
        }
        insert testLeads;
        
        Test.startTest();
        DailyLeadProcessor dlp = new DailyLeadProcessor ();
        String jobId = System.Schedule('dailyleadprocessing', '0 0 23 * * ?', dlp);
        Test.stopTest();        
        List<lead> leadsNotUpdated = [select id,leadsource from lead where leadsource != 'Dreamforce'];
        System.assertequals(0, leadsNotUpdated.size(), 
                            'All leads leadSource should have been updated to DreamSource');
    }
}