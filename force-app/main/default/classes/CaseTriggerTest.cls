@isTest
private class CaseTriggerTest {
    
    @TestSetup
    static void makeData(){
        //create a list of contacts
      List<Contact> testContacts = new List<Contact>();
     
      //create a for loop to create contact data 
      for(Integer i = 0; i < 200; i++){
    //add newly created contact to the testContact lis
        Contact c = new Contact(LastName = i + 'test', Email = i + 'EmailTest@test.com');
          testContacts.add(c);  
      }
      // insert contacts
      insert testContacts;

    }

    @IsTest  static void singleCaseHasContact() {

      List<String> contactList = new List<String>();
      for(List<Contact> contacts : [SELECT Id FROM Contact]){
         for(Contact c : contacts){
             contactList.add(c.Id);
         }
      }
      Case caseTest = new Case(Status = 'New', Origin = 'Web', SuppliedEmail = '0EmailTest@test.com');
      Test.startTest();
      insert caseTest;
      Test.stopTest();

      Integer numOfCases = 0;
      List<Case> newCase = [SELECT ContactId FROM Case];
      for(Case c: newCase){
          if(contactList.contains(c.ContactId)){
              numOfCases++;
          }
      }
      System.assertEquals(1, numOfCases);
    }

    @isTest  static void singleCaseNoContact() {
     
        List<String> contactList = new List<String>();
      for(List<Contact> contacts : [SELECT Id FROM Contact]){
         for(Contact c : contacts){
             contactList.add(c.Id);
         }
      }
      Case caseTest = new Case(Status = 'New', Origin = 'Web', SuppliedEmail = 'NewEmail@test.com');
      Test.startTest();
      insert caseTest;
      Test.stopTest();

      Integer numOfCases = 0;
      List<Case> newCase = [SELECT ContactId FROM Case];
      for(Case c: newCase){
          if(contactList.contains(c.ContactId)){
              numOfCases++;
          }
      }
      System.assertEquals(0, numOfCases);
        
    }


    @isTest static void bulkCaseHasContact() {

        List<String> contactList = new List<String>();
        for(List<Contact> contacts : [SELECT Id FROM Contact]){
           for(Contact c : contacts){
               contactList.add(c.Id);
           }
        }
        

    List<Case> testCases = new List<Case>();

    for(Integer i = 0; i < 200; i++){
        Case c = new Case(Status = 'New', Origin = 'Web', SuppliedEmail = i + 'EmailTest@test.com');
        testCases.add(c);
    }

    Test.startTest();
    insert testCases;
    Test.stopTest();

    Integer numOfCases = 0;
    List<Case> newCase = [SELECT ContactId FROM Case];
    for(Case c: newCase){
          if(contactList.contains(c.ContactId)){
              numOfCases++;
          }
    }
    System.assertEquals(200, numOfCases);


    }

    @isTest static void bulkCaseNoContact() {

    
    
    List<String> contactList = new List<String>();
    for(List<Contact> contacts : [SELECT Id FROM Contact]){
       for(Contact c : contacts){
           contactList.add(c.Id);
       }
    }
        

    List<Case> testCases = new List<Case>();

    for(Integer i = 0; i < 200; i++){
        Case c = new Case(Status = 'New', Origin = 'Web', SuppliedEmail = i + 'NewEmail@test.com');
        testCases.add(c);
    }

    Test.startTest();
    insert testCases;
    Test.stopTest();

    Integer numOfCases = 0;
    List<Case> newCase = [SELECT ContactId FROM Case];
    for(Case c: newCase){
          if(contactList.contains(c.ContactId)){
              numOfCases++;
          }
    }
    System.assertEquals(0, numOfCases);

    
        
    }
    
    
   
}