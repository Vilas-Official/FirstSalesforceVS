trigger IsJobStatusNotActive on Candidate_Yourname__c (before insert) {
    for(Candidate_Yourname__c  c:Trigger.New){
        if(c.Job__r.Active__c==false){
            c.addError('This Job is not active');
            }
    }
}