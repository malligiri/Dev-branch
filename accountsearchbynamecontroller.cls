public class accountsearchbynamecontroller {
    public integer accnamesize {set; get;}
    public string accnamename {set; get;}
    public list<Account> acclist {set; get;}
    public list<opportunity> opplist {Set;get;}
    
    public  void searchaccountlist()  {
        if(accnamename!=null && accnamename!='') {
            accnamename+='_%_';
            acclist=new list<Account>();
            acclist=[select id,name,phone,email__c,pincode__c,contactsize__c,industry,annualrevenue,(select id,name from contacts) from account where name like :accnamename];
            system.debug(acclist);
            
            if(acclist.size()>0)
            {accnamesize=acclist.size();
                apexpages.addMessage(new ApexPages.message(apexpages.severity.confirm,'Account records fetched succesfully'));
            }
            else
            {
                 apexpages.addMessage(new ApexPages.message(apexpages.severity.Error,'Please provide the right inputs'));
            }
        }
    }
}
