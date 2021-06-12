@IsTest 
public with sharing class DeDupeTriggerTest {
        
    @IsTest static void createLeadNoDupes(){    

        String leadOwner = UserInfo.getUserId(); // Because it's used in multiple locations
        String result;

        Lead myLead     = new Lead(
            FirstName   = 'A',
            LastName    = 'ha',
            Company     = 'Hazer',
            Email       = 'aar@email.com',
            Description = 'Here it is',
            OwnerId     = leadOwner
        );
        insert myLead;

        Lead latestLead = [SELECT FirstName,
                                  LastName,
                                  Company,
                                  Email,
                                  Description,
                                  OwnerId
                             FROM Lead
                            WHERE Id = :myLead.Id];
        System.debug(latestLead);

        /*result =*/ System.assertEquals(UserInfo.getUserId(), leadOwner);
        //System.debug(result);
        /*result =*/ System.assertEquals(myLead.Description, latestLead.Description);
        //System.debug(result);
        
    }
}
