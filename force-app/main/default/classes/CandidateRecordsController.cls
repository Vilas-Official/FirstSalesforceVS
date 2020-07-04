public class CandidateRecordsController {
    public List<Candidate_Yourname__c> candRecords {get;set;}
    public void search()
        {
            candRecords = [SELECT Salutation__c,First_Name__c,Last_Name__c,Full_Name__c,DOB__c,
                  Age__c,Application_Date__c,Country__c,State__c,Email__c,Expected_Salary__c,
                  Job__c,Status__c from Candidate_Yourname__c LIMIT 1000];
        }
}