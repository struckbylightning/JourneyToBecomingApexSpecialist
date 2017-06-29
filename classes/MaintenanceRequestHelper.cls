public class MaintenanceRequestHelper {
    
 public static void updateWorkOrders(){}
   
    public static void updateWorkOrders(Map<Id, Case> applicableCases){
        
        Map<Id, Integer> mapProduct = new Map<Id, Integer>(); 
        List<Case> newCases = new List<Case>();
        /*
List<Work_Part__c> workParts = [SELECT Id, Equipment__r.Maintenance_Cycle__c FROM Work_Part__c 
WHERE Maintenance_Request__c IN :applicableCases.keySet()];
if(workParts.size() > 0){
for (Work_Part__c wp : workParts){
mapProduct.put(wp.Id, Integer.valueOf(wp.Equipment__r.Maintenance_Cycle__c));
}
}
*/
        List<Product2> listProduct = [select Id, Maintenance_Cycle__c from Product2];                                   
        for (Product2 p : listProduct) {
            if (p != null) {
                if(p.Maintenance_Cycle__c != null){
                    mapProduct.put(p.Id, Integer.valueOf(p.Maintenance_Cycle__c));
                }               
            }
        }
        for(Case a: applicableCases.values()){
            Case newCase = new Case();
            newCase.Vehicle__c = a.Vehicle__c;
            newCase.Equipment__c = a.Equipment__c;
            newCase.Type = 'Routine Maintenance';
            newCase.Subject = String.isBlank(a.Subject) ? 'Routine Maintenance Request' : a.Subject;
            newCase.Date_Reported__c = Date.today();
            newCase.Status = 'New';
            newCase.Product__c = a.Product__c;
            newCase.AccountId = a.AccountId;
            newCase.ContactId = a.ContactId;
            newCase.AssetId = a.AssetId;
            newCase.Origin = a.Origin;
            newCase.Reason = a.Reason;
            newCase.Date_Due__c =  (mapProduct.get(a.Id) != null) ? (Date.today().addDays(Integer.valueOf(mapProduct.get(a.Id)))) : (Date.today());
                newCases.add(newCase);
        }
        if(newCases.size() > 0){
            insert newCases;
        }
    }           
}