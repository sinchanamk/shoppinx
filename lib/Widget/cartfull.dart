import 'package:ecommerce/Models/cart_attr.dart';
import 'package:ecommerce/Screens/services/global_method.dart';
import 'package:ecommerce/const/colors.dart';
import 'package:ecommerce/inner_screens/product_details.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Cartfull extends StatefulWidget {
  final String productid;

  const Cartfull({ required this.productid});

//  final String id;
//  final String productid;
//  final double price;
//  final int quantity;
//  final String title;
//  final String imageUrl;

//   const Cartfull({ required this.id,
//    required this.productid, required this.price,
//     required this.quantity, required this.title, 
//     required this.imageUrl});
  @override
  _CartfullState createState() => _CartfullState();
}

class _CartfullState extends State<Cartfull> {
  @override
  Widget build(BuildContext context) {
    final themeChange=Provider.of<DarkThemeProvider>(context);
   final cartAttr=Provider.of<CartAttr>(context);
   final cartProvider = Provider.of<CartProvider>(context);
    double subtotal=cartAttr.price*cartAttr.quantity;
    GlobalMethod globalMethod=GlobalMethod();
    return InkWell(
      onTap: (){ 
        Navigator.pushNamed(context, 
        ProductDetails.routeName,arguments:widget. productid);
     },
      child: Container(height: 200,margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.only(
          bottomRight:const Radius.circular(16.0),
          topRight: const Radius.circular(16.0)
        ),
        color:Colors.blue//Theme.of(context).backgroundColor,
        ),
       child: Padding(
         padding: const EdgeInsets.all(10.0),
         child:  Row(children: [
                Container(width: 130,
                  decoration: BoxDecoration
                  (image: DecorationImage(
                    image: NetworkImage(
                      cartAttr.imageUrl),
                  )),
                ),
                Flexible(child: Column(
                  children: [
                    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                      Flexible(child: Text(cartAttr.title,
                  maxLines: 2,overflow: TextOverflow.ellipsis,
                   style: TextStyle(fontWeight: FontWeight.w900,
                     fontSize: 15),)),
                    
                 
               Material(
                 color: Colors.transparent,
                 child:InkWell(borderRadius: BorderRadius.circular(16.0),
                 onTap:(){
                   globalMethod.showDialogg('RemoveItem',
                   'Product will be remove from cart',
                   ()=>cartProvider.removeItem(widget.productid),context);
                      //cartProvider.removeItem(widget.productid);
                 } ,
                 child: Container(
                   height: 50,width: 50,
                  child: Icon(Icons.clear,
                  color:Colors.red,size: 22 ,)
                 ),
               ) 
              ),
               ],),
          
    Row(children: [
      Text('price:'),
      SizedBox(width: 5,),
      Text('${cartAttr.price}\$',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
    ],),
    Row(children: [
      Text('subTotal:'),
      SizedBox(width: 5,),
      FittedBox(
        child: Text('$subtotal\$',style: TextStyle(
        fontSize: 15,fontWeight: FontWeight.bold,
        color: themeChange.darkTheme?Colors.brown.shade900:Theme.of(context).primaryColor),),
      )
    ],),
      Row(
          children: [
            Text('ships Free',style: TextStyle(
              color:themeChange.darkTheme?Colors.brown.shade900:
              Theme.of(context).primaryColor),),
           Spacer(),
           Material(
                 color: Colors.transparent,
                 child:InkWell(borderRadius: BorderRadius.circular(16.0),
                 onTap:(){
                   cartProvider.addProductToCart(widget.productid,cartAttr.price
           , cartAttr.title,cartAttr.imageUrl);
                 } ,
                 child: Container(
                   height: 50,width: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.add_box,color:Colors.red,size: 22 ,),
                  )
                 ),
               ) 
              ),
              Card(elevation: 8,child: Container(
                width: 40,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors:[
                     ColorsConsts.gradiendFStart,
                     ColorsConsts.gradiendFEnd,],
                     stops: [0.0,0.7]
                )),
                child: Text(cartAttr.quantity.toString(),
                textAlign: TextAlign.center,),
              ),),
               
               Material(
                 color: Colors.transparent,
                 child:InkWell(borderRadius: BorderRadius.circular(16.0),
                 onTap:cartAttr.quantity<2 ? null:(){
                     cartProvider.reduceItemByOne(widget.productid,);
                 
                 } ,
                 child: Container(
                   height: 50,width: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.remove,
                    color:cartAttr.quantity<2 ? Colors.red:Colors.yellow,size: 22 ,),
                  )
                 ),
               ) 
              ),
          ])
           ])  ) ]))),
    );
         
  }
}