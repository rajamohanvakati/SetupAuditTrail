/**
* Name : AuditLogMonitering
* Test Class : AuditLogMonitering_UT
* Description : This Class is Used to Fetch Audit trail log Data from Salesforce abd Visualize it to UP 
* Refered in Page : AuditLogMonitering
* @author  Rajamohan Vakati
* @version 1.0
* @since   2016 July 28
*/
public class AuditLogMonitering {
    
    public Date startDate{get;set;}
    public Date endDate{get;set;}
    public String selectedAction {get;set;}
    public String sortBy {get;set;}
    public List<SetupAuditTrail> resultOfData{get;set;}
    public AuditLogMonitering(){
        startDate = System.today();
        endDate = System.today();
        selectedAction = 'Action';
        resultOfData = new List<SetupAuditTrail>();
        
    }
    public List<SelectOption> getSortByList(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Action','Action'));
        options.add(new SelectOption('CreatedById','CreatedById'));
        options.add(new SelectOption('CreatedDate','CreatedDate'));
        options.add(new SelectOption('Section','Section'));
        options.add(new SelectOption('Display','Display'));
        return options ;
    }
    public PageReference showData(){
        DateTime startD1 = Datetime.newInstanceGmt(startDate, Time.newInstance(0, 0, 0, 0));
        DateTime startE1 = Datetime.newInstanceGmt(endDate, Time.newInstance(0, 0, 0, 0));
        String startD = startD1.format('yyyy-MM-dd\'T\'hh:mm:ss\'Z\'');
        String startE = startE1.format('yyyy-MM-dd\'T\'hh:mm:ss\'Z\'');
        String q ='SELECT Action,CreatedById,CreatedBy.Name ,CreatedBy.Profile.Name,'+
            'CreatedBy.Email ,CreatedDate,DelegateUser,'+
            'Display,Id,Section FROM SetupAuditTrail '+
            'WHERE CreatedDate >' +
            startD+
            ' AND CreatedDate <' + 
            startE+ 
            ' Order by '+sortBy+' DESC' ;
        resultOfData = Database.query(q);
        return null ; 
    }
 }