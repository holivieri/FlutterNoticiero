import 'package:flutter/material.dart';
import 'package:noticiero/src/pages/tab1_page.dart';
import 'package:provider/provider.dart';

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
                                  BottomNavigationBarItem(icon: Icon(Icons.account_balance), title: Text('Para ti')),
                                  BottomNavigationBarItem(icon: Icon(Icons.public), title: Text('Encabezados'))
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
                Container(color: Colors.orange)
            ],
            );
  }
}

class _NavegacionModel with ChangeNotifier {

  PageController _pageController = new PageController( initialPage: 1);


  int _paginaActual = 0;

  int get paginaActual => _paginaActual;

  set paginaActual( int valor ) {
    _paginaActual = valor;
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pagecontroller => this._pageController;


}