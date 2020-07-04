trigger IsExpectedSalaryMissing on Candidate_Yourname__c (before insert) {
    Candidate_Yourname__c c=trigger.new[0];
    if(c.Expected_Salary__c==NULL){
        c.addError('Expected Salary field is missing');
    }
}