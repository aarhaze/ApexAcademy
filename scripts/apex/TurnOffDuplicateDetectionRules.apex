
List<DuplicateRule> dupRules = [SELECT Id, IsActive FROM DuplicateRule];
System.debug(dupRules);

if (!dupRules.isEmpty()) {
    for (DuplicateRule dupeRule : dupRules) {
        //dupeRule.isActive = false;
        System.debug('===Id: ' + dupeRule.Id + ' Active?: ' + dupeRule.isActive);
    }
}