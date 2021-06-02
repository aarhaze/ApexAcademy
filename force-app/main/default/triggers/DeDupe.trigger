trigger DeDupe on Account (after insert) {
    for (Account acc : Trigger.new) {
        Case c      = new Case();
        c.OwnerId   = '0051y0000023fQiAAI';
        c.Subject   = 'Dedupe this Account!';
        c.AccountId = acc.Id;
        insert c;
    }
}