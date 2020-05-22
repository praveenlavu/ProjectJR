@isTest
private class BatchLeadConvert_Test{
  @testSetup
  static void setupTestData(){
    test.startTest();
    List<Lead> lead_Obj = new List<Lead>{
    new Lead(LastName = 'LastName350', Company = 'Company713', Status = 'Open - Not Contacted', IsConverted = false, IsUnreadByOwner = false, SFSSDupeCatcher__Override_DupeCatcher__c = false),
    new Lead(LastName = 'LastName404', Company = 'Company276', Status = 'Open - Not Contacted', IsConverted = false, IsUnreadByOwner = false, SFSSDupeCatcher__Override_DupeCatcher__c = false),
    new Lead(LastName = 'LastName612', Company = 'Company574', Status = 'Open - Not Contacted', IsConverted = false, IsUnreadByOwner = false, SFSSDupeCatcher__Override_DupeCatcher__c = false),
    new Lead(LastName = 'LastName142', Company = 'Company509', Status = 'Open - Not Contacted', IsConverted = false, IsUnreadByOwner = false, SFSSDupeCatcher__Override_DupeCatcher__c = false),
    new Lead(LastName = 'LastName198', Company = 'Company823', Status = 'Open - Not Contacted', IsConverted = false, IsUnreadByOwner = false, SFSSDupeCatcher__Override_DupeCatcher__c = false)
};
    Insert lead_Obj;
    test.stopTest();
  }
    static testMethod void testBatch(){
    BatchLeadConvert obj01 = new BatchLeadConvert();
    Database.executeBatch(obj01, 200);
}
}