public class WrapperClassDeserialization {
    /* Sample JSON:
    *   {
    *      "storeName": "Tandoori Tamasha",
    *      "orderNo": "12867069",
    *      "customer": {
    *         "id": "CUST-1083",
    *         "name": "John O'Brent",
    *         "phone": "+91-9876234520",
    *         "address": {
    *            "street": "OMR Road",
    *            "city": "Chennai",
    *            "state": "Tamil Nadu"
    *         }
    *      }
    *   }
    */

    // Wrapper class that represents the structure of the JSON data
    public class orderPayload {
        public String storeName;
        public String orderNo;
        public Customer customer;
    }

    // Inner class to represent the 'customer' object in the JSON data
    public class Customer {
        public String id;
        public String name;
        public String phone;
        public Address address;
    }

    // Inner class to represent the 'address' object in the JSON data
    public class Address {
        public String street;
        public String city;
        public String state;
    }

    public static void deserializeJSON() {
        String jsonString = '{\n' +
        '"storeName": "Tandoori Tamasha",\n' +
        '"orderNo": "12867069",\n' +
        '"customer": { "id": "CUST-1083", "name": "John O\'Brent", "phone": "+91-9876234520",\n' +
        '"address": { "street": "OMR Road", "city": "Chennai", "state": "Tamil Nadu"\n' + 
        '}\n' + 
        '}\n' +
        '}';

        System.debug('JSON String: ' + jsonString);

        // Deserialize the JSON String and typecast it to the wrapper class 'orderPayload'
        orderPayload deserializedData = (orderPayload)JSON.deserialize(jsonString, orderPayload.class);
        System.debug('Deserialized Data: ' + deserializedData);

        // Accessing individual values from the deserialized data using dot notation: 'CLASS_NAME.VARIABLE_NAME'
        System.debug('Store Name: ' + deserializedData.storeName);
        System.debug('Order No: ' + deserializedData.orderNo);
        System.debug('Customer Details: ' + deserializedData.customer);
        System.debug('Id: ' + deserializedData.customer.id);
        System.debug('Name: ' + deserializedData.customer.name);
        System.debug('Phone: ' + deserializedData.customer.phone);
        System.debug('Customer Address: ' + deserializedData.customer.address);
        System.debug('Street: ' + deserializedData.customer.address.street);
        System.debug('City: ' + deserializedData.customer.address.city);
        System.debug('State: ' + deserializedData.customer.address.state);
    }

}