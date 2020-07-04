trigger revenueTrigger on Account (before insert) {
    if(annualReveOnAcc__c.getInstance().annualReveCheckOnAccnt__c==false){
            Account account= Trigger.New[0];
            if(account.AnnualRevenue==NULL)
            {
                account.addError('Revenue should not be null');            
            }
    }
}