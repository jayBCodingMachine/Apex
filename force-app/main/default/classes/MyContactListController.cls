public class MyContactListController {
 @AuraEnabled 
    public static List<Contact> getContacts(Id recordId) {
        return [SELECT Id, FirstName, LastName, Email, Phone From Contact WHERE AccountId = :recordId];
        
    }
}