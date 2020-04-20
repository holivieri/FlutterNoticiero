import 'package:flutter/material.dart';
import 'package:noticiero/src/models/category_model.dart';
import 'package:noticiero/src/services/news_service.dart';
import 'package:noticiero/src/theme/tema.dart';
import 'package:noticiero/src/widgets/listanoticias.dart';
import 'package:provider/provider.dart';

class Tabs2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final newsservice = Provider.of<NewsService>(context);

      return SafeArea(
            child: Scaffold(
                body: Column(
                      children: <Widget>[
                        _ListCategories(),
                        Expanded(child: ListaNoticias(newsservice.getArticlesbySelectedCategory))
                    ]
                ), 
            ) ,
            );
  }
}

class _ListCategories extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80.0,
      color: Colors.orange,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {

          final cName= categories[index].name;

          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
                _CategoryButton(categories[index]),
                SizedBox(height: 5.0),
                Text( '${ cName[0].toUpperCase() + cName.substring(1)}')
            ]),
          );
       },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
 
  final Category category;
  
  const _CategoryButton(this.category);
  

  @override
  Widget build(BuildContext context) {
    final newsservice = Provider.of<NewsService>(context);

    return GestureDetector(
          onTap: () { 
             final newsservice = Provider.of<NewsService>(context, listen: false);
             newsservice.selectedCategory = category.name; 
          },
          child: Container(
                    height: 40.0,
                    width:  40.0,
                    margin: EdgeInsets.symmetric( horizontal: 10.0 ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: (newsservice.selectedCategory == category.name 
                            ? Icon(category.icon, color: miTema.accentColor) 
                            : Icon(category.icon, color: Colors.black54)  ) ,
                    
                    ),
    );
  }
}