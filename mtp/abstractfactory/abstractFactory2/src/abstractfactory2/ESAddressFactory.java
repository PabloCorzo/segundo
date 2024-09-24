package abstractfactory2;

public class ESAddressFactory implements AddressFactory {
    
    @Override
    public Address createAddress() {
        return new ESAddress();
    } 
    
    @Override
    public PhoneNumber createPhoneNumber() {
        return new ESPhoneNumber();
    }
}
