public class customPageController 
{
    public string accName{get;set;}
    public string accPhone{get;set;}
    public string accFax{get;set;}
    public boolean accFlag{get;set;}
    
    public string conFirstName{get;set;}
    public string conLastName{get;set;}
    public string conEmail{get;set;}
    
    Public Account a = new Account();
    Public Contact c = new Contact();
    
    public customPageController()
    {
       accFlag = false;
        
    }
    
    public pageReference insertAcc()
    {
        system.debug('*****Acc Name:'+accName);
        a.Name = accName;
        a.Phone = accPhone;
        a.Fax = accFax;
        
        try
        {
            insert a;
            accFlag = true;
        }
        catch(exception e)
        {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, e.getMessage());
        }
        
        return null;
    }
    
    public pageReference insertCon()
    {
        c.FirstName = conFirstName;
        c.LastName = conLastName;
        c.Email = conEmail;
        c.AccountId = a.Id;
        
        try
        {
            insert c;
        }
        catch(exception e)
        {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, e.getMessage());

        }
        return new pageReference('/'+a.Id); 
    }

}