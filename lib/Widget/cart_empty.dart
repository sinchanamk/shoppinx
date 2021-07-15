import 'package:ecommerce/const/colors.dart';
import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartEmpty extends StatelessWidget {
  const CartEmpty({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themechange=Provider.of<DarkThemeProvider>(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 80),
         width: double.infinity,
         height: MediaQuery.of(context).size.height*0.4,
         decoration:
          BoxDecoration(
            image:DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/emptycart.png'))),
        
        ),
        Text('Your Cart is Empty',textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).textSelectionColor,
          fontSize: 36,
          fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 50,),
             Text('Looks like you didn\'t add anything to your cart yet',textAlign: TextAlign.center,
        style: TextStyle(
          color: themechange.darkTheme?Theme.of(context).disabledColor:ColorsConsts.subTitle,
          fontSize: 26,
          fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 50,),
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.06,
              child: RaisedButton(onPressed: (){},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              side:BorderSide(color:Colors.red)),
              color: Colors.redAccent,
              child:Text('shop now'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textSelectionColor,
                fontSize: 26,
                fontWeight: FontWeight.w600
              ),
              )
              ),
            ),
       ] );
   
   
  }
}