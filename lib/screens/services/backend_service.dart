import 'package:maimouna/modeles/country.dart'; 
import 'package:http/http.dart' as http; 
import 'dart:convert'; 
import 'package:connectivity_plus/connectivity_plus.dart'; 
class BackendService { 
  static getCountries() async {     
    List<Country> data = [];      
    var connectivityResult = await (Connectivity().checkConnectivity());     
   // if (connectivityResult == ConnectivityResult.mobile ||         
       // connectivityResult == ConnectivityResult.wifi) {       
      try {         
        final res = await http.get(
          Uri.parse( 
            'https://countriesnow.space/api/v0.1/countries/info?returns=population,flag,iso2,iso3,phone_code,capital'));

         if (res.statusCode == 200) {           
          var body = json.decode((res.body));           
          for (var item in body["data"]) {             
            data.add(Country(               
              name: item['name'] != null ? item['name'] : '',               
              capital: item['capital'] != null ? item['capital'] : 'N/A',               
              population: item['population'] != null ? item['population'] : 0,               
              area: item['area'] != null ? item['area'] : 0,               
              flagUrl: item['flag'] != null ? item['flag'] : ''));           
          }

           return data;
                    } else {           
                      return -1;                       
        } 
      } catch (error) {         
        return -1; 
      } 
    } 
  }

 
