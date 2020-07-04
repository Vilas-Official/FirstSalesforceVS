public with sharing class CandidateController {
    public Candidate_Yourname__c c { get; set; }
    public List<Candidate_Yourname__c> samepage { get; set; }
    public CandidateController(){
        c=new Candidate_Yourname__c();
    }
    public PageReference save(){
        insert c;
        samepage=[select Salutation__c,First_Name__c,Last_Name__c,Full_Name__c,DOB__c,
                  Age__c,Application_Date__c,Country__c,State__c,Email__c,Expected_Salary__c,
                  Job__c,Status__c from Candidate_Yourname__c];
        return null;
    }
   public PageReference editit(){
      update c;
      samepage=[select Salutation__c,First_Name__c,Last_Name__c,Full_Name__c,DOB__c,
                Age__c,Application_Date__c,Country__c,State__c,Email__c,Expected_Salary__c,
                  Job__c,Status__c from Candidate_Yourname__c];
        return null;
    }
    public PageReference deleteit(){
        delete c;
        samepage=[select Salutation__c,First_Name__c,Last_Name__c,Full_Name__c,DOB__c,
                Age__c,Application_Date__c,Country__c,State__c,Email__c,Expected_Salary__c,
                  Job__c,Status__c from Candidate_Yourname__c];
        return null;
    }
}