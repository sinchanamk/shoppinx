 //@dart=2.9
import 'package:ecommerce/Screens/cart.dart';
import 'package:ecommerce/Screens/feed.dart';
import 'package:ecommerce/Screens/wishlist.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/provider/favs_provider.dart';
import 'package:ecommerce/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottomnav.dart';
import 'const/theme_data.dart';
import 'inner_screens/brands_navigation_rail.dart';
import 'inner_screens/categories_feeds.dart';
import 'inner_screens/product_details.dart';
import 'provider/dark_theme_provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
   DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    print('called ,sinchuuuuu');
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
   return MultiProvider(providers: [
      ChangeNotifierProvider(create:(_){
        return themeChangeProvider;
        
      }),
       ChangeNotifierProvider(
         create:(_)=>Products()
       ),
        ChangeNotifierProvider(
         create:(_)=>CartProvider()
       ),
 ChangeNotifierProvider(
         create:(_)=>FavsProvider()
       ),

    ],
    child: Consumer<DarkThemeProvider>(
      builder:(context,themeData,child){

    return MaterialApp(
      
      title: 'Shoppinx',
      theme:   Styles.themeData(
        themeChangeProvider.darkTheme, context),
        
      home: BottomBarScreen(),
       routes: {
                    //   '/': (ctx) => LandingPage(),
                    BrandNavigationRailScreen.routeName: (ctx) =>BrandNavigationRailScreen(key: null,),
                    CartsScreen.routeName: (ctx) => CartsScreen(),
                    FeedScreen.routeName: (ctx) => FeedScreen(),
                  WishListScreen.routeName: (ctx) => WishListScreen(),
                    ProductDetails.routeName: (ctx) => ProductDetails(),
                   CategoriesFeedsScreen.routeName: (ctx) =>CategoriesFeedsScreen(),
                   // LoginScreen.routeName: (ctx) => LoginScreen(),
                   // SignUpScreen.routeName: (ctx) => SignUpScreen(),
                    BottomBarScreen.routeName: (ctx) => BottomBarScreen(),
                   // UploadProductForm.routeName: (ctx) => UploadProductForm(),
                  },
 
    );
  }));
}}