trigger CheckApplcnDate on Candidate_Yourname__c (before insert) {
    for(Candidate_Yourname__c c:Trigger.New){
            c.Application_Date__c=system.today()+1;
    }
}