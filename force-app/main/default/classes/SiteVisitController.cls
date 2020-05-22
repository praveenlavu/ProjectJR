public class SiteVisitController {
public List<Site_Expenses__c > selectedexpense{get;set;}    
public List<wrapexpense > ep {get;set;}
public List<site_Visits__c> sitelist{get;set;}
public List<Site_Expenses__c > ex{get;set;} 
public  Site_Expenses__c  exp {get;set;}

public  SiteVisitController(){
ep = new List<wrapexpense>();
exp = new Site_Expenses__c ();
ex= new List<Site_Expenses__c >();
//sitelist= [select id,Name from site__c];
Site_visits__c s = [select id,name,(select id,name,Amount__c,Type_Of_Payment__c
                              from Site_Expenses__r) 
                    from site_Visits__c
                    where id =: ApexPages.currentPage().getParameters().get('id')];
       ex = s.Site_Expenses__r;
    if(ep!=null){
 for(Site_Expenses__c  exp: ex){
 ep.add(new wrapexpense(exp));
 } 
 }  
 
}

public void saveu() {
    system.debug(ex);
        upsert ex;
    }


public void del() {
    for(wrapexpense wrobj : ep){
    if(wrobj.selected==true){
      delete wrobj.exs;
    } 
    
   
    }
    }



public  void saveex() {
 insert exp;
  if(ep!=null){
 
 ep.add(new wrapexpense(exp));
 } 
 exp = new Site_Expenses__c ();
  } 
   
   
public class wrapexpense {
        public Site_Expenses__c  exs {get; set;}
        public Boolean selected {get; set;}
       
 
        public wrapexpense (Site_Expenses__c  es) {
            exs = es;
            selected = false;
            
        }


}

   }