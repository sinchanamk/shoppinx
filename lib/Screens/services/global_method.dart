import 'package:flutter/material.dart';

class GlobalMethod{
    Future<void> showDialogg(String title,String subtitle,Function fct,BuildContext context)
  async {
    showDialog(context: context,
     builder: (BuildContext ctx){
      return AlertDialog(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network('https://image.flaticon.com/icons/png/128/564/564619.png',
              height: 20,
              width: 70,),
            ),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text(title),
),
          ],
        ),
        content: Text(subtitle),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('cancel')),
          TextButton(onPressed:
          (){ fct();
          Navigator.pop(context);
        
          }, child: Text('OK')),
          
        ],
      );
    });}
    
 
 
}