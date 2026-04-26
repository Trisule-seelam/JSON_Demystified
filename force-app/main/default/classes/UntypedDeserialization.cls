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

    /* Sample JSON:
    *   [
    *    {
    *       "id": "ee50a240-ec69-4482-b8af-5d94dfc6a305",
    *       "name": "Premium Monitor",
    *       "price": 577.86,
    *       "currency": "EUR",
    *       "category": "Toys",
    *       "sku": "DYMAC6SP",
    *       "stock": 0,
    *       "rating": 4.6,
    *       "reviewCount": 721,
    *       "isAvailable": false
    *    },
    *    {
    *       "id": "8b938e4a-e1a9-43a6-b4fc-b0dcd6c69afa",
    *       "name": "Slim Laptop",
    *       "price": 236.03,
    *       "currency": "USD",
    *       "category": "Beauty",
    *       "sku": "H6X1MJ4U",
    *       "stock": 411,
    *       "rating": 1.5,
    *       "reviewCount": 123,
    *       "isAvailable": true
    *    }
    *   ]
    */

    public static void deserializeJSONArray() {
        String jsonString = '[\n' +
        '{\n' +
        '"id": "ee50a240-ec69-4482-b8af-5d94dfc6a305",\n' +
        '"name": "Premium Monitor",\n' +
        '"price": 577.86,\n' +
        '"currency": "EUR",\n' +
        '"category": "Toys",\n' +
        '"sku": "DYMAC6SP",\n' +
        '"stock": 0,\n' +
        '"rating": 4.6,\n' +
        '"reviewCount": 721,\n' +
        '"isAvailable": false\n' +
        '},\n' +
        '{\n' +
        '"id": "8b938e4a-e1a9-43a6-b4fc-b0dcd6c69afa",\n' +
        '"name": "Slim Laptop",\n' +
        '"price": 236.03,\n' +
        '"currency": "USD",\n' +
        '"category": "Beauty",\n' +
        '"sku": "H6X1MJ4U",\n' +
        '"stock": 411,\n' +
        '"rating": 1.5,\n' +
        '"reviewCount": 123,\n' +
        '"isAvailable": true\n' +
        '}\n' +
        ']';

        System.debug('JSON String: ' + jsonString);

        List<Object> deserializedData = (List<Object>)JSON.deserializeUntyped(jsonString);
        System.debug('Deserialized JSON Array: ' + deserializedData);

        for(Object obj : deserializedData) {
            Map<String, Object> eachObj = (Map<String, Object>)obj;
            System.debug('Object is: ' + eachObj);

            String id = (String)eachObj.get('id');
            String name = (String)eachObj.get('name');
            Decimal price = (Decimal)eachObj.get('price');
            String currencyOfPrice = (String)eachObj.get('currency');
            String category = (String)eachObj.get('category');
            String sku = (String)eachObj.get('sku');
            Integer stock = (Integer)eachObj.get('stock');
            Decimal rating = (Decimal)eachObj.get('rating');
            Integer reviewCount = (Integer)eachObj.get('reviewCount');
            Boolean isAvailable = (Boolean)eachObj.get('isAvailable');

            System.debug('Id: ' + id);
            System.debug('Name: ' + name);
            System.debug('Price: ' + price);
            System.debug('Currency: ' + currencyOfPrice);
            System.debug('Category: ' + category);
            System.debug('SKU: ' + sku);
            System.debug('Stock: ' + stock);
            System.debug('Rating: ' + rating);
            System.debug('Review Count: ' + reviewCount);
            System.debug('Is Available?: ' + isAvailable);
        }
    }
}