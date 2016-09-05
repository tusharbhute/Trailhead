public class ObjectDescribeController 
{
    public string objName{get;set;}
    public list<FieldInfo> tableList{get;set;}
    public Boolean tFlag{get;set;}
    
    public ObjectDescribeController()
    {
        tableList = new List<FieldInfo>();
        tFlag = false;
    }
    
    Public class FieldInfo
    {
        //Public String description;
        Public String Label{get;set;}
        Public String Length{get;set;}
        Public String APIName{get;set;}
        Public String fieldType{get;set;}
        
        public FieldInfo() {
        
        }
    }
    
    
    public list<SelectOption> getObjNames()
    {
        List<Schema.sObjectType> gd = Schema.getGlobalDescribe().values();
        
        List<SelectOption> options = new List<SelectOption>();
        
        for(Schema.sObjectType obj : gd)
        {
            if(!obj.getDescribe().customSetting)
                options.add(new SelectOption(obj.getDescribe().getName(), obj.getDescribe().getLabel()));
        }
        
        return options;
    }
    
    
    
    public pageReference RetrieveFieldDetails()
    {
        //List<FieldInfo> fInfo = new List<FieldInfo>();
        tableList.clear();
        system.debug('*****objName:'+objName);
        SObjectType objType = Schema.getGlobalDescribe().get(objName);
        Map<String,Schema.SObjectField> mfields = objType.getDescribe().fields.getMap();
       system.debug('*****mFields:'+mfields); 
       if (mfields != null)
       {
            for (Schema.SObjectField ft : mfields.values())  // loop through all field tokens (ft)
            {
                FieldInfo f = new FieldInfo();
                Schema.DescribeFieldResult fd = ft.getDescribe(); // describe each field (fd)
                f.Label = String.valueOf(fd.getLabel());
                f.Length = String.valueOf(fd.getLength());
                f.APIName = String.valueOf(fd.getName());
                f.fieldType = String.valueOf(fd.getSOAPType());
                tableList.add(f);
            }
            
        }
        
        if(tableList != NULL && tableList.size()>0)
        {
            tFlag = true;
            //return fInfo;
            
        }
        system.debug('*****tFlag:'+tflag);
        system.debug('*****tableList:'+tableList);
        return null;
        
    }
    
}