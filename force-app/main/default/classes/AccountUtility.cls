public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList = [SELECT AnnualRevenue, Name FROM Account];
        
        for(Account acc : accountsList){
           String acctRev = 'Account Name: ' + acc.Name + ', Annual Revanue: ' + acc.AnnualRevenue;
            
            System.debug(acctRev);
        }
    }
}