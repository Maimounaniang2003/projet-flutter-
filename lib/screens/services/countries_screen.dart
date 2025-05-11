import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maimouna/modeles/country.dart';
import 'package:maimouna/screens/services/backend_service.dart';
import 'package:maimouna/screens/services/country-detail_screen.dart';
import 'package:maimouna/widget/alertMessage.dart';
import 'package:maimouna/widget/bottomNav.dart';
import 'package:maimouna/widget/menuDrawer.dart';


class countriesScreen extends StatefulWidget {
  const countriesScreen({Key? key}) : super(key: key);
  @override
  CountriesScreenState createState() => CountriesScreenState();
  }

  class CountriesScreenState extends State<countriesScreen> {
    List<Country> countries = [];
@override
    void initState() {
      //TODO: implement initState
      super.initState();
      getCountries();
    }

    getCountries() async {
      // _showProgress() ; 
     BackendService.getCountries().then((value) {
      if (value == -1) {
        Navigator.pop(context);
        showMessageDialog(
          context, 'Erreur au niveau de 1\'api', 'votre api a un probleme');
      } else {
        setState(() {
          countries = value;
        });
      }
     }
        );
     }
     
      Widget build(BuildContext context) {
        return Scaffold(
          drawer: MenuDrawer(),
          bottomNavigationBar: BottomNav(
            indexSelection: 2,
            ),
          appBar: AppBar(
              backgroundColor: Colors.red,
              centerTitle: true,
              title: const Text(
                "Les pays du monde",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            body: countries.length != 0
              ?_showCountries(countries)
              :_showProgress()); 
    } 
      Widget _showProgress() {
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                backgroundColor: Colors.red,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.black, //<-- SEE HERE
                  ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text("chargement...",
                style: TextStyle(fontSize: 12, color: Colors.blue),
                maxLines: 2,
                textAlign: TextAlign.center)),
          ]));
      }   
        

      Widget _showCountries(List<Country> countries) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: countries.length, 
            itemBuilder:(context, index) => Padding(
              padding: EdgeInsets.all(0.0),
              child: Card(
                child: ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  title: Text('${countries[index].name})',
                  style: TextStyle(fontWeight:FontWeight.bold)),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Capitale: ${countries[index].capital} '),
                      Text('Population: ${countries[index].population}')
                    ]),
                    leading: 
                    ClipOval(
                      child: Container(
                        width: 50,height: 50,
                        child: SvgPicture.network(
                          countries[index].flagUrl,fit: BoxFit.cover,
                        ),
                        ),),
                        onTap: () {
                          Navigator.push(
                            context,MaterialPageRoute(
                              builder: (_) => CountryDetailScreen(
                                country: countries[index],
                              ),),); },)),),) );}
      }
      
    
    