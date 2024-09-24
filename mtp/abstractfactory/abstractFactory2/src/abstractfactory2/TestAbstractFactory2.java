package abstractfactory2;

public class TestAbstractFactory2 {

    public static void main(String[] args) {
        System.out.println("Ejemplo del patrón AbstractFactory");
        System.out.println();
        
        System.out.println("Creando US Address and Phone Number:");
        AddressFactory usAddressFactory = new USAddressFactory();
        Address address = usAddressFactory.createAddress();
        PhoneNumber phone = usAddressFactory.createPhoneNumber();
        
        address.setStreet("142 Lois Lane");
        address.setCity("Metropolis");
        address.setRegion("WY");
        address.setPostalCode("54321");
        phone.setPhoneNumber("7039214722");
        
        System.out.println("US address:");
        System.out.println(address.getFullAddress());
        System.out.println("US phone number: +" + phone.getCountryCode() + " " + phone.getPhoneNumber());
        System.out.println();
        System.out.println();

        System.out.println("Creando ES Address and Phone Number:");
        AddressFactory esAddressFactory = new ESAddressFactory();
        address = esAddressFactory.createAddress();
        phone = esAddressFactory.createPhoneNumber();
        
        address.setStreet("Calle Antonio Machado 13");
        address.setCity("Madrid");
        address.setRegion("Madrid");
        address.setPostalCode("28035");
        phone.setPhoneNumber("912583697");
        
        System.out.println("ES address:");
        System.out.println(address.getFullAddress());
        System.out.println("ES phone number: +" + phone.getCountryCode() + " " + phone.getPhoneNumber());
        System.out.println();
        System.out.println();
    }
}
