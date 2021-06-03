@IsTest
public class AppleWatchTest {
    @IsTest static void createOpportunity() {
        
        Opportunity opp = new Opportunity(
            CloseDate   = Date.today(),
            StageName   = 'Prospecting',
            Name        = 'Test 1'
        );  
        
        insert opp;
    }
}
