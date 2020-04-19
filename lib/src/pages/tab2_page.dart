import 'package:flutter/material.dart';
import 'package:noticiero/src/models/category_model.dart';
import 'package:noticiero/src/services/news_service.dart';
import 'package:provider/provider.dart';

class Tabs2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: Scaffold(
                body: Column(
                      children: <Widget>[
                        Expanded(child: _ListCategories()),

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

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 100,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
                _CategoryButton(categories[index]),
                SizedBox(height: 5.0),
                Text(categories[index].name)
            ]),
          ),
        );
     },
    );
  }
}

class _CategoryButton extends StatelessWidget {
 
  final Category category;
  
  const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 40.0,
                  width:  40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(category.icon, color: Colors.orange),
                  
                  );
  }
}