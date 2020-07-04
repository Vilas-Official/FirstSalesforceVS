trigger AllJobTaskTriggerNew on Job__c (before insert,before delete,after update) {
    if(Trigger.isbefore && Trigger.isdelete){
        JobAllTriggerClass.beforeDelete();
    }
    if(Trigger.isafter){
        if(Trigger.isupdate){
            JobAllTriggerClass.afterUpdate();//t6
            JobAllTriggerClass.afterInsertUpdate();            
        }
        else{
            JobAllTriggerClass.afterInsertUpdate();
        }
    }
    if(Trigger.isafter){
        if(Trigger.isinsert){
            JobAllTriggerClass.afterInsertafterUpdate();            
        }        
        if(Trigger.isupdate){
            JobAllTriggerClass.afterInsertafterUpdate();            
        }
    }

}