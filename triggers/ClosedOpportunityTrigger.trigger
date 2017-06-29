trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasklist = new List<Task>();
    
    for(Opportunity opp : Trigger.new){        
        if(opp.StageName == 'Closed Won'){
            Task newTask = new Task();
            newTask.subject = 'Follow Up Test Task';
            newTask.WhatId = opp.Id;
            newTask.OwnerId = opp.ownerId;
            newTask.Status = 'In Progress';
            newTask.Priority = 'Normal';
            tasklist.add(newTask);
        }  
    }    
    if(tasklist.size() > 0){
        insert tasklist; 
    }
}