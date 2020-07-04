public class CandidateTriggerHandler {    
    public static void  checkSalaryNull(List<Candidate_Yourname__c> candidateList)
  	{
       for(Candidate_Yourname__c  data:candidateList)
       {
        	if(data.Expected_Salary__c==NULL)
            {
             	data.addError('Expected Salary field is missing');
             }
       }
  }    
  public static void checkApplicationDate(List<Candidate_Yourname__c> candidateList)  
  {
       for(Candidate_Yourname__c data:candidateList)
       {
            data.Application_Date__c=system.today()+1;
       }
  }
  public static void notApplyForInactiveJob(List<Candidate_Yourname__c> candidateList)
  {
      for(Candidate_Yourname__c data : candidateList)
      {
          string jobname=data.Job__c;
          for(Job__c job:[SELECT id from Job__c WHERE Active__c !=true])
          {
          		if(job.id==jobname)
          	 	{
            		data.addError('This job is not active So You can not apply for this job'); 
           		}
          }
    
       }
   }
}