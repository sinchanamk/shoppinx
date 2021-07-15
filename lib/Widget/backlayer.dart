import 'package:ecommerce/Screens/cart.dart';
import 'package:ecommerce/Screens/feed.dart';
import 'package:ecommerce/const/MyIcons.dart';
import 'package:ecommerce/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BackLayerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  ColorsConsts.starterColor,
                  ColorsConsts.endColor,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        Positioned(
          top: -100.0,
          left: 140.0,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 250,
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 100.0,
          child: Transform.rotate(
            angle: -0.8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 300,
            ),
          ),
        ),
        Positioned(
          top: -50.0,
          left: 60.0,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 200,
            ),
          ),
        ),
        Positioned(
          bottom: 10.0,
          right: 0.0,
          child: Transform.rotate(
            angle: -0.8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 200,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      //   clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
               InkWell(
                 onTap: (){
                   Navigator.of(context).pushNamed(
                     FeedScreen.routeName);
                 },
               
               child:Row(mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Feeds',
                    textAlign: TextAlign.center,
                    ),
                  ),
                  Icon(Icons.rss_feed_outlined)
                   ],
               ),),
                // const SizedBox(height: 10.0),
                // content(context,(){
                //   navigateTo(context, FeedScreen.routeName);},
                //   'Feeds',0),
                //    const SizedBox(height: 10.0),
                // content(context,(){
                //   navigateTo(context, FeedScreen.routeName);},
                //   'WishList',0),
                // const SizedBox(height: 10.0),
                // content(context,(){
                //   Navigator.pushNamed(context, FeedScreen.routeName);},
                //   'Carts',0),
                // const SizedBox(height: 10.0),
                // content(context,(){
                //   Navigator.pushNamed(context, FeedScreen.routeName);},
                //   'Carts',1),
  
                // // const SizedBox(height: 10.0),
                // content(context, () {
                //   Navigator.of(context).pushNamed(CartsScreen.routeName);
                // }, 'Cart', 1),
                // const SizedBox(height: 10.0),
                // content(context, () {
                //   Navigator.of(context).pushNamed(FeedScreen.routeName);
                // }, 'Wishlist', 2),
                // const SizedBox(height: 10.0),
                // content(context, () {
                //   Navigator.of(context).pushNamed(FeedScreen.routeName);
                // }, 'Upload a new product', 3),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List _contentIcons = [
    MyAppIcons.rss,
    MyAppIcons.bag,
    MyAppIcons.wishlist,
    MyAppIcons.upload
  ];
  void navigateTo(BuildContext ctx, String routeName) {
    Navigator.of(ctx).pushNamed(
      routeName,
    );
  }

  Widget content(BuildContext ctx,
  Function fct, 
   String text, 
   int index) {
    return InkWell(
    onTap:fct(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          Icon(_contentIcons[index])
        ],
      ),
    );
  }
}
