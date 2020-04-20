import 'package:flutter/material.dart';
import 'package:noticiero/src/pages/tab1_page.dart';
import 'package:noticiero/src/pages/tab2_page.dart';
import 'package:noticiero/src/pages/tab3_page.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _NavegacionModel(),
          child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {

 

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
                            currentIndex: navegacionModel.paginaActual,
                            onTap: (i) => navegacionModel.paginaActual = i,
                            items: [
                                  BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.solidFlag), title: Text('Argentina')),
                                  BottomNavigationBarItem(icon: Icon(Icons.public), title: Text('Categorias')),
                                  BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.canadianMapleLeaf), title: Text('Canada')),
                                  ]
                            );
  }
}

class _Paginas extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
            controller: navegacionModel.pagecontroller,
            //physics: BouncingScrollPhysics(), // para poder mover las pantallas
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
                Tab1Page(),
                Tabs2Page(),
                Tab3Page(),
            ],
            );
  }
}

class _NavegacionModel with ChangeNotifier {

  PageController _pageController = new PageController( initialPage: 0);
  int _paginaActual = 0;

  int get paginaActual => _paginaActual;

  set paginaActual( int valor ) {
    _paginaActual = valor;
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pagecontroller => this._pageController;


}