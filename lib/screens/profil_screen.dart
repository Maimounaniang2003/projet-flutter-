import 'package:flutter/material.dart';
import 'package:maimouna/screens/login_screen.dart';
import 'package:maimouna/widget/menuDrawer.dart'; 
import 'dart:io'; 
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:url_launcher/url_launcher.dart'; 
import 'package:image_picker/image_picker.dart'; 
 
class ProfilScreen extends StatefulWidget { 
  // final itemData; 
  // const Body(this.itemData); 
  _ProfilState createState() => _ProfilState(); 
} 
 
class _ProfilState extends State<ProfilScreen> { 
  File? _image; 
  final picker = ImagePicker(); 
 
  SharedPreferences? preferences; 
  Future<void> initializePreference() async { 
    preferences = await SharedPreferences.getInstance(); 
  } 
 
  @override 
  void initState() { 
    // TODO: implement initState 
    super.initState(); 
    initializePreference().whenComplete(() { 
      placeImage(); 
    }); 
  } 
 
  placeImage() async { 
    String imageDecode = preferences!.getString('profilImage') ?? '[]'; 
    if (imageDecode != '[]') { 
      if (await File(imageDecode).exists()) { 
        setState(() { 
          _image = File(imageDecode); 
        }); 
      } 
    } 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
        drawer: MenuDrawer(), 
        appBar: AppBar( 
            backgroundColor: Colors.red, 
            centerTitle: true, 
            title: const Text( 
              "Profil", 
              style: TextStyle( 
                fontSize: 18, 
                fontWeight: FontWeight.bold, 
                color: Colors.white, 
              ), 
            )), 
        body: SingleChildScrollView( 
            child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: <Widget>[ 
            SizedBox( 
              width: 150, 
              height: 150, 
              child: Stack( 
                clipBehavior: Clip.none, 
                fit: StackFit.expand, 
                children: [ 
                  GestureDetector( 
                    onTap: () {}, 
                    child: Container( 
                        child: ClipOval( 
                      child: _image == null 
                          ? Image.asset( 
                              'assets/images/profil.png', 
                              width: 200, 
                              height: 200, 
                              fit: BoxFit.cover, 
                            ) // set a placeholder image when no photo is set 
                          : Image.file( 
                              _image!, 
                              width: 200, 
                              height: 200, 
                              fit: BoxFit.cover, 
                            ), 
                    )), 
                  ), 
                  Positioned( 
                      bottom: 0, 
                      right: -25, 
                      child: RawMaterialButton( 
                        onPressed: () { 
                          _showSelectionDialog(); 
                        }, 
                        elevation: 2.0, 
                        fillColor: Color(0xFFF5F6F9), 
                        child: Icon(Icons.camera_alt_outlined, 
                            color: Colors.blueGrey), 
                        padding: EdgeInsets.all(15.0), 
                        shape: CircleBorder(), 
                      )), 
                ], 
              ), 
            ), 
            Container( 
              child: SingleChildScrollView( 
                  child: Container( 
                padding: EdgeInsets.all(20), 
                width: double.infinity, 
                decoration: BoxDecoration( 
                  color: Colors.white, 
                  borderRadius: BorderRadius.only( 
                    topLeft: Radius.circular(30), 
                    topRight: Radius.circular(30), 
                  ), 
                ), 
                child: Column( 
                  children: <Widget>[ 
                    Padding( 
                        padding: const EdgeInsets.all(16.0), 
                        child: Container( 
                            color: Color(0xFFBFECFF).withOpacity(0.05), 
                            child: ListTile( 
                                title: Text( 
                                  'Mon compte', 
                                  style: TextStyle( 
                                    color: Colors.red, 
                                  ), 
                                ), 
                                leading: Icon( 
                                  Icons.person_outline, 
                                  color: Colors.red, 
                                ), 
                                trailing: Icon( 
                                  Icons.keyboard_arrow_right, 
                                  color: Colors.red, 
                                ), 
                                onTap: () { 
                                  _showDialog(context); 
                                }))), 
                    Padding( 
                        padding: const EdgeInsets.all(16.0), 
                        child: Container( 
                            color: Color(0xFFBFECFF).withOpacity(0.05), 
                            child: ListTile( 
                                title: Text( 
                                  'Déconnexion', 
                                  style: TextStyle( 
                                    color: Colors.red, 
                                  ), 
                                ), 
                                leading: Icon( 
                                  Icons.exit_to_app, 
                                  color: Colors.red, 
                                ), 
                                trailing: Icon( 
                                  Icons.keyboard_arrow_right, 
                                  color: Colors.red, 
                                ), 
                                focusColor: Colors.red, 
                                onTap: () { 
                                  Navigator.of(context, rootNavigator: true) 
                                      .pushAndRemoveUntil( 
                                    MaterialPageRoute( 
                                      builder: (BuildContext context) { 
                                        return LoginScreen(); 
                                      }, 
                                    ), 
                                    (_) => false, 
                                  ); 
                                }))), 
                  ], 
                ), 
              )), 
            ), 
          ], 
        ))); 
  } 
 
  _makingPhoneCall() async { 
    var url = Uri.parse("tel:" + "774901232"); 
    if (await canLaunchUrl(url)) { 
      await launchUrl(url); 
    } else { 
      throw 'Could not launch $url'; 
    } 
  } 
 
  _showDialog(BuildContext context) { 
    return showDialog<void>( 
        context: context, 
        barrierDismissible: false, // user must tap button! 
        builder: (BuildContext context) { 
          double width = MediaQuery.of(context).size.width * 0.30; 
          return Container( 
              height: MediaQuery.of(context).size.height, 
              width: MediaQuery.of(context).size.width, 
              child: AlertDialog( 
                insetPadding: EdgeInsets.zero, 
                clipBehavior: Clip.antiAliasWithSaveLayer, 
                title: Column( 
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: <Widget>[ 
                      Container( 
                          padding: const EdgeInsets.only(top: 5, bottom: 5), 
                          height: 60, 
                          width: MediaQuery.of(context).size.width, 
                          child: Align( 
                              alignment: Alignment.center, 
                              child: Column(children: [ 
                                Text( 
                                  "informations", 
                                  style: TextStyle( 
                                      fontFamily: 'Montserrat-Bold', 
                                      fontSize: 15, 
                                      color: Colors.red), 
                                ), 
                                SizedBox(height: 5), 
                                RichText( 
                                    text: TextSpan( 
                                        text: "Développeur:", 
                                        style: TextStyle( 
                                          fontFamily: 'Montserrat-Bold', 
                                          fontSize: 12, 
                                        ), 
                                        children: [ 
                                      TextSpan( 
                                        text: "Fallou Ndiaye", 
                                        style: TextStyle( 
                                          fontFamily: 'Montserrat-Bold', 
                                          fontSize: 12, 
                                        ), 
                                      ) 
                                    ])), 
                              ]))), 
                      SizedBox(height: 10), 
                    ]), 
                content: Container( 
                    width: MediaQuery.of(context).size.width, 
                    child: SingleChildScrollView( 
                      child: ListBody( 
                        children: <Widget>[ 
                          Card( 
                              margin: 
                                  const EdgeInsets.only(left: 0.0, right: 
0.0), 
                              child: Padding( 
                                padding: const EdgeInsets.only( 
                                    left: 5.0, right: 5.0), 
                                child: Column( 
                                    crossAxisAlignment: 
                                        CrossAxisAlignment.center, 
                                    children: <Widget>[ 
                                      Row(children: [ 
                                        Container( 
                                          width: width, 
                                          child: Text('Adresse:', 
                                              style: TextStyle( 
                                                fontSize: 13, 
                                                fontFamily: "Montserrat", 
                                                fontWeight: FontWeight.bold, 
                                              )), 
                                        ), 
                                        Text("Dakar", 
                                            style: const TextStyle( 
                                                color: Colors.black, 
                                                fontFamily: "Montserrat-Bold", 
                                                fontSize: 13)) 
                                      ]), 
                                      SizedBox(height: 10), 
 
                                      Row(children: [ 
                                        Container( 
                                          width: width, 
                                          child: Text('Telephone: ', 
                                              style: TextStyle( 
                                                fontSize: 13, 
                                                fontFamily: "Montserrat", 
                                                fontWeight: FontWeight.bold, 
                                              )), 
                                        ), 
                                        Text("774901232", 
                                            style: const TextStyle( 
                                                color: Colors.black, 
                                                fontFamily: "Montserrat-Bold", 
                                                fontSize: 13)) 
                                      ]), 
                                      SizedBox(height: 10), 
                                      Row(children: [ 
                                        Container( 
                                          width: width, 
                                          child: Text('Email: ', 
                                              style: TextStyle( 
                                                fontSize: 13, 
                                                fontFamily: "Montserrat", 
                                                fontWeight: FontWeight.bold, 
                                              )), 
                                        ), 
                                        Text("loufand18@gmail.com", 
                                            style: const TextStyle( 
                                                color: Colors.black, 
                                                fontFamily: "Montserrat-Bold", 
                                                fontSize: 13)) 
                                      ]), 
                                      //  SizedBox(height: 10), 
 
                                      SizedBox(height: 10), 
                                    ]), 
                              )) 
                        ], 
                      ), 
                    )), 
                actions: <Widget>[ 
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [ 
                    ElevatedButton( 
                        child: Text("Fermer", style: TextStyle(fontSize: 14)), 
                        style: ButtonStyle( 
                            backgroundColor: 
                                MaterialStateProperty.all(Colors.red), 
                            shape: MaterialStateProperty.all< 
                                    RoundedRectangleBorder>( 
                                RoundedRectangleBorder( 
                                    borderRadius: BorderRadius.circular(18.0), 
                                    side: BorderSide(color: Colors.white)))), 
                        onPressed: () { 
                          Navigator.of(context).pop(); 
                        }), 
                  ]) 
                ], 
              )); 
        }); 
  } 
 
  // Method for sending a selected or taken photo to the EditPage 
  Future selectOrTakePhoto(ImageSource imageSource) async { 
    final pickedFile = await picker.pickImage(source: imageSource); 
    setState(() { 
      if (pickedFile != null) { 
        _image = File(pickedFile.path); 
 
        preferences!.setString('profilImage', pickedFile.path); 
      } else 
        print('No photo was selected or taken'); 
    }); 
  } 
 
  /// Selection dialog that prompts the user to select an existing photo or take a new one 
  Future _showSelectionDialog() async { 
    await showDialog( 
      context: context, 
      builder: (context) { 
        return SimpleDialog( 
          title: Text('Selectionner votre photo'), 
          children: <Widget>[ 
            SimpleDialogOption( 
              child: Text('Galerie'), 
              onPressed: () async { 
                await selectOrTakePhoto(ImageSource.gallery); 
                Navigator.of(context).pop(); 
              }, 
            ), 
            SimpleDialogOption( 
              child: Text('Appareil photo'), 
              onPressed: () async { 
                await selectOrTakePhoto(ImageSource.camera); 
                Navigator.of(context).pop(); 
              }, 
            ), 
          ], 
); 
}, 
); 
} 
}