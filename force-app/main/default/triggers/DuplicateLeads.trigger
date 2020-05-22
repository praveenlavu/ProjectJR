trigger DuplicateLeads on Lead (before insert,before update) {  
   List<contact> contacts;
   String description ='';
   for(Lead x : Trigger.new){
   List<Lead> lead1 =[select lastname,Description from lead where lastname=:x.lastname];
    contacts = [select lastname,Description from contact where lastname=:x.lastname];
       
       
       
       for(Integer i=0;i<trigger.new.size();i++){
       
           for(Integer j=0;j<contacts.size();j++){
       
               if(contacts[j].lastname==Trigger.new[i].lastname){
           contacts[j].description='Duplicate lead is formed with Lead name = '+Trigger.new[i].lastname;
           description+='A contact is exist with same LastName with ContactID = '+contacts[j].id+'\n';
               }
           }
       
           for(Integer j=0;j<lead1.size();j++){
       
               if(lead1[j].lastname==Trigger.new[i].lastname){
       
                   if(lead1[j].id!=Trigger.new[i].id){
                       description += 'A lead is already exist with the same Last Name with Lead id = '+lead1[j].id +'\n';
                           }
               }
           }
   trigger.new[i].description = description;
   }
   }   
   update contacts;
       }