@isTest
public class Job_Test_Apex {
	@isTest    
    public static void insert_Job()
    {       
        Job__c job=new Job__c();       
        job.Number_of_Positions__c=5;
        job.Job_Type__c='Manager';
        job.Required_Skills__c='Team Player';
        job.Qualification_Required__c='Bcom';
        job.Certification_Required__c='PMP (Project Management Professional)';
        job.Active__c=true;
        job.Manager__c='0032x000004Kgnh';
        
        test.startTest();
        insert job;       
         
                                job.Number_of_Positions__c=10;
                                update job;
                                test.stopTest();
       
        List<Job__c> jobLst=[select id from Job__c where Manager__c=:'0032x000004Kgnh'];
        system.assertEquals(1, jobLst.size());
        
    }

}