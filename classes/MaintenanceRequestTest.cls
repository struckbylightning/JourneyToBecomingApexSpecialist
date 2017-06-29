@isTest
public class MaintenanceRequestTest {
    @isTest
    static void testMaintenanceRequest(){
        
        List<Case> caseList = new List<Case>();
        Product2 prod = new Product2();
        prod.Cost__c = 50;
        prod.Name = 'Ball Valve 10 cm';
        prod.Lifespan_Months__c = 12;
        prod.Maintenance_Cycle__c = 365;
        prod.Current_Inventory__c = 50;
        prod.Replacement_Part__c = true;
        prod.Warehouse_SKU__c = '100009';
        insert prod;
        System.assertEquals(1, [SELECT count() FROM Product2 WHERE Name = 'Ball Valve 10 cm']);
        
        for(Integer i=1;i<=300;i++) {
            Case caseNew = new Case();
            caseNew.Subject = 'Maintenance';
            caseNew.Type = 'Other';
            caseNew.Status = 'New';
            caseNew.Equipment__c = prod.Id;
            caseList.add(caseNew);   
        }
        
        Test.startTest();
        
        insert caseList;
        System.assertEquals(300, [SELECT count() FROM Case WHERE Type = 'Other']);
        
        for(Case a : caseList){
            a.Type = 'Repair';
            a.Status = 'Closed';
        }
        update caseList;
        System.assertEquals(300, [SELECT count() FROM Case WHERE Type = 'Repair']);
        Test.stopTest();
    }
}