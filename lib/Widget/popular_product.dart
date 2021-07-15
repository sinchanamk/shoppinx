import 'package:ecommerce/Models/product.dart';
import 'package:ecommerce/const/MyIcons.dart';
import 'package:ecommerce/inner_screens/product_details.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/provider/favs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class PopularProducts extends StatelessWidget {
  
// final String imageUrl;
// final String title;
// final double price;
// final String description;

//   const PopularProducts({Key? key, required this.imageUrl, required this.title,
//    required this.price, required this.description}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     final productAtrribute=Provider.of<Product>(context);
      final cartProvider = Provider.of<CartProvider>(context);
final favsProvider = Provider.of<FavsProvider>(context);


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width:250,
        decoration:BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0,),
           bottomRight: Radius.circular(10.0),
         ),
          ),

        child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      10.0,
                    ),
                    bottomRight: Radius.circular(10.0),
                  ),
                  onTap: (){
                     Navigator.pushNamed(context, ProductDetails.routeName,arguments: productAtrribute.id);
   
                  },       
              child:Column(children: [
                Stack(children: [
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                      image:DecorationImage(image:
                      NetworkImage(productAtrribute.imageUrl),),
                  )
              ),
Positioned(right: 10,top: 8,
child:Icon(Icons.star,
color:favsProvider.getFavsItems.containsKey(productAtrribute.id)?Colors.red:Colors.grey,

),
),
Positioned(right: 10,top: 8,
child:Icon(Icons.star_outline,
color:Colors.grey.shade800),
),
Positioned(
  right: 12,
  bottom: 32.0,
  child: Container(
    padding: EdgeInsets.all(10.0),
    color: Theme.of(context).backgroundColor,
    child: Text(
      '\$ ${productAtrribute.price}',
      style: TextStyle(
        color: Theme.of(context).textSelectionColor,
      ),
    ),
  ),
  )
  ],
  ),
  Container(
padding: EdgeInsets.all(8.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Text(
  productAtrribute.title,
    maxLines: 1,
    style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold),
  ),
  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 3,
        child: Text(
        productAtrribute.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
          fontSize: 18.0,
          color: Colors.grey[800],
          fontWeight: FontWeight.w500),
        ),
      ), 
  Spacer(),
  Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: 
                          cartProvider.getCartItems.containsKey(productAtrribute.id)
                        ?(){}
                        :(){
                          cartProvider.addProductToCart(
                            productAtrribute.id,
                            productAtrribute.price ,
                             productAtrribute.title,
                             productAtrribute.imageUrl
                            );
                        
      },
      borderRadius: BorderRadius.circular(30.0),
      child: Icon(
        cartProvider.getCartItems.containsKey(
          productAtrribute.id)?Icons.check_box:
      MyAppIcons.cart,
      size: 25,
      color: Colors.black,),
    ),
  ),

    ],
  )
  ],
  ),
  )])))),
    );
                                  }
                                  }