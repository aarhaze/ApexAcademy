public with sharing class CreateContacts {

    //Class Attributes
    private static final Integer maxContacts = 200;
    
    // Set of 100 individual first names
    private static final List<String> firstNames = new List<String> {
            'Margaret',
            'Joan',
            'Shirley',
            'Patricia',
            'John',
            'Mary',
            'Dorothy',
            'Elizabeth',
            'Betty',
            'Jean',
            'Barbara',
            'Beverley',
            'Robert',
            'Helen',
            'Valerie',
            'Maria',
            'Kathleen',
            'Maureen',
            'Joyce',
            'Peter',
            'June',
            'David',
            'Eileen',
            'Norma',
            'Heather',
            'Beryl',
            'Lynette',
            'Lorna',
            'Irene',
            'Judith',
            'Pamela',
            'Lorraine',
            'George',
            'Nancy',
            'Marie',
            'James',
            'Ruth',
            'Kenneth',
            'Marjorie',
            'Christine',
            'Susan',
            'Janet',
            'Phyllis',
            'Donald',
            'Wendy',
            'Ronald',
            'Edna',
            'Doreen',
            'Hazel',
            'Yvonne',
            'Thelma',
            'Audrey',
            'Jeanette',
            'Elaine',
            'Janice',
            'William',
            'Raymond',
            'Jennifer',
            'Barry',
            'Kevin',
            'Brian',
            'Anna',
            'Valda',
            'Pauline',
            'Ian',
            'Carol',
            'Anne',
            'Brenda',
            'Thomas',
            'Olive',
            'Michael',
            'Joy',
            'Jessie',
            'Graham',
            'Frank',
            'Elsie',
            'Dawn',
            'Charles',
            'Mavis',
            'Marion',
            'Lois',
            'Lesley',
            'Keith',
            'Ivy',
            'Gloria',
            'Gladys',
            'Florence',
            'Fay',
            'Doris',
            'Alan',
            'Wilma',
            'Julie',
            'Jill',
            'Gwenda',
            'Gwen',
            'Graeme',
            'Evelyn',
            'Edith',
            'Diane',
            'Alma'
    };
    // Set of 100 individual last names
    private static final List<String> lastNames = new List<String> {
            'Jones',
            'Smith',
            'Williams',
            'Taylor',
            'Wilson',
            'Brown',
            'Johnson',
            'Thomas',
            'Robinson',
            'Young',
            'Anderson',
            'White',
            'Mitchell',
            'Martin',
            'Ryan',
            'Hall',
            'Thompson',
            'Clark',
            'Roberts',
            'Murphy',
            'Miller',
            'King',
            'Johnston',
            'Green',
            'Campbell',
            'Wood',
            'Phillips',
            'Harrison',
            'Davis',
            'Cook',
            'Clarke',
            'Barnes',
            'Watson',
            'Richards',
            'Reid',
            'Kelly',
            'Bell',
            'Evans',
            'Stewart',
            'Robertson',
            'Hodges',
            'Knight',
            'Kemp',
            'Hughes',
            'Hill',
            'Cooper',
            'Wright',
            'West',
            'Morris',
            'Morgan',
            'Henry',
            'Harvey',
            'Adams',
            'Turner',
            'Richardson',
            'Moore',
            'McKenzie',
            'Lucas',
            'Lee',
            'Hamilton',
            'Gray',
            'Graham',
            'Francis',
            'Fisher',
            'Ferguson',
            'Elliott',
            'Edwards',
            'Dixon',
            'Davies',
            'Davidson',
            'Bourke',
            'Baker',
            'Allen',
            'Andrews',
            'Wallace',
            'Walker',
            'Stevens',
            'Spencer',
            'Parker',
            'Murray',
            'Morrison',
            'Maxwell',
            'Jackson',
            'Holt',
            'Harris',
            'Goodwin',
            'Gardiner',
            'Ford',
            'Cole',
            'Brooks',
            'Bird',
            'Bennett',
            'Black',
            'Dyer',
            'Dunn',
            'Dean',
            'Cross',
            'Chapman',
            'Carter',
            'Cameron'
    };

    //===Constructors
    public CreateContacts() {
        //super(); ?
    }

    //===Class Methods
    // Generates a random number between 0 - 99 (List contains 100 names)
    // Unsure why inital values of 0 produce low random numbers and inital values of 10 are best?
    private static Integer IntGenerator() {
        Integer intValue    = 10;
        String strValue     = '10';
        do {
            strValue = Math.random().format().mid(2, strValue.length());
            intValue = Integer.valueOf(strValue);
        } while (intValue > 99);
        return intValue;
    }

    // Picks a random name from firstNames List
    private static String FirstNameGenerator() {
        Integer value = IntGenerator();
        return firstNames.get(value);
    }

    // Picks a random name from lastNames List
    private static String LastNameGenerator() {
        Integer value = IntGenerator();
        return lastNames.get(value);
    }

    // Creates Contacts without associated Accounts - Max contacts are 200
    public static void CreateStandAloneContacts(Integer conAmount) {
        List<Contact> contactsToAdd = new List<Contact>();
        if (conAmount > maxContacts) {
            System.debug('===Maximum contact creation is ' + maxContacts + '. The value of ' + conAmount + ' will be changed to ' + maxContacts + '.');
            conAmount = maxContacts;
        } else if (conAmount < 1) {
            System.debug('===You must add at least 1 contact for this method. ' + conAmount + ' will be changed to 1.');
            conAmount = 1;
        } else {
            System.debug('===You are creating ' + conAmount + ' Contacts.');
        }
        for (Integer i = 0; i < conAmount; i++) {
            String fName = FirstNameGenerator();
            String lName = LastNameGenerator();
            Contact newContact = new Contact(
                FirstName      = fName,
                LastName       = lName,
                Title          = 'Manager',
                Email          = fName.left(1).toLowerCase() + lName.toLowerCase() + '@email.com');
            contactsToAdd.add(newContact);
        }

        insert contactsToAdd;
    }
}
