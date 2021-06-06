trigger CheckSecretInformation on Case (after insert) {

    // Create the collections
    Set<String> secretKeywords = new Set<String> {
        'Credit Card', 
        'Social Security',
        'SSN',
        'Passport',
        'Bodyweight'
    };
    Set<String> secretKeywordsFound = new Set<String>();
    List<Case> childCases = new List<Case>();
    Map<Id, Set<String>> childCasesFound = new Map<Id, Set<String>>();
    String subject = 'Warning! Parent Case Contains Secret Words';

    for (Case myCase : Trigger.new) {

        // Check if cases contain any secret words
        if (myCase.Description != null && myCase.Subject != subject) {
            for (String keyword : secretKeywords) {
                if (myCase.Description.containsIgnoreCase(keyword)) {
                    secretKeywordsFound.add(keyword);
                }
            }
        } 

        if (!secretKeywordsFound.isEmpty()) {
            childCasesFound.put(myCase.Id, new Set<String>(secretKeywordsFound));   
            secretKeywordsFound.clear();          
        }     
    }    

    System.debug('===childCasesFound Size: ' + childCasesFound.size()); 
    System.debug('===childCasesFound Keyset: ' + childCasesFound.keySet()); 

    // Create child cases
    if (!childCasesFound.isEmpty()) {
        for (Id caseMapId : childCasesFound.keySet()) {

            Case childCase = new Case(
                Origin = 'Apex',
                ParentId = caseMapId,
                Subject = subject,
                IsEscalated = true,
                Priority = 'High',
                Description = 'Parent case contains these words: \n' + childCasesFound.get(caseMapId).toString()
            ); 
            System.debug('===childCase added: ' + childcase);
            childCases.add(childCase);
        }
    }

    if (!childCases.isEmpty()) {
        System.debug('===childCases size: ' + childCases.size());
        System.debug(childCases.toString());
        insert childCases;
    }
}