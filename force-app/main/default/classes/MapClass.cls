public class MapClass {

    public List<String> listOfAddresses {get; set;}
    public List<Account> acct{get;set;}
    public String search{get;set;}
   
  
    public MapClass() {
    listOfAddresses = new List<String>();
       }
    public PageReference doSearch(){
    
    acct = [select name,billingstreet, billingcity From Account where billingcity = :search];
      for(Account a : acct) {
           String s = '\"'+a.billingstreet+','+a.BillingCity+'\"';
           listOfAddresses.add(s);
           system.debug(s);
           
           }
     return null; 
}
}