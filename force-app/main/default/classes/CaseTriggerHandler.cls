public class CaseTriggerHandler {
    public static void relateContacts(List<Case> newCases) {
        //creates a list to store emails
        List<String> contactEmails = new List<String>();
        //loop through the list of cases that was passed through
        for(Case c : newCases) {
            //check to see if the case does not have a contactID & if the case has an attached email
            if(c.ContactId == null && c.SuppliedEmail != null) {
            // add the attached email from case record to the email list    
                contactEmails.add(c.SuppliedEmail);
            }
        }
        // gather all the contact records where email is in the contactEmails list
        List<Contact> parentContacts = [SELECT Id, Email FROM Contact WHERE Email in :contactEmails];
        //create a map of email address and Ids.
        Map<String, Id> emailIdMap = new Map<String, Id>();
        // loop through the list of contacts where email is in the contactEmails list
        for(Contact c : parentContacts) {
            // put the reocrds into the map where the email is the key and Id is the value
            emailIdMap.put(c.Email, c.Id);
        }
        
        // loop through the new cases that were passed through
        for(Case c : newCases) {
            // if the case doesnt have a contact ID
            if(c.ContactId == null) {
                //assign a contact ID by searching through emailIdMap where the email from case is the key
                c.ContactId = emailIdMap.get(c.SuppliedEmail);
            }
        }
    }
}