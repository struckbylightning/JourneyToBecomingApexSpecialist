@isTest
public class WarehouseSyncScheduleTest {
    
    @isTest
    static void test() {
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());   		
        String CRON_EXP =  '0 0 0 3 9 ? 2022';
        Test.startTest();
        
        // Schedule the test job
        String jobId = System.schedule('testScheduledApex', CRON_EXP, new WarehouseSyncSchedule());
        
        Test.stopTest();
        
        // Get the information from the CronTrigger API object
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, 
                          NextFireTime FROM CronTrigger WHERE id = :jobId];
        
        // Verify the expressions are the same
        System.assertEquals(CRON_EXP,ct.CronExpression);
        // Verify the job has not run
        System.assertEquals(0, ct.TimesTriggered);
    }
}