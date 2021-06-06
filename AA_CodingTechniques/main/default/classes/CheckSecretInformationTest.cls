@Istest
public with sharing class CheckSecretInformationTest {
    @IsTest static void CheckSecretInformationTest() {
        List<Case> caseList = new List<Case>();

        Case newCase1 = new Case(
            Origin = 'Phone',
            Description = 'SSN and Passport and Bodyweight'
        );
        caseList.add(newCase1);

        Case newCase2 = new Case(
            Origin = 'Phone',
            Description = 'Credit Card and Social Security and Passport'
        );
        caseList.add(newCase2);

        insert caseList;
    }
}
