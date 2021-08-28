@isTest
private class TestVerifyDate {
    
    
    
    @isTest static void CheckDateTest(){
        Date tD = Date.today();
        Date daysLater = tD.addDays(25);  
        
        Date test = VerifyDate.Checkdates(td, daysLater);
        
        System.assertEquals(daysLater, test); 
    }
    
    @isTest static void CheckDateEndTest(){
        Date tD = Date.today();
        Date daysLater = tD.addDays(32); 
        Date actual = td.addDays(6);
        
        Date test = VerifyDate.Checkdates(td, daysLater);
        
        System.assertEquals(actual, test);
    }
    

}