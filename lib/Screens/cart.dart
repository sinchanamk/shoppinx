import 'package:ecommerce/Screens/services/global_method.dart';
import 'package:ecommerce/Widget/cart_empty.dart';
import 'package:ecommerce/Widget/cartfull.dart';
import 'package:ecommerce/const/colors.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartsScreen extends StatelessWidget {
  static const routeName = '/cartscreen';  


  @override
  Widget build(BuildContext context) {
    final cartProvider=Provider.of<CartProvider>(context);
    GlobalMethod globalMethod=GlobalMethod();
    
   //List products=[];
    return cartProvider.getCartItems.isEmpty
        ?Scaffold(backgroundColor:Theme.of(context).backgroundColor,
        body:CartEmpty()
   ):Scaffold(
     bottomSheet: checkoutSection(context,
     cartProvider.totalAmount),
     appBar: AppBar(title: Text('Cart(${cartProvider.getCartItems.length})'),

     actions: [
       IconButton(onPressed: (){
           globalMethod.showDialogg('ClearCart',
                   'Cart will be clear from cart',
                   ()=> cartProvider.clearCart(),context);
       }, icon:Icon(
          Icons.delete),
            
            )     ],
                ),
                body: //Cartfull(),

    Container(margin: EdgeInsets.only(bottom: 60),
      child: ListView.builder(itemCount:cartProvider.getCartItems.length ,
      itemBuilder: (BuildContext context,int index){
         return ChangeNotifierProvider.value(
              value: cartProvider.getCartItems.values.toList()[index],
            child: Cartfull(
              productid: cartProvider.getCartItems.keys.toList()[index],
           
          // id:cartProvider.getCartItems.values.toList()[index].id,
          // productid:cartProvider.getCartItems.keys.toList()[index] ,
          // price:cartProvider.getCartItems.values.toList()[index].price,
          // imageUrl:cartProvider.getCartItems.values.toList()[index].imageUrl ,
          // quantity:cartProvider.getCartItems.values.toList()[index].quantity ,
          // title:cartProvider.getCartItems.values.toList()[index].title ,
          ) );
      }
   ),
    ) );
  }
  Widget checkoutSection(BuildContext context,double subtotal)
  {
    return Container(
      decoration:
      BoxDecoration(
        border:Border(top:BorderSide
      (color:Colors.grey,width:0.5),),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
       Expanded(flex: 2,
         child: Container(
           decoration: BoxDecoration(
                gradient: LinearGradient(colors:[
                   ColorsConsts.gradiendFStart,
                   ColorsConsts.gradiendFEnd,],
                   stops: [0.0,0.7]
              )),
              
           child: Material(
              borderRadius: BorderRadius.circular(30),
               
              color: Colors.transparent,
              child:InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('checkout',
                  style: TextStyle(color: Theme.of(context).textSelectionColor,
                  fontSize: 18,fontWeight: FontWeight.w600),),
                ),
              ),
           ),
         ),
       ) ,
       Spacer(),
Text('Total',textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).textSelectionColor,
                fontSize: 18,fontWeight: FontWeight.w600),),
 Text('US${subtotal.toStringAsFixed(3)} ',textAlign: TextAlign.center,
                style: TextStyle(color:Colors.blue,
                fontSize: 18,fontWeight: FontWeight.w600),),
              

      ],),
    );
  }
}