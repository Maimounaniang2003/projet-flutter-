import 'package:flutter/material.dart';
import 'package:maimouna/modeles/personne.dart';
import 'package:maimouna/widget/bottomNav.dart';
import 'package:maimouna/widget/menuDrawer.dart';
class PageCommunaute extends StatefulWidget {
  PageCommunauteState createState() => PageCommunauteState();
}

class PageCommunauteState extends State<PageCommunaute> {
  List<Personne> listePersonnes = [
    Personne(1, 'jean Dupont','Developpeur',772345676,
    'https://www.coopfuneraire2rives.com/avis-de-deces/jean-dupont-214571/'),
    Personne(2, 'Marie+curie','scientifique',767768909,
    'https://www.google.com/search?q=marie+curie&sca_esv=bb027c1cf1d86ff2&rlz=1C1CHBF_frSN1109SN1111&biw=1038&bi'),
    Personne(3, 'Emile+zola','EcrivainEmile+zola',702233445,
    'https://www.google.com/search?q=emile+zola&sca_esv=bb027c1cf1d86ff2&rlz=1C1CHBF_frSN1109SN1111&biw=1038&bih='),
    Personne(4, 'Claude Monet', 'peintre', 775567788,
    'https://www.google.com/search?q=claude+monet+peintre&sca_esv=bb027c1cf1d86ff2&rlz=1C1CHBF_frSN1109SN1111&sxsrf=ADLYWILOZgJF6t5h4oJCutPN6Zfz3m5WQA%3A1716562355338&ei=s6lQZtWZFPmK7NYPqe6lOA&gs_ssp=eJzj4tDP1TcwrMjLMmD0EknOSSxNSVXIzc9LLVEoSM3MKylKBQClOwrm&oq=Claude+monet+peintre&gs_lp=Eg'),
    Personne(5, 'Sophie Marceau', 'Actrice',775788900,
    'https://www.google.com/search?q=sophie+marceau&sca_esv=bb027c1cf1d86ff2&rlz=1C1CHBF_frSN1109SN1111&biw=1038&bih=730&tbm=n'),
];
@override
Widget build(BuildContext context) {
  return Scaffold(
    drawer: MenuDrawer(),
    bottomNavigationBar: BottomNav(
      indexSelection:1,
    ),
    appBar: AppBar(
    backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text(
            "Page Communauté",
           style: TextStyle(
               fontSize: 18,
               fontWeight: FontWeight.bold,
               color: Colors.white, 
      ),
          )),
    body: builListView());
}
      ListView builListView() {
        return ListView.separated(
          itemCount: listePersonnes.length,
          itemBuilder: (context, index) {
            final pers = listePersonnes.elementAt(index);
            final item = listePersonnes.elementAt(index).nom;

            return Container(
              key: Key(pers.id.toString()),
              child: gettistile(index, context, item),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.red,
          ),
          );
      }
 ListTile gettistile (int index,BuildContext context, String item) {
  Personne pers = listePersonnes[index];
  return ListTile(
    title: Text("${pers.nom}"),
    subtitle: Text(pers.metier +"Tel.:${pers.telephone}"),
    leading: CircleAvatar(
    backgroundImage: NetworkImage(pers.imageProfil), 
    ),
    trailing: IconButton(
      icon: Icon(
        Icons.delete,
        color:Colors.red,
      ),
      onPressed: () {
        setState(() {
          listePersonnes.removeAt(index);
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('$item a été supprimé de la liste'),
          // Optional duration
        ));
      },
    ),
    onTap: () {
       showDialog(
        context: context,
         builder: (BuildContext context) =>
             getAlertDialogInfosPersonne(pers, context));
  },
  );
}
}
AlertDialog getAlertDialogInfosPersonne(Personne pers, BuildContext context) {
   return AlertDialog(
    backgroundColor:Colors.red,
    title: Text(
      "Détails des informations",
      style: TextStyle(fontWeight: FontWeight.bold, color:Colors.white),
   ),
   content: getAlerDialogsDetailInfos(pers), 
   actions: [
    TextButton (
        onPressed: () {
          Navigator .pop(context);
        },
        child: Text(         
          "ОК",
          style: TextStyle(color:Colors.white),
        ))
   ]
   );
  }
 getAlerDialogsDetailInfos(Personne pers) {     
  return SingleChildScrollView(         
    child: Column(       
      crossAxisAlignment: CrossAxisAlignment.start,       
      children: [         
        Center(           
          child: Column(             
            children: [               
              CircleAvatar(                 
                backgroundImage: NetworkImage(pers.imageProfil),                 
                radius: 90, 
              ),
               Text(                 
                pers.nom,                 
                textAlign: TextAlign.center,                 
                textScaleFactor: 2.0,                 
                style: TextStyle(color: Colors.white), 
              ),
              Text(                 
                pers.metier,                 
                textAlign: TextAlign.center,                 
                textScaleFactor: 2.0,                 
                style: TextStyle(color: Colors.white),               
                ),               
                Text(                 
                  pers.telephone.toString(),                 
                  textAlign: TextAlign.center,                 
                  textScaleFactor: 2.0,                 
                  style: TextStyle(color: Colors.white), 
              ), 
            ], 
          ), 
        ) 
      ], 
    ));
 }