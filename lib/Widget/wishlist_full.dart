import 'package:ecommerce/Models/favs_attr.dart';
import 'package:ecommerce/Models/favs_attr.dart';
import 'package:ecommerce/Screens/services/global_method.dart';
import 'package:ecommerce/const/colors.dart';
import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:ecommerce/provider/favs_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class WishListFull extends StatefulWidget {
   final String productid;

  const WishListFull({ required this.productid});
 
  @override
  _WishListFullState createState() => _WishListFullState();
}

class _WishListFullState extends State<WishListFull> {
  
  @override
  Widget build(BuildContext context) {
     final favsAttr=Provider.of<FavsAttr>(context);
   
   return Stack(children: [
Container(
  width: double.infinity,
  margin: EdgeInsets.only(right: 10.0,bottom: 10.0),
  child: Material(
    color: Theme.of(context).backgroundColor,
    borderRadius: BorderRadius.circular(5.0),
    elevation: 3.0,
    child: InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              height: 80,
              child: Image.network( 
               favsAttr.imageUrl),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                favsAttr.title,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,  
              ),
              Text(
                '\${$favsAttr.price} ',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
            
              ),
            ],
            )
             ),
          ],
        ),
      ),
    ),
  ),
),

positionedRemove(widget.productid),
   ],);      
  }

  Widget positionedRemove(String productid)
  {
       final favsProvider=Provider.of<FavsProvider>(context);
   GlobalMethod globalMethod=GlobalMethod();
   
    return Positioned(
      top: 30,
     right: 15,
      child: Container(
        height: 30,
        width: 30,
        child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            padding: EdgeInsets.all(0.0),
            color: ColorsConsts.favColor,
            child: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed:(){ globalMethod.showDialogg('Remove from wishlist',
                   'This product will be remove from wishlist',
                    () => favsProvider.removeItem(productid),context);}
                    )));
      
  }
}