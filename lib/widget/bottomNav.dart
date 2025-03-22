import 'package:flutter/material.dart';
import 'package:maimouna/main.dart';
import 'package:maimouna/screens/communaute_screen.dart';
class BottomNav extends StatefulWidget {
  int indexSelection;
  BottomNav({super.key, required this.indexSelection});
  //BottomNav({key?key});
  BottomNavState createState() => BottomNavState();
}
class BottomNavState extends State<BottomNav> {
  void getSelectItem() {
    switch (widget.indexSelection) {
      case 0:
      Navigator.push(context, MaterialPageRoute(builder:(context)
=> PageAccueil()));
        break;
      case 1:
      Navigator.push(context, MaterialPageRoute(builder: (context)
=>PageCommunaute()));    
        break;
      default:
        break;
    }
  }
@override
Widget build(BuildContext context) {
  return BottomNavigationBar(
    backgroundColor: Colors.red,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.white,
    items: [
      BottomNavigationBarItem(
        label: "Accueil",
        icon: Icon(Icons.home),
      ),

      BottomNavigationBarItem(
        label: "communauté",
        icon: Icon(Icons.person),
      )

    ], 
    currentIndex: widget.indexSelection,
    onTap: (newIndex) {
      setState(() {
        widget.indexSelection = newIndex;
        getSelectItem();
      });
    }
  );
}
}
 
