import 'package:flutter/material.dart';
import 'package:noticiero/src/models/news_models.dart';
import 'package:http/http.dart' as http;



final _URL_NEWS = 'https://newsapi.org/v2';
final _API_KEY = '694aa29d7aa845c39eb804668a4c9858';
final _COUNTRY = 'ar';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    
    final url = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=$_COUNTRY';
    final resp = await  http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();


  }

}