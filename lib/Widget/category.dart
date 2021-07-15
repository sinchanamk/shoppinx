import 'package:ecommerce/Screens/feed.dart';
import 'package:ecommerce/inner_screens/categories_feeds.dart';
import 'package:flutter/material.dart';
class Category extends StatefulWidget {
  final int index;
  Category({Key? key,  required this.index}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
List<Map<String, Object>> categories = [
    {
      'categoryName': 'Phones',
      'categoryImagesPath': 'assets/CatPhones.png',
    },
    {
      'categoryName': 'Clothes',
      'categoryImagesPath': 'assets/CatClothes.jpg',
    },
    {
      'categoryName': 'Shoes',
      'categoryImagesPath': 'assets/CatShoes.jpg',
    },
    {
      'categoryName': 'Beauty&Health',
      'categoryImagesPath': 'assets/CatBeauty.jpg',
    },
    {
      'categoryName': 'Laptops',
      'categoryImagesPath': 'assets/CatLaptops.png',
    },
    {
      'categoryName': 'Furniture',
      'categoryImagesPath': 'assets/CatFurniture.jpg',
    },
    {
      'categoryName': 'Watches',
      'categoryImagesPath': 'assets/CatWatches.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       
        InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(CategoriesFeedsScreen.routeName,arguments: '${categories[widget.index]['categoryName']}');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
             image: DecorationImage(
                      image: AssetImage(categories[widget.index]['categoryImagesPath'].toString()),
                    fit: BoxFit.cover),
                  ),
                   margin: EdgeInsets.symmetric(horizontal: 10),
              width: 150,
              height: 150,
            ),
        ),
        
        Positioned(
          bottom: 0,
          left: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: Theme.of(context).backgroundColor,
            child: Text(
              categories[widget.index]['categoryName'].toString(),
             
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Theme.of(context).textSelectionColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}


            