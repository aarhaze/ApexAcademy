trigger WarrantySummary on Case (before insert) {

    for (Case myCase : Trigger.new) {
        Date purchaseDate           = myCase.Product_Purchase_Date__c;
        DateTime createdDate        = Datetime.now();
        Integer warrantyDays        = myCase.Product_Total_Warranty_Days__c.intValue();
        Decimal warrantyPercentage  = purchaseDate.daysBetween(Date.today()) / myCase.Product_Total_Warranty_Days__c;
        Boolean hasExtendedWarranty = myCase.Product_Has_Extended_Warranty__c;
        String extWarranty          = hasExtendedWarranty ? 'Customer has extended warranty on this item.' : 'Customer DOES NOT have an extended warranty!';

        myCase.Warranty_Summary__c  = 'Product purchased on ' + purchaseDate.format() 
                                    + ' and case created on ' + createdDate.format() + '.\n'
                                    + 'Warranty is for '      + warrantyDays 
                                    + ' days, and is '        + warrantyPercentage * 100 + '% through the period.\n'
                                    + 'Extended warranty: '   + hasExtendedWarranty + '\n'
                                    + extWarranty;
    }
}