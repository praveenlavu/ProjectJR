public with sharing class ContactSearch
{
    public List<Contact> contacts { get; set; }
    public String name { get; set; }
    public String mailingState { get; set; }
    public ContactSearch()
    {
        contacts = new List<Contact>();
    }
    public PageReference searchContacts()
    {
        contacts = [select Id,Name,MailingState
                     from Contact
                    where Name = :name
                    or MailingState = :mailingState];
        return null;
    }
}