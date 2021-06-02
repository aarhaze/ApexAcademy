trigger HelloWorld on Lead (before update) {
    for (Lead lead : Trigger.new) {
        lead.FirstName = 'Hello';
        lead.LastName  = 'World';
    }
}