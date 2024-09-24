package abstractfactory2;

public class ESAddress extends Address {
    private static final String COUNTRY = "SPAIN";
    private static final String COMMA = ",";
    
    @Override
    public String getCountry() { return COUNTRY;}
    
    @Override
    public String getFullAddress() {
        return getStreet() + EOL_STRING + getPostalCode() + COMMA + SPACE + getCity() + SPACE +
                "(" + getRegion() + ")" + EOL_STRING + COUNTRY + EOL_STRING;
    }
    
}
