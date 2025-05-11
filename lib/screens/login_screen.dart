import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:maimouna/main.dart';
class LoginScreen extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}
class LoginState extends State<LoginScreen> {
  bool _passwordInVisible = true;
  final _formkey = GlobalKey<FormState>();
  final _emialEditController = TextEditingController();
  final _passwordEditController = TextEditingController();
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 80.0),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Text(
      'Bienvenue !',
      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
      const Text(
        'Connectez-vous pour continuer',
      ),
      const SizedBox(height: 50),
      Form(
        key: _formkey,
        child: Column(
          children: [
            
            TextFormField(
              controller: _emialEditController,
              validator: (String? value) {
                if (value!.length == 0) {
                  return "le ne doit pas etre vide";
                }

                return null;
              }, 
                                     
               keyboardType: TextInputType.visiblePassword,                          
                onChanged: (value) {},                           
                decoration: InputDecoration(                             
                  labelText: 'E-mail',                             
                  
          
                            ),                         
                        ), 
                        const SizedBox(                           
                          height: 20,                         
                          ), 
                        TextFormField(
              controller: _passwordEditController,
              validator: (String? value) {
                if (value!.length == 0) {
                  return "le ne doit pas etre vide";
                }

                return null;
              }, 
              obscureText: _passwordInVisible,                         
               keyboardType: TextInputType.visiblePassword,                          
                onChanged: (value) {},                           
                decoration: InputDecoration(                             
                  labelText: 'Mot de passe',                             
                  suffixIcon: IconButton(                               
                    onPressed: () {                                 
                      setState(() { 
              _passwordInVisible =  
                  _passwordInVisible;  
            });                               
          }, 
          icon: Icon( 
  _passwordInVisible? Icons.visibility_off: Icons.visibility), 
                            ), ),                         
                        ),                               
                         const SizedBox(                           
                          height: 20,                         
                          ), 
                        Container(                           
                          margin: const EdgeInsets.symmetric(vertical: 10),                           
                          width: MediaQuery.of(context).size.width * 0.8,                           
                          height: 50,                           
                          child: ClipRRect(                             
                            borderRadius: BorderRadius.circular(10),                             
                            child: ElevatedButton(                               
                              child: Text(                                 
                                "Connexion",                                 
                                style: TextStyle(fontSize: 14), 
                              ),                              
                               onPressed: () { 
                                _handleSubmit(context); 
                              },                                
                              style: ElevatedButton.styleFrom(                                  
                                 backgroundColor: Colors.red,                                   
                                 padding: const EdgeInsets.symmetric(                                      
                                   horizontal: 40, vertical: 15),                                   
                                   textStyle: TextStyle(                                       
                                    fontSize: 14,                                       
                                    fontWeight: FontWeight.bold)), 
                            ), 
                          ),
                        )
                      ],
                  
        )
      )
  ]
)
              ),
            ]))));
  }
  _handleSubmit(BuildContext context) {     
    if (_formkey.currentState!.validate()) {       
      var email = _emialEditController.text.trim();       
      var password = _passwordEditController.text.trim(); 
      if (email == "niangmaimouna2003@gmail.com" && password == "20032004") {         
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(           
          backgroundColor: Colors.green,           
          content: Text( 
            'Authentiification réussie',             
            style: TextStyle(fontWeight: FontWeight.bold), 
          ), 
        )); 
        Navigator.push(             
          context, MaterialPageRoute(builder: (context) => PageAccueil())); 
      } else {         
        showDialog(           
          context: context,           
          builder: (BuildContext context) {             
            return AlertDialog( 
              content: Text('Email ou mot de passe incorect'),              
               actions: <Widget>[                 TextButton(                   onPressed: () { 
                    Navigator.of(context).pop(); 
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                  ),
               ),
               ],
            );
          },);
      }
    }
  }

}



