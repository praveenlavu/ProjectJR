public class GeoLocation{
    
    // To find latitude and location from city name
    public static Location findLatLong(String city) {
        
        String url = 'http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=';
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        
        req.setMethod('GET');
        req.setEndpoint(url+city);
        req.setHeader('Content-Type', 'text/xml;charset=UTF-8');
        
        HttpResponse res = h.send(req);
        
        System.debug(res.getBody());
        Map<String, Object> body = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        List<Object> results = (List<Object>) body.get('results');
        Map<String, Object> resultMap = (Map<String, Object>) results.get(0);
             
        Map<String, Object> geomentry = (Map<String, Object>) resultMap.get('geometry');
        Map<String, Object> locationMap = (Map<String, Object>) geomentry.get('location');
        
        System.debug('********** LOCATION **************');
        System.debug(locationMap);
        
        Location loc = Location.newInstance((Decimal) locationMap.get('lat'), 
                                            (Decimal) locationMap.get('lng'));
		
        return loc;
    }
}