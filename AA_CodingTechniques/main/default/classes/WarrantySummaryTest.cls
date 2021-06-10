@IsTest
public with sharing class WarrantySummaryTest {
    @IsTest static void WarrantySummaryTestWithData() {
        Case myCase = new Case(
            Origin = 'Phone',
            Product_Purchase_Date__c         = Date.today() - 1,
            Product_Total_Warranty_Days__c   = 10,
            Product_Has_Extended_Warranty__c = true
        );

        insert myCase;
        System.debug('===Inserted myCase');
    }

    @IsTest public static void WarrantySummaryTestNoData() {
        Case caseNoData = new Case(
            Origin = 'Phone'
        );
        insert caseNoData;
        System.debug('===Inserted caseNoData');
    }
}
