public with sharing class JobController {
    public Job__c j { get; set; }
    public List<Job__c> samepage { get; set; }
    public JobController(){
        j=new Job__c();
    }   
    public PageReference save(){
        insert j;
        samepage=[select Job_Type__c,Manager__c,Qualification_Required__c,Active__c,Certification_Required__c,
                  Expires_On__c,Number_of_Positions__c,Required_Skills__c,
                  Salary_Offered__c,Description__c from Job__c];
        return null;
    }
   public PageReference editit(){
      update j;
      samepage=[select Job_Type__c,Manager__c,Qualification_Required__c,Active__c,Certification_Required__c,
                  Expires_On__c,Number_of_Positions__c,Required_Skills__c,
                  Salary_Offered__c,Description__c from Job__c];
        return null;
    }
    public PageReference deleteit(){
        delete j;
        samepage=[select Job_Type__c,Manager__c,Qualification_Required__c,Active__c,Certification_Required__c,
                  Expires_On__c,Number_of_Positions__c,Required_Skills__c,
                  Salary_Offered__c,Description__c from Job__c];
        return null;
    }
}