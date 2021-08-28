public class ContactUtility {
    public static void viewContacts(){
     List<Contact> listOfContacts = [SELECT FirstName, LastName FROM Contact];
        
        for(Contact con : listOfContacts){
          String fullName = 'FirstName: ' + con.FirstName + ', LastName: ' + con.LastName;  
           System.debug(fullName);
        }
        
    }

}