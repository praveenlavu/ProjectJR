public class AccountUtils {
    
   public static void updateLocationField() {
        List<Account> accList = [SELECT ID, BillingLatitude, BillingLongitude, Location__c from Account];
        for(Account a : accList) {
            if(a.Location__c == null) {
                if(a.BillingLatitude != null || a.BillingLongitude != null) {
                   	a.Location__Longitude__s = a.BillingLongitude;
                    a.Location__Latitude__s = a.BillingLatitude;
                    System.debug('Updated Account - ID: '+a.Id+' Longitude: '+a.Location__Longitude__s+
                                 ' Latitude: '+a.Location__Latitude__s);
                }
            }
        }
        update accList;
    }
}