List<Contact> newContacts = new List<Contact>();
for (Integer i = 0; i < 200; i++) {
    Contact ctc    = new Contact();
    ctc.FirstName  = 'Test FN'; 
    ctc.LastName   = 'Test LN ' + i;
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
        ctc.Email = 'email' + i + '@outlook.com';
    } else {
        ctc.Email = 'email' + i  + '@gmail.com';
    }
    ctc.BirthDate = Date.newInstance(1999, 1, 1).addDays(i);
    newContacts.add(ctc);
}
insert newContacts;
