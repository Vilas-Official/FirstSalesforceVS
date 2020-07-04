trigger CanDeleteJob on Job__c (before delete) {
    for(Job__C j:Trigger.Old){
        if(j.Active__c==true)
        {
            j.addError('This Job is active and can not be deleted');
        }
    }
}