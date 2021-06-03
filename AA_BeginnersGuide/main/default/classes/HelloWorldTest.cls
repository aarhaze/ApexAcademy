@IsTest
public class HelloWorldTest {
    @IsTest static void Test1() {
        Lead l = new Lead();
        l.LastName = 'Hazell';
        l.Company  = 'SCV';
        insert l;

        l.Company = 'Hazella';
        update l;
    }
}
