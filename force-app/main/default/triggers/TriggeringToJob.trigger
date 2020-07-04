trigger TriggeringToJob on Job__c (before insert){
    if(Trigger.isBefore && Trigger.isDelete)
    {
      //---T3
       for(Job__c job:Trigger.Old){
           if(job.Active__c == true)
           {
            job.addError('This Job is active and can not be deleted');
           }
       }
    }  
    if(Trigger.isAfter && Trigger.isInsert)
    {        
     Job__c job3 = Trigger.New[0];
     if(job3.Number_of_Positions__c==job3.Hired_Applicants__c)
     {
        EmailManager.sendMail('vilasdhoble09@gmail.com','Position','All required candidate has been hired for this job on'+ job3.LastModifiedDate.Date()  );
     }       
     //  -----
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
    //----
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
    //---
    }    
    if(Trigger.isAfter && Trigger.isUpdate)
    {        
         Job__c job3 = Trigger.New[0];
     if(job3.Number_of_Positions__c==job3.Hired_Applicants__c)
      { 
       EmailManager.sendMail('cgirhepunje95@gmail.com','Position','All required candidate has been hired for this job on'+ job3.LastModifiedDate.Date()  );
       }
         //  -----
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
    //----
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
    //---
   }
}