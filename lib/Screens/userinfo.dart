import 'package:ecommerce/Screens/cart.dart';
import 'package:ecommerce/Screens/wishlist.dart';
import 'package:ecommerce/const/MyIcons.dart';
import 'package:ecommerce/const/colors.dart';
import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  ScrollController _scrollController=new ScrollController();
  var top = 0.0;
 bool _value=false;
  @override
  Widget build(BuildContext context) {
      final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        body:  CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 4,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return Container(
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
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: top <= 110.0 ? 1.0 : 0,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: kToolbarHeight / 1.8,
                                  width: kToolbarHeight / 1.8,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 1.0,
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  // 'top.toString()',
                                  'Guest',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      background: Image(
                        image: NetworkImage(
                            'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child:
        Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(padding: const EdgeInsets.only(
              left: 8.0,),
            child: userTitle('  User Bag',context,),
            ),
            Divider(thickness: 1,color: Colors.grey,),
           Material(color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(onTap: ()=>Navigator.of(context).pushNamed(WishListScreen.routeName),
      title: Text('title'),
        subtitle: Text('subTitle'),
        trailing: Icon(Icons.chevron_right_rounded),
        leading: Icon(MyAppIcons.wishlist),
        ),

      ),
      ),
           Material(color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(onTap: ()=>Navigator.of(context).pushNamed(CartsScreen.routeName),
      title: Text('cart'),
       // subtitle: Text('subTitle'),
        trailing: Icon(Icons.chevron_right_rounded),
        leading: Icon(MyAppIcons.cart),
        ),

      ),
      ),
        Divider(),
     
            Padding(padding: const EdgeInsets.only(
              left: 0.0),
            child: userTitle('User Information',context),
            ),
            Divider(thickness: 1,color: Colors.grey,),
            userListTile('Email', 'subTitle Email',0, context),

           userListTile('Phone', 'Phone subTitle',1, context),
            userListTile('Shipping', 'Shipping subTitle',2, context),
            userListTile('Shipping Address', 'Shipping Address subTitle',3, context),
            userListTile('Joined Address', 'Joined aadresssubTitle',4, context),  
         Padding(padding: const EdgeInsets.only(left: 8.0),
         child: userTitle('User Settings', context),
         ),
         Divider(thickness: 3,color: Colors.grey,),
    ListTileSwitch(  
	    value:themeChange.darkTheme,  
		leading: Icon(Icons.access_alarms),  
		onChanged: (value) {  
		  setState(() {  
			themeChange.darkTheme = value;  
		  });
		},
		visualDensity: VisualDensity.comfortable,
		switchType: SwitchType.cupertino,
		switchActiveColor: Colors.indigo,  
		title: Text('Dark theme'),  
	 ),
   userListTile("Logout", "subTitle", 4, context),
           ] ),)])
           );
    
  }
 Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }

  List<IconData> _userTileIcons=[
Icons.email,
Icons.phone,
Icons.local_shipping,
Icons.watch_later,
Icons.exit_to_app_rounded
  ];

  Widget userListTile(String title,String subTitle,int index,BuildContext context)
  {
    return Material(color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(onTap: (){},
        title: Text(title),
        subtitle: Text(subTitle),
        leading: Icon(_userTileIcons[index]),
        ),

      ),
      );

  }

  Widget userTitle(String title,BuildContext context)
  {return Text(title,style: TextStyle(
    fontWeight: FontWeight.bold,fontSize: 20),);

  }
}
