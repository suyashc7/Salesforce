public virtual class OOPS {
	
	Integer i;
	private static Integer DEFAULT_SIZE = 150;
	
	public OOPS(){
		i = 0;
		System.debug(i);
		callStaticVar();
	}
	
	public virtual void write() {
        System.debug('Writing some text.');
    }
	
	public OOPS(Integer i){
		i = i;
		System.debug(i);
		callStaticVar();
	}
	
    public static void callStaticVar(){
    	System.debug('Before : ' + DEFAULT_SIZE);
    	DEFAULT_SIZE = 100;
    	System.debug('After : ' + DEFAULT_SIZE);
    } 
}