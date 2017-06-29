public class DailyLeadProcessor implements schedulable{
    public void execute(schedulableContext sc) {
        List<lead> leadsToUpdated = new List<lead>();
        for(lead aLead : [select id, leadsource from Lead
                          where leadsource = null limit 200]) {
            aLead.leadsource = 'Dreamforce';
            leadsToUpdated.add(aLead);
        }
        update leadsToUpdated;
    }
}