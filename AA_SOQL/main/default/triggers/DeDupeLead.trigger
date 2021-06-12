trigger DeDupeLead on Lead (before insert) {

    Group groupQueue = [SELECT Id 
                          FROM Group
                         WHERE DeveloperName = 'Data_Quality'
                           AND Type = 'Queue'
                         LIMIT 1];

    for (Lead myLead : Trigger.new) {

        List<Contact> matchingCons = [SELECT Id
                                        FROM Contact
                                       WHERE Email = :myLead.Email];

        if (!matchingCons.isEmpty()) {
            myLead.OwnerId     = groupQueue.Id;
            myLead.Description = matchingCons.toString();
        } 
    }
}