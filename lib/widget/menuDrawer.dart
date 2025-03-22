import 'dart:io'; 
import 'package:flutter/material.dart'; 
import 'package:maimouna/main.dart'; 
import 'package:maimouna/screens/communaute_screen.dart';
import 'package:url_launcher/url_launcher.dart'; 
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
            title: Text("Accueil"),             
            leading: Icon(Icons.home),            

            onTap: () { 
              Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => PageAccueil())); 
            }, 
          ),
          ListTile( 
            title: Text("Service Client"),             
            leading: Icon(Icons.call),             
            onTap: () { 
              appeler() async{ 
                var numeroServiceClient ="+221 77 205 17 79";
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