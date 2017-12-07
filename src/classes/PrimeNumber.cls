public with sharing class AssignmentSet2 {
	//Function to check Prime Number
    public static void checkPrimeNumber(Integer value) {
        Integer flag = 0;
        if (value == 0) {
            System.debug('Value cannot be ' + value);
        } else {
            for (Integer i = 2; i <= value / 2; ++i) {
                // condition for nonprime number
                if (math.mod(value, i) == 0) {
                    flag = 1;
                    break;
                }
            }
        }
        if (flag == 0)
            System.debug('The number ' + value + ' is Prime Number');
        else
            System.debug('The number ' + value + ' is Not a Prime Number');
    }
	//Function to check String is Plaindrome or Not
    public static void isPlaindrome(String value) {
		Integer flag = 0;
        String rev = value.reverse();
    
        if (value.equalsIgnoreCase(rev)) {
            System.debug('The string ' + value + ' is Plaindrome String');
        } else {
            System.debug('The string ' + value + ' is Not Plaindrome');
        }
    }
    //Function to find length of string without using lenght() function
    public static void stringLenght(String value) {
    	Integer length = 0;
    	
    	List<Integer> sourceChars = value.getChars();
    	for(Integer c : sourceChars){
    		length++;
    	}
    	System.debug('Length is ' + length);
    }
    //Function to find unique numbers in an array
    //Integer [] a=new Integer[]{10,20,30,40,40,50,30,60};
    public static void uniqueNumbers(List<Integer> numberList) {
    	Set<Integer> uniqueValues = new Set<Integer>(numberList);
    	System.debug('Unique Values are: ' + uniqueValues);
    }
    //replace every occurance of 'a' char in every string
    //String [] a=new String[]{'suyash','test','amol'};
	//AssignmentSet2.stringReplace(a,'a','A');
    public static void stringReplace(List<String> stringList ,String value, String replacement) {
    	System.debug('Before Replacement' + stringList);
		for(Integer i = 0; i < stringList.size() ; i++){
    		stringList[i] = stringList[i].replace(value, replacement);
    	}
    	System.debug('After Replacement' + stringList);
    }   
}