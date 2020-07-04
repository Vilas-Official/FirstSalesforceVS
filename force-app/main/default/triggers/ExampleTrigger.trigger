trigger ExampleTrigger on Job__c (after insert, after update) {
    
        Job__c j = Trigger.New[0];
        Datetime moddate=j.LastModifiedDate;
    if(j.Number_of_Positions__c==j.Hired_Applicants__c){
        EmailManager.sendMail('vilasdhoble09@gmail.com', 'No Job positions left', 'All required candidate has been hired for this job on '+
                    moddate + '.');
    }
}