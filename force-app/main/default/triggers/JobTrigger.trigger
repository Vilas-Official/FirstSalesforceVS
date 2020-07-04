trigger JobTrigger on Job__c (before insert,before delete,after insert,after update) {
    if(Trigger.isBefore && Trigger.isDelete)
      {
         JobTriggerHandler.jobNotDelete(Trigger.Old);
      }
     if(Trigger.isAfter && Trigger.isInsert)
          {
              JobTriggerHandler.afterInsertAllHired(Trigger.New[0]);           
              JobTriggerHandler.afterInsertInActive();           
              JobTriggerHandler.afterInsertActive();             
          }    
     if(Trigger.isAfter && Trigger.isUpdate)
     {
        JobTriggerHandler.afterUpdateAllHired(Trigger.New[0]);        
        JobTriggerHandler.afterUpdateInActive();        
        JobTriggerHandler.afterUpdateActive();        
     }	
}