public class AccountHandler {
    public static Account insertNewAccount(String forAccountName){
        Account acnt=new Account();
        acnt.Name=forAccountName;
        try{
			insert acnt; 
        }
        catch(DmlException e){
            System.debug('A DML exception has occurred: ' +
                e.getMessage());
            return null;
        }
        return acnt;
    }
}