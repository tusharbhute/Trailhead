trigger recType on Account (before insert) {
    
    
    for(Account a : trigger.new)
    {
        if(a.name == '')
            system.debug('Account mein panga hai bidu');
    }

}