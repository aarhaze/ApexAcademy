List<Case> allCases = [SELECT Id FROM Case];
delete allCases;

List<Opportunity> allOpps = [SELECT Id FROM Opportunity];
delete allOpps;

List<Contact> allContacts = [SELECT Id FROM Contact];
delete allContacts;

List<Account> allAccounts = [SELECT Id FROM Account];
delete allAccounts;