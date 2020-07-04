@isTest
public class TestCasesForCandidates {
	@isTest
    public static void whileinserting(){
        Candidate_Yourname__c c=new Candidate_Yourname__c();
        c.Name='shyam';
        c.Salutation__c='Mr.';
        c.Country__c='Australia';
        c.First_Name__c='shyam';
        c.Last_Name__c='shinde';
        c.State__c='Victoria';
        c.Status__c='Hired';
        c.Email__c='vilas@gmail.com';
        c.Job__c='a082x000001vdSC';
        
        test.startTest();
        c.Expected_Salary__c=10000;
        insert c;
       	test.stopTest();
        
        List<Candidate_Yourname__c> can=[select Name,Application_Date__c from Candidate_Yourname__c where job__c =:'a082x000001vdSC'];
        system.assertEquals(1, can.size());
        system.assertEquals(10000,c.Expected_Salary__c);
        system.assertEquals(system.today()+1,can[0].Application_Date__c);
        
    }
}