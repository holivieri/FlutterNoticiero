import 'package:flutter/material.dart';
import 'package:noticiero/src/services/news_service.dart';
import 'package:noticiero/src/widgets/listanoticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
 // AutomaticKeepAliceCLientMixin para mantener el estado (la posicion de donde estaba)

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final headlines = Provider.of<NewsService>(context).headlines;
      return Scaffold(
      body: (headlines.length == 0 ) ?
            Center(child: CircularProgressIndicator())
            : ListaNoticias(headlines)
    );
  }

  @override
  bool get wantKeepAlive => true;
}

