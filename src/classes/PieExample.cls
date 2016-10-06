public class PieExample 
{
    List<Case> caseData{get;set;}
    
    public PieExample()
    {
        caseData = new List<Case>();
    }
    public List<PieData> getPieData() 
    {  
        List<PieData> data = new List<PieData>();
         
        
        String sql = 'SELECT CaseNumber, Type FROM Case';
        caseData = Database.Query(sql);
        system.debug('*****cases:'+CaseData);
        for(Case c : caseData)
            data.add(new PieData(c.CaseNumber,c.Type));
        return data;  
    }  
    
    // Wrapper class  
    public class PieData 
    {  
        public String name { get; set; }  
        public String data { get; set; }  
        
        public PieData(String name, String data) 
        {  
            this.name = name;  
            this.data = data;  
        }  
    }  

}