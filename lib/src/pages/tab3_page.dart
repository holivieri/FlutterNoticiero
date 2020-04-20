import 'package:flutter/material.dart';
import 'package:noticiero/src/services/news_service.dart';
import 'package:noticiero/src/widgets/listanoticias.dart';
import 'package:provider/provider.dart';

class Tab3Page extends StatefulWidget {
  
  @override
  _Tab3PageState createState() => _Tab3PageState();
}

class _Tab3PageState extends State<Tab3Page> with AutomaticKeepAliveClientMixin {
 // AutomaticKeepAliceCLientMixin para mantener el estado (la posicion de donde estaba)

  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlinesCanada;
      return Scaffold(
      body: (headlines.length == 0 ) ?
            Center(child: CircularProgressIndicator())
            : ListaNoticias(headlines)
    );
  }

  @override
  bool get wantKeepAlive => true;
}

