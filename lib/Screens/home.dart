import 'package:backdrop/app_bar.dart';
import 'package:backdrop/button.dart';
import 'package:backdrop/scaffold.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce/Screens/feed.dart';
import 'package:ecommerce/Widget/backlayer.dart';
import 'package:ecommerce/Widget/category.dart';
import 'package:ecommerce/Widget/feeds_product.dart';
import 'package:ecommerce/Widget/popular_product.dart';
import 'package:ecommerce/const/colors.dart';
import 'package:ecommerce/inner_screens/brands_navigation_rail.dart';
import 'package:ecommerce/inner_screens/brands_rail_widget.dart';
import 'package:ecommerce/provider/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _carouselImages=[
    'assets/carousel1.png',
    'assets/carousel2.jpeg',
    'assets/carousel3.jpg',
    'assets/carousel4.png',
  ];
List _brandimages=[
        'assets/addidas.jpg',
        'assets/Dell.jpg',
        'assets/h&m.jpg',
        'assets/Huawei.jpg',
        'assets/nike.jpg',
        'assets/samsung.jpg',
      ];
  @override
  Widget build(BuildContext context) {
     final productsData = Provider.of<Products>(context);
    final popularItems = productsData.popularProducts;
    print('popularItems length ${popularItems.length}');
   
    return Scaffold(
        body: Center(
      child: BackdropScaffold(
        frontLayerBackgroundColor:
         Theme.of(context).scaffoldBackgroundColor,
        headerHeight:MediaQuery.of(context).size.height*0.25,
  appBar: BackdropAppBar(
    title: Text("Home"),
    leading: BackdropToggleButton(
      icon: AnimatedIcons.menu_home),
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors:[ColorsConsts.starterColor,
        ColorsConsts.endColor]),
      ),),
    actions: <Widget>[
      IconButton(iconSize:13 ,
      padding: const EdgeInsets.all(10),
      icon:CircleAvatar(radius: 15,
      backgroundColor: Colors.white,
      child: CircleAvatar(radius: 13,
     backgroundImage: NetworkImage(
    'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                ),
                ),
      onPressed: (){},
      ),
       ],
  ),
  backLayer: BackLayerMenu(),
  frontLayer: 
  SingleChildScrollView(child: 
   Column(  crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(height: 190,
              width: double.infinity,
                child: Carousel(
                  boxFit: BoxFit.fill,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 6.0,
                  dotIncreasedColor: Colors.yellow,
                  dotBgColor: Colors.black.withOpacity(0.2),
                  dotPosition: DotPosition.bottomCenter,
                  showIndicator: true,
                  indicatorBgPadding: 5.0,
                  images: [
                         ExactAssetImage(_carouselImages[0]),
                         ExactAssetImage(_carouselImages[1]),
                         ExactAssetImage(_carouselImages[2]),
                          ExactAssetImage(_carouselImages[3]),
                
                  ],
                ),
              ),
         Padding(
            padding: const EdgeInsets.all(8.0),
            child: 
            Text('Categories',style: TextStyle(fontWeight: FontWeight.w500,
            fontSize: 20,
            ),),),
            Container(
                width: double.infinity,
              height: 180,
              child:ListView.builder(
                itemCount:7,//shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder:(BuildContext context,int index)
              {
                return Category(index: index,);
            
              } ),),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
                   children: [
                     Text('Popular brands',
                          style: TextStyle(fontSize:20,fontWeight: FontWeight.w800 ),
                          ),
                        Spacer(),
                        FlatButton(onPressed: (){},
                         child:Text('View All.....',
                        style: TextStyle(fontSize: 15,
                        color:Colors.red,
                        fontWeight: FontWeight.w300),
                        ),
                        ),
                   ]),
             ),
           
          
      Container(
        height: 210,
        width: MediaQuery.of(context).size.width*0.95,
        child: Swiper(
          itemCount: _brandimages.length,
          autoplay: true,
          viewportFraction: 0.8,
          scale: 0.9,
          onTap:(index){
            Navigator.of(context).pushNamed(BrandNavigationRailScreen.routeName,
                      arguments: {
                        index,
                      },
                    );
          },
          itemBuilder: (BuildContext context,
          int index){
          return ClipRect(
            child: Container(
              color: Colors.blueGrey,
              child: Image.asset(
                  _brandimages[index],
                  fit: BoxFit.fill,
              ),
            ),
          );
        },
        ),),
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
            children: [
              Text('Popular products',
                  style: TextStyle(fontSize:20,fontWeight: FontWeight.w800 ),
                  ),
                Spacer(),
                FlatButton(onPressed: (){
                  Navigator.pushNamed(context, FeedScreen.routeName,arguments: 'popular');
                },
                  child:Text('View All.....',
                style: TextStyle(fontSize: 15,
                color:Colors.red,
                fontWeight: FontWeight.w300),
                ),
                ),
            ]),
      ),
    Container(
      width: double.infinity,
      height: 285,
      margin: EdgeInsets.symmetric(horizontal: 3),
      child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularItems.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return ChangeNotifierProvider.value(
                        value: popularItems[index],
                        child: PopularProducts(
                        // imageUrl: popularItems[index].imageUrl,
                        //     title: popularItems[index].title,
                        //     description: popularItems[index].description,
                        //     price: popularItems[index].price,
                            
                       ) );
        }),
    )
     ] ) ))));
        }
}