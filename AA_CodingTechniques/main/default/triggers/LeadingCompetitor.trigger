trigger LeadingCompetitor on Opportunity (before insert, before update) {
    for (Opportunity opp : Trigger.new) {
        
        // Create
        List<Decimal> amountList = new List<Decimal>();
        List<String> competitorList = new List<String>();


        // Check fields
        if (opp.Competitor_1__c != null && opp.Competitor_1_Price__c != null) {
            amountList.add(opp.Competitor_1_Price__c);
            competitorList.add(opp.Competitor_1__c);
        }
        if (opp.Competitor_2__c != null && opp.Competitor_2_Price__c != null) {
            amountList.add(opp.Competitor_2_Price__c);
            competitorList.add(opp.Competitor_2__c);
        }
        if (opp.Competitor_3__c != null && opp.Competitor_3_Price__c != null) {
            amountList.add(opp.Competitor_3_Price__c);
            competitorList.add(opp.Competitor_3__c);
        }

        if (amountList != null && competitorList != null) {

            // Set default value
            Decimal amount   = 0.00;
            Integer position = 0;

            for (Integer i = 0; i < amountList.size(); i++) {
                if (amountList.get(i) > amount) {
                    amount = amountList.get(i);
                    position = i;
                }
            }
            opp.Leading_Competitor__c        = competitorList.get(position);
            opp.Leading_Competitors_Price__c = amountList.get(position);
        }
    }
}