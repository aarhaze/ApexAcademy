@IsTest
public with sharing class WarrantySummaryTest {
    @IsTest static void WarrantySummaryTest() {
        Case myCase = new Case(
            Product_Purchase_Date__c         = Date.today() - 1,
            Product_Total_Warranty_Days__c   = 10,
            Product_Has_Extended_Warranty__c = true
        );

        insert myCase;
    }
}
