public class JobTriggerHandler {
    public static void jobNotDelete(List<Job__c> jobList)
    {
    	for(Job__c job:jobList){
        	if(job.Active__c == true)
          	{
            	job.addError('This Job is active and can not be deleted');
          	}
       	}
    }
    public static void afterInsertAllHired(Job__c job)
    {
    	if(job.Number_of_Positions__c==job.Hired_Applicants__c)
      	{
 			EmailManager.sendMail('vilasdhoble09@gmail.com','No Position Left','All required candidate has been hired for this job on'+ job.LastModifiedDate.Date()  );
		}
    }
    public static void afterInsertInActive()
    {
    	List<Job__c> job = new List<Job__c>();
        for(Job__c data :[SELECT Number_of_Positions__c, Hired_Applicants__c,Active__c FROM Job__c WHERE Active__c=true ] )
        {
        	if(data.Hired_Applicants__c==data.Number_of_Positions__c)
            {
                data.Active__c=false;
              	job.add(data);
            }
         }
         if(job.size()>0)
         {
         	update job;
         }
     }
	public static void afterInsertActive()
    {
    	List<Job__c> jobList = new List<Job__c>();
        for(Job__c data : [SELECT Number_of_Positions__c, Hired_Applicants__c,Active__c FROM Job__c WHERE Active__c!=true ])
        {
        	if(data.Hired_Applicants__c < data.Number_of_Positions__c)
          	{
            	data.Active__c = true;
            	jobList.add(data);
          	}
        }
        if(jobList.size()>0)
        {
        	update jobList;
        }
     }
    public static void afterUpdateAllHired(Job__c jobList)
    {
    	Job__c job3 = jobList;
		if(job3.Number_of_Positions__c==job3.Hired_Applicants__c)
       	{
 			EmailManager.sendMail('vilasdhoble09@gmail.com','No Position Left','All required candidate has been hired for this job on'+ job3.LastModifiedDate.Date()  );
  		}
   	}    
    public static void afterUpdateInActive()
    {
     	List<Job__c> job = new List<Job__c>();
        for(Job__c data :[SELECT Number_of_Positions__c, Hired_Applicants__c,Active__c FROM Job__c WHERE Active__c=true ] )
        {
        	if(data.Hired_Applicants__c==data.Number_of_Positions__c)
          	{
           		data.Active__c=false;
           		job.add(data);
       		}
         }
         if(job.size()>0)
         {
         	update job;
         }
    }    
    public static void afterUpdateActive()
    {
     	List<Job__c> jobList = new List<Job__c>();
       	for(Job__c data : [SELECT Number_of_Positions__c, Hired_Applicants__c,Active__c FROM Job__c WHERE Active__c!=true ])
       	{
        	if(data.Hired_Applicants__c < data.Number_of_Positions__c)
          	{
            	data.Active__c = true;
            	jobList.add(data);
          	}
       	}
       	if(jobList.size()>0)
       	{
        	update jobList;
       	}
    }	
}