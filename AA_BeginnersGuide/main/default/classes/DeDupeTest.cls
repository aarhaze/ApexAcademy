@IsTest
public class DeDupeTest {
    @IsTest static void DeDupeTest() {
        
        // Create new Account
        Account acc = new Account(
            Name = 'Test'
        );

        insert acc;
    }
}
