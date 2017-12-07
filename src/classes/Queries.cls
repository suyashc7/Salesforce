public with sharing class Queries {  
	 
    public static void two() {
    	Opportunity[] oppList = [SELECT AccountId,Id FROM Opportunity WHERE AccountId != null AND IsClosed = true];
    	List<String> oppId = new List<String>();
    	List<String> accountId = new List<String>();
    	Map<String, String> mapping = new Map<String, String>();
        // loop through them and update the Description field
        for (Opportunity record : oppList) {
            accountId.add(record.AccountId);
			oppId.add(record.ID);
			mapping.put(record.ID,record.AccountId);
        }
        Set<String> uniqueValues = new Set<String>(accountId);
        System.debug('Opportunity IDs : ' + oppId);
        System.debug('Account IDs : ' + accountId);
        System.debug('Mapping  : ' + mapping);
    }
    
    public static void three() {
    	Integer count = [SELECT count() FROM Account WHERE Name LIKE 'a%'];
    	Account[] acctList = [SELECT Name FROM Account WHERE Name LIKE 'a%'];
    	for (Account record : acctList) {
    		record.Name = 'Updated via update DML operation';
    	}
    	update acctList;
    	System.debug('Count  : ' + count);
    }
    
    public static void five() {
    	List<Campaign> campDesc = new List<Campaign>();
    	Campaign[] campAsc = [SELECT Id,Name FROM Campaign ORDER BY Name ASC NULLS FIRST LIMIT 10];
    	for(Integer i = campAsc.size() - 1; i >= 0; i--){
    		campDesc.add(campAsc[i]);
    	}
    	System.debug('Sort ASC : ' + campAsc);
    	System.debug('Sort DESC : ' + campDesc);
    }
    
    public static void six() {
    	Contact[] contactList = [SELECT Id,Name FROM Contact WHERE LastModifiedDate = TODAY];
    	System.debug(contactList);
    }
    
    public static void seven(){
    	String accName = 'Edge Communications';
		List<sObject> sobjList = Database.query('SELECT Id FROM Account WHERE Name = :accName');
		System.debug(sobjList);
		
		String searchquery='FIND\'Eternus*\'IN ALL FIELDS RETURNING Account(id,name),Contact, Lead'; 
		List<List<SObject>>searchList=search.query(searchquery);
		System.debug(searchList);
    }
    
    //Get Accounts by record type
    public static void one(){
    	Account[] accounts = [SELECT RecordTypeId, Id, Name FROM Account WHERE RecordTypeId != null];
    	//RecordType[] recordTypes = [SELECT Id FROM RecordType];
    	Map<Id, List<Account>> mapping = new Map<Id, List<Account>>();
    	for(Account record : accounts){
    		if(mapping.containsKey(record.RecordTypeId)){
    			mapping.get(record.RecordTypeId).add(record);
    		}else{
    			mapping.put(record.RecordTypeId, new List<Account> {record});
    		}
    	}
    	System.debug(mapping);
    }
    
    public static void four() {
    	Account[] acctList = [SELECT Id FROM Account];
    	Opportunity[] oppList = [SELECT AccountId FROM Opportunity];
    	List<Id> oppIds = new List<Id>();
    	Map<Id, List<Id>> mapping = new Map<Id, List<Id>>();
    	for(Account record : acctList){
    		for(Opportunity oppRecord : oppList){
    			if(record.Id == oppRecord.AccountId){
    				oppIds.add(oppRecord.AccountId);
    			}
    		}
    		mapping.put(record.Id,oppIds);
    		oppIds = new List<Id>();	
    	}
    	System.debug(mapping);
    }
    
    
}