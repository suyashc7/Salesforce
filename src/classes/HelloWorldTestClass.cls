@isTest 
private class HelloWorldTestClass {
    static testMethod void validateHelloWorld() {
       Role__c b = new Role__c(Name='Test Role', Description__c='Test Description');
       System.debug('Price before inserting new book: ' + b.Name);

       // Insert book
       insert b;
    
       // Retrieve the new book
       b = [SELECT  Name FROM Role__c WHERE Id =:b.Id];
       System.debug('Price after trigger fired: ' + b.Name);

       // Test that the trigger correctly updated the price
       System.assertEquals('Test Role', b.Name);
    }
}