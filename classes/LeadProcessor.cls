global class LeadProcessor implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id from Lead]);
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        for(Lead aLead : scope){
            aLead.LeadSource = 'Dreamforce';
        }
        update scope;
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
}