import 'package:badges/badges.dart';
import 'package:ecommerce/Models/product.dart';
import 'package:ecommerce/Screens/cart.dart';
import 'package:ecommerce/Screens/wishlist.dart';
import 'package:ecommerce/Widget/feeds_product.dart';
import 'package:ecommerce/const/MyIcons.dart';
import 'package:ecommerce/const/colors.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/provider/favs_provider.dart';
import 'package:ecommerce/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class FeedScreen extends StatelessWidget {
 static const routeName = '/feeds';
 
  @override
  Widget build(BuildContext context) {
    final productProvider=Provider.of<Products>(context);
    List<Product> productList=productProvider.products;
    final popular=ModalRoute.of(context)!.settings.arguments as String;
    if(popular=='popular')
    {
      productList=productProvider.popularProducts;
    }
    return Scaffold(appBar: AppBar(
      title: Text('Feeds',textAlign: TextAlign.center,),
       actions: <Widget>[
                    Consumer<FavsProvider>(
                      builder: (_, favs, ch) =>
                    Badge(
                        badgeColor: ColorsConsts.cartBadgeColor,
                        animationType: BadgeAnimationType.slide,
                        toAnimate: true,
                        position: BadgePosition.topEnd(top: 5, end: 7),
                        badgeContent: Text(
                          favs.getFavsItems.length.toString(),
                          // favs.getFavsItems.length.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        child:
                         IconButton(
                          icon: Icon(
                            MyAppIcons.wishlist,
                            color: ColorsConsts.favColor,
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(WishListScreen.routeName);
                          },
                        ),),),
                     // ),
                    // ),
                    Consumer<CartProvider>(
                      builder: (_, cart, ch) => 
                    Badge(
                        badgeColor: ColorsConsts.cartBadgeColor,
                        animationType: BadgeAnimationType.slide,
                        toAnimate: true,
                        position: BadgePosition.topEnd(top: 5, end: 7),
                        badgeContent: Text(
                           cart.getCartItems.length.toString(),
                         
                        //  cart.getCartItems.length.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        
                       child:  IconButton(
                          icon: Icon(
                            MyAppIcons.cart,
                            color: ColorsConsts.cartColor,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(CartsScreen.routeName);
                          },
                        ),
                      
                    
               ) )]),
//         body:new StaggeredGridView.countBuilder(
//   crossAxisCount:6 ,
//   itemCount: 8,
//   itemBuilder: (BuildContext context, int index) =>FeedProducts(),
//   staggeredTileBuilder: (int index) =>
//       new StaggeredTile.count(3, index.isEven ? 4 : 5),
//   mainAxisSpacing: 8.0,
//   crossAxisSpacing: 5.0,
// ),
       body: GridView.count(crossAxisCount: 2,
        childAspectRatio: 240/450,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: List.generate(
          productList.length,
         (index) {
            return ChangeNotifierProvider.value(
              value: productList[index],
            child:FeedProducts(

        ),);
            })));
        
   
  }
}