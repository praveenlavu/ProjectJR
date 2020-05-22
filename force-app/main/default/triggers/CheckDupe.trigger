trigger CheckDupe on Contact (before insert, before update) {

List <Contact> allCusts;

 for (Contact currContact: System.Trigger.New){
     
     
      allCusts = [select id, LastName, FirstName from Contact where LastName =: currContact.LastName];
      
     if (allCusts.size() > 0){
         System.debug ('Duplicated Contacts found');
         
         for (integer i =0; i< allCusts.size(); i++){
             Contact tempContact = allCusts.get(i);
             if (tempContact.id != currContact.id){
                
                 tempContact.description = 'A duplicate Contact with the same last name has been created. Please Check'+tempContact.id;     
                  upsert tempContact; 
             }
             
             
         }
     
     }
     
    
 }

     

}