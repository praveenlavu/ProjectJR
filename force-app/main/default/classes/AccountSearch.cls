public class AccountSearch {
public List<wrapAccount> wrapAccountList {get; set;}
    public List<String> listOfAddresses {get; set;}
    public List<Account> acct{get;set;}
    public String search{get;set;}
    public List<Account> selectedAccounts{get;set;}
     public date d {get;set;}
  public String msg{get;set;}
    public AccountSearch() {
    selectedAccounts = new List<Account>();
       }
    
     public PageReference doSearch(){
    listOfAddresses = new List<String>();
     wrapAccountList = new List<wrapAccount>();
    if(wrapAccountList != null){
    
    acct = [select name,billingstreet, billingcity From Account where billingcity = :search];
      for(Account acb : acct) {
      
           String s = '\"'+acb.billingstreet+','+acb.BillingCity+'\"';
           listOfAddresses.add(s);
           system.debug(s);
           wrapAccountList.add(new wrapAccount(acb));
           }
           
     
     
} return null;
}

public void getSelect() {
    System.debug(wrapAccountList);
}
  
  
public void submit() {

System.debug(wrapAccountList);
    
   List<site_visits__c> sitelist = new List<site_visits__c>();
   
    if(d==null){
    msg = 'Date is missing';
    }
        for(wrapAccount wrapAccountObj : wrapAccountList) {
        System.debug(wrapAccountObj);
            if(wrapAccountObj.selected == true && d != null ) {
            site_visits__c si = new site_visits__c();
             si.name=wrapAccountObj.acc.Name;
            si.VisitDate__c = d;
            sitelist.add(si);
            system.debug(si);
           selectedAccounts.add(wrapAccountObj.acc);
               system.debug(selectedAccounts);
     }
            }
            
            insert sitelist;
             
             }

// this class contains both boolens and sobjects
 public class wrapAccount {
        public Account acc {get; set;}
        public Boolean selected {get; set;}
       
 
        public wrapAccount(Account a) {
            acc = a;
            selected = false;
            
        }


}

}