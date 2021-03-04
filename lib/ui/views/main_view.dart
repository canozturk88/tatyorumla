import 'package:flutter/material.dart';

import '../../core/enums/viewstate.dart';
import '../../core/viewmodels/main_view_model.dart';
import '../shared/styles/colors.dart';
import 'baseview.dart';

class MainView extends StatefulWidget {
  MainView({Key key, Widget widget}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with WidgetsBindingObserver {
  MainViewModel _mainViewModel;

  //2.faz
  @override
  Widget build(BuildContext context) {
    return BaseView<MainViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        _mainViewModel = model;
        WidgetsBinding.instance.addObserver(this);
      },
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          key: MainViewModel.mainScaffoldKey,
          body: Stack(
            children: <Widget>[
              _mainViewModel.bottomBarChildren[_mainViewModel.currentIndex],
              _mainViewModel.state == ViewState.Busy ? Center(child: CircularProgressIndicator()) : Container()
            ],
          ),
          drawer: _mainViewModel.leftDrawerWidget,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _mainViewModel.currentIndex,
            backgroundColor: mainColor,
            onTap: _mainViewModel.onTabTapped,
            fixedColor: mainColor,
            items: <BottomNavigationBarItem>[
              _buildBottomNavigationBarItem(Icons.home, 'Anasayfa', 28, 0),
              _buildBottomNavigationBarItem(Icons.comment, 'Son Yorumlar', 28, 1),
              _buildBottomNavigationBarItem(Icons.add, 'Yorum Ekle', 28, 2),
              _buildBottomNavigationBarItem(Icons.search, 'Ara', 28, 3),
              _buildBottomNavigationBarItem(Icons.dashboard, 'Anketler', 28, 4),
            ],
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(IconData _icon, String _title, double _size, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          _icon,
          color: _mainViewModel.currentIndex == index ? Colors.white : Colors.grey,
          size: _size,
        ),
        // ignore: deprecated_member_use
        title: Text(_title));
  }

  @override
  void didUpdateWidget(MainView oldWidget) {
    // TODO: implement didUpdateWidget
    print('asd');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Future<bool> didPopRoute() {
    // TODO: implement didPopRoute
    print('asd');
    return super.didPopRoute();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    try {
      switch (state) {
        case AppLifecycleState.inactive:
          break;
        case AppLifecycleState.resumed:
          print('resumed:::::::::');
          break;
        case AppLifecycleState.paused:
          print('paused:::::::::');
          break;
        case AppLifecycleState.detached:
          break;
      }
    } catch (e) {
      print('sd');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}
