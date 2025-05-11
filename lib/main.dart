import 'package:flutter/material.dart';
import 'package:maimouna/screens/login_screen.dart';
import 'package:maimouna/widget/bottomNav.dart';
import 'package:maimouna/widget/menuDrawer.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

 @override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "premier application",
    home: LoginScreen());
}
}
class PageAccueil extends StatefulWidget {
PageAccueilState createState() => PageAccueilState();
}

class PageAccueilState extends State<PageAccueil>{
  int _nbrelikes=0;
  int _nbredislikes=0;
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "premier application",
      home: Scaffold(
      drawer: MenuDrawer(),
      bottomNavigationBar: BottomNav(
        indexSelection: 0,
      ), 
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          "Page Accueil",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ))),
             body: SingleChildScrollView(
      child: Column(
     children: [ 
      Image.asset(
        "assets/images/maimouna.jpg",
        ),
        Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            'Rencontrez Maimouna!',
            softWrap: true,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  iconSize: 50,
                  onPressed: () {
  setState(() {
    _nbrelikes++;
  });
},
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "${_nbrelikes}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.red),
                  ),
                ),
              ],
              ),
                      Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_down),
                  iconSize: 50,
onPressed: () {
  setState(() {
    _nbredislikes++;
  });
},
                ),         
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "${_nbredislikes}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.red),
                  ),
                ),
            ],)
     ],
  ),
      ]))));
}
}    
     
     
     
      
     
     
     


    
 
