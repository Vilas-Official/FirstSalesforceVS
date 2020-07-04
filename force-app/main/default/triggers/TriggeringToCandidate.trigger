trigger TriggeringToCandidate on Candidate_Yourname__c (before insert) {
     if(Trigger.isbefore && Trigger.isinsert)
    {
         Candidate_Yourname__c acc=trigger.new[0];
         if(acc.Expected_Salary__c==NULL)
            {
                acc.Expected_Salary__c.addError('Expected Salary field is missing');
            }
            
         for(Candidate_Yourname__c c: Trigger.new)
            {
                c.Application_Date__c=system.today()+1;

            }
     }
}