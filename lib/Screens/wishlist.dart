import 'package:ecommerce/Models/favs_attr.dart';
import 'package:ecommerce/Widget/cart_empty.dart';
import 'package:ecommerce/Widget/cartfull.dart';
import 'package:ecommerce/Widget/wishlist_empty.dart';
import 'package:ecommerce/Widget/wishlist_full.dart';
import 'package:ecommerce/provider/favs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/global_method.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/wishlist';  

  @override
  Widget build(BuildContext context) {
    final favsProvider=Provider.of<FavsProvider>(context);
     GlobalMethod globalMethod=GlobalMethod();
  
    return favsProvider.getFavsItems.isEmpty
    ?Scaffold(body:WishListEmpty())
    :Scaffold(
      
      appBar: AppBar(
      title: Text('WishList (${favsProvider.getFavsItems.length})'),
       actions: [
       IconButton(onPressed: (){
           globalMethod.showDialogg('Clear Wishlist',
                   'Wish will be clear from Wishlist',
                   ()=> favsProvider.clearFavs(),context);
       }, icon:Icon(
          Icons.delete),
            
            )     ],
    
    ),
  //       body:WishListEmpty()
  //  ):Scaffold(
     body: 
     ListView.builder(
       itemCount: favsProvider.getFavsItems.length,
       itemBuilder: (BuildContext ctx,int index)
       {
          return ChangeNotifierProvider.value(
                  value: favsProvider.getFavsItems.values.toList()[index],
                  child: WishListFull(
                    productid: favsProvider.getFavsItems.keys.toList()[index],
                  ));
       }),
     
       );
  }
}