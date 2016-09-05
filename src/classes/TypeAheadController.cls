public class TypeAheadController 
{
    Public String Owner{get;set;}
    
    public TypeAheadController()
    {
        
    }
    
    @RemoteAction
    public static List<User> searchUserName(String searchTerm) {
         
         system.debug('*****search term:'+searchTerm);
         list<User> Usr_Records = new list<User>();
         set<String> UniquenameSet = new Set<String>(); 
         list<User> User_FilteredRecords = new list<User>();
     
        
         String UserSoql = 'Select ' ; 
         UserSoql += 'Username, Name FROM User';
        
         UserSoql += ' where Username  like \'%' + String.escapeSingleQuotes(searchTerm) + '%\' ';
        
        
         UserSoql += '  ORDER BY username ASC  limit 10';
        
        try{ 
               Usr_Records = Database.query(UserSoql);   
                if ( Usr_Records.size() >0 ) 
                 { 
                     For( User usr: Usr_Records) 
                         { 
                           if(!UniquenameSet.contains(usr.username))
                            { 
                              UniquenameSet.add(usr.username);
                              User_FilteredRecords.add(usr);
                            } 
                         }
                 }
                
           }
         catch(exception e)
           {
            system.debug(e.getmessage());
           }    
        
        
        return User_FilteredRecords;
   }
    
    

}