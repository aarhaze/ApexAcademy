trigger WarrantySummary on Case (before insert) {
    
    for (Case myCase : Trigger.new) {

        Date purchaseDate           = myCase.Product_Purchase_Date__c;
        DateTime createdDate        = Datetime.now();
        Integer hasWarrantyDays     = myCase.Product_Total_Warranty_Days__c == null ? 0 : myCase.Product_Total_Warranty_Days__c.intValue();
        //Integer warrantyDays        = myCase.Product_Total_Warranty_Days__c.intValue();
        Boolean hasExtendedWarranty = myCase.Product_Has_Extended_Warranty__c;
        String extWarranty          = hasExtendedWarranty ? 'Customer has extended warranty on this item.' : 'Customer DOES NOT have an extended warranty!';

        if (purchaseDate == null) {
            myCase.Warranty_Summary__c  = 'No products have been purchased.';
            
        } else {
            Decimal warrantyPercentage  = purchaseDate.daysBetween(Date.today()) / myCase.Product_Total_Warranty_Days__c;
            myCase.Warranty_Summary__c  = 'Product purchased on ' + purchaseDate.format() 
                                        + ' and case created on ' + createdDate.format() + '.\n'
                                        + 'Warranty is for '      + hasWarrantyDays 
                                        + ' days, and is '        + warrantyPercentage * 100 + '% through the period.\n'
                                        + extWarranty;
            }
        }
}