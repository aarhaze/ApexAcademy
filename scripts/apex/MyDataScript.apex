List<Entitlement> entList = [SELECT Id FROM Entitlement];
if (!entList.isEmpty()) {
    delete entList;
}

List<Case> allCases = [SELECT Id FROM Case];
if (!allCases.isEmpty()) {
    delete allCases;
}

List<Opportunity> allOpps = [SELECT Id FROM Opportunity];
if (!allOpps.isEmpty()) {
    delete allOpps;
}

List<Contact> allContacts = [SELECT Id FROM Contact];
if (!allContacts.isEmpty()) {
    delete allContacts;
}

List<Account> allAccounts = [SELECT Id FROM Account];
if (!allAccounts.isEmpty()) {
    delete allAccounts;
}

List<Account> newAccounts = new List<Account>();
for (Integer i = 0; i < 200; i++) {
    String iString        = String.valueOf(i);
    Account acc           = new Account();
    acc.Name              = iString;
    acc.NumberOfEmployees = i;
    acc.AnnualRevenue     = i * 1000;
    if (Math.mod(i, 3) == 0) {
        acc.Industry = 'Technology';    
    } else if (Math.mod(i, 3) == 1) {
        acc.Industry = 'Finance';
    } else {
        acc.Industry = 'Government';
    }
    if (i >= 150) {
        acc.Description = iString + iString + iString;
    } else {
        acc.Description = iString;
    }
    newAccounts.add(acc);
}
insert newAccounts;

List<Contact> newContacts = new List<Contact>();
for (Integer i = 0; i < 500; i++) {
    String iString = String.valueOf(i);
    Contact ctc    = new Contact();
    ctc.FirstName  = iString; 
    ctc.LastName   = iString;
    if (Math.mod(i, 4) == 0) {
        ctc.Title = 'CEO';
    } else if (Math.mod(i, 4) == 1) {
        ctc.Title = 'VP';
    } else if (Math.mod(i, 4) == 2) {
        ctc.Title = 'Sales Manager';
    } else {
        ctc.Title = 'Sales Representative';
    }
    if (i < 10) {
        ctc.Email = iString + '@outlook.com';
    } else {
        ctc.Email = iString + '@gmail.com';
    }
    ctc.BirthDate = Date.newInstance(1999, 1, 1).addDays(i);
    ctc.AccountId = newAccounts[i / 5].Id;
    newContacts.add(ctc);
}
insert newContacts;
