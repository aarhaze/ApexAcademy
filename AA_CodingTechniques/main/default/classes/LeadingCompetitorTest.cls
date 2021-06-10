@IsTest 
public class LeadingCompetitorTest {
    @IsTest static void LeadingCompetitorTest() {
        Opportunity opp = new Opportunity(
            Name                  = 'Test',
            CloseDate             = Date.today() + 30,
            StageName             = 'Prospecting',
            Competitor_1__c       = 'Google',
            Competitor_1_Price__c = 500,
            Competitor_2__c       = 'Oracle',
            Competitor_2_Price__c = 400,
            Competitor_3__c       = 'Salesforce',
            Competitor_3_Price__c = 300
        );    
        insert opp;
        
    }
}
