public with sharing class RandomTest {


    

    public static void RandomTestMethod() {

        Integer maxContacts = 200;
        Integer intValue    = 100;
        String strValue     = '100';

        for (Integer i = 0; i < maxContacts; i++) {
            do {
                strValue = Math.random().format().mid(2, strValue.length());
                intValue = Integer.valueOf(strValue);
            } while (intValue > 99);

            System.debug(intValue);
        }
    }
}
