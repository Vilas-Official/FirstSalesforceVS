public class JobAllTriggerClass {
    public static void beforeDelete(){
        for(Job__c jj:(List<Job__c>)trigger.old){
            if(jj.Active__c==true){
                jj.addError('This job is active and can not be deleted');
            }
        }
    }
    public static void afterInsertUpdate(){
        List<Job__c> jobList=New List<Job__c>();        
        for(Job__c j:[SELECT Hired_Applicants__c,Number_of_Positions__c,Active__c FROM Job__c WHERE Active__c =true]){
            if(j.Hired_Applicants__c==j.Number_of_Positions__c){
                j.Active__c=false;
                jobList.add(j);
            }
        }
        if(jobList.size()>0){
            update jobList;            
        }
    }
    public static void afterInsertafterUpdate(){
        for(Job__c jj:(List<Job__c>)trigger.New){
            DateTime modedate=jj.LastModifiedDate;
            if(jj.Number_of_Positions__c==jj.Hired_Applicants__c){
                EmailManager.sendMail('vilasdhoble09@gmail.com','No further Positions','All required candidate has been hired for this job on'+ modedate+'.');
                
            }
        }
    }
    public static void afterUpdate(){
        List<Job__c> jobList=New List<Job__c>();        
        for(Job__c j:[SELECT Hired_Applicants__c,Number_of_Positions__c,Active__c FROM Job__c WHERE Active__c !=true]){
            if(j.Hired_Applicants__c < j.Number_of_Positions__c){
                j.Active__c=true;
                jobList.add(j);
            }
        }
        if(jobList.size()>0){
            update jobList;            
        }
    }
    
}