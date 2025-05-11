import 'package:flutter/material.dart';

void showMessageDialog(
    BuildContext context, String titleMessage, String errorMessage) {
  showDialog(
    context:context,
    builder:(BuildContext context) {
      return AlertDialog(
        title: Text(titleMessage),
       content:  SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(errorMessage),
          ],
        ),
       ), 
       actions: <Widget>[
        TextButton(
          child: Text('Oui'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
},
);    
}