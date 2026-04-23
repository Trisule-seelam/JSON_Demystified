public class UntypedDeserialization {
    /* Sample JSON:
    *   {
    *      "name": "John Doe",
    *      "id": "E00069",
    *      "roles": ["Dev", "QA"],
    *      "age": 26,
    *      "doj": "28-11-2023",
    *      "married": false,
    *      "address": {
    *          "street": "32, Majestic St.",
    *          "city": "Benguluru",
    *          "country": "India"
    *      },
    *      "referred-by": "E00043"
    *   }
    */

    public static void deserializeJSON() {
        String jsonString = '{\n' +
        '"name": "John Doe",\n' +
        '"id": "E00069",\n' + 
        '"roles": ["Dev", "QA"],\n' +
        '"age": 26,\n' + 
        '"doj": "28-11-2023",\n' + 
        '"married": false,\n' + 
        '"address": { "street": "32, Majestic St.", "city": "Benguluru", "country": "India" },\n' +
        '"referred-by": "E00043" }';

        System.debug('JSON String: ' + jsonString);

        // Deserialize the JSON String and typecast it to a Map<String, Object>
        Map<String, Object> deserializedData = (Map<String, Object>)JSON.deserializeUntyped(jsonString);
        System.debug('Deserialized JSON Data: ' + deserializedData);

        // Accessing individual values from the deserialized data after appropriate typecasting
        String name = (String)deserializedData.get('name');
        String id = (String)deserializedData.get('id');
        List<Object> roles = (List<Object>)deserializedData.get('roles');
        Integer age = (Integer)deserializedData.get('age');
        String doj = (String)deserializedData.get('doj');
        Boolean married = (Boolean)deserializedData.get('married');
        Map<String, Object> address = (Map<String, Object>)deserializedData.get('address');
        String street = (String)address.get('street');
        String city = (String)address.get('city');
        String country = (String)address.get('country');
        String referredBy = (String)deserializedData.get('referred-by');

        System.debug('Name: ' + name);
        System.debug('Id: ' + id);
        System.debug('Roles: ' + roles);

        for(Object obj : roles) {
            String role = (String)obj;
            System.debug('Role: ' + role);
        }

        System.debug('Age: ' + age);
        System.debug('Date of Joining: ' + doj);
        System.debug('Married: ' + married);
        System.debug('Address: ' + address);
        System.debug('Street: ' + street);
        System.debug('City: ' + city);
        System.debug('Country: ' + country);
        System.debug('Referred By: ' + referredBy);
    }
}