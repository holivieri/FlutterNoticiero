import 'package:flutter/material.dart';
import 'package:noticiero/src/services/news_service.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: Center(child: Text('Hola mundo')
      ),
    );
  }
}