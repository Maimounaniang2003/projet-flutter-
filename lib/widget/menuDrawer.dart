import 'dart:io'; 
import 'package:flutter/material.dart'; 
import 'package:maimouna/screens/communaute_screen.dart'; 
import 'package:url_launcher/url_launcher.dart';

import '../screens/profil_screen.dart' as profil;

class MenuDrawer extends StatelessWidget { 
  MenuDrawer({Key? key}); 
  @override 
  Widget build(BuildContext context) {     
    return Drawer(       
      child: ListView(         
        children: [           
          DrawerHeader(             
            child: Center(               
              child: CircleAvatar(                 
                backgroundImage: AssetImage("assets/images/fallou.jpg"),                 
                radius: 90, 
              ),
            ),             
            decoration: BoxDecoration(                 
              gradient: LinearGradient( 
              colors: [Colors.white, Colors.red], 
            )), 
          ),
          ListTile(             
            title: Text("Communauté"),             
            leading: Icon(Icons.person),            

            onTap: () { 
              Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => PageCommunaute())); 
            }, 
          ),
          ListTile(             
            title: Text("Pays"),             
            leading: Icon(Icons.flag),            

            onTap: () { 
              Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => PageCommunaute())); 
            }, 
          ),
          ListTile(
            title: Text("Profil"),
            leading: Icon(Icons.manage_accounts),
            onTap: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => profil.ProfilScreen()));
            }
          ),
          ListTile( 
            title: Text("Service Client"),             
            leading: Icon(Icons.call),             
            onTap: () { 
              appeler() async{ 
                var numeroServiceClient ="+221 76 304 67 46 ";
              launch("tel:"+ numeroServiceClient);
            }
            } 
          ),
          ListTile(             
            title: Text("Quitter"),             
            leading: Icon(Icons.exit_to_app),             
            onTap: () {               
              exit(0); 
            }, 
          ), 
        ], 
      ), 
    );}} 