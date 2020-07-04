trigger ActivateOrDeactivateJob on Job__c (after insert,after update) {
    List<Job__c> jobs=new List<Job__c>();
    for(Job__c j:[SELECT Number_of_Positions__c,Hired_Applicants__c,Active__c FROM Job__c WHERE Active__c =true]){
        if(j.Hired_Applicants__c==j.Number_of_Positions__c){
            j.Active__c=false;
            jobs.add(j);
        }
    }
    if(jobs.size()>0){
        update jobs;
    }
}