trigger CandidateYournameTrigger on Candidate_Yourname__c (before insert) {
    if(Trigger.isInsert && Trigger.isBefore)
    {
        CandidateTriggerHandler.checkSalaryNull(Trigger.New);
        CandidateTriggerHandler.checkApplicationDate(Trigger.New);
    }
    
    
}