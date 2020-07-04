@isTest
public class JobAllTriggerClassHandler {
    @isTest
    public static void insertJob(){
        Job__c job=new Job__c();
        
        job.Number_of_Positions__c=10;
        job.Job_Type__c='Admin';
        job.Qualification_Required__c='Bcom;BE';
        job.Required_Skills__c='Networking;Linux';
        job.Certification_Required__c='Microsoft;CISCO;RedHat;IBM';
        job.Active__c=true;
        job.Manager__c='0032x000005zWrL';
        
        test.startTest();
        insert job;
        test.stopTest();
        
        List<Job__c> jobList=[SELECT Name FROM Job__c WHERE Manager__c=:'0032x000005zWrL'];
        system.assertEquals(1, jobList.size());
        
    }
}