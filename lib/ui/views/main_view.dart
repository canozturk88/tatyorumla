import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tadayim_bunu/router/router.gr.dart';
import 'package:tadayim_bunu/ui/views/home/home_view.dart';
import 'package:tadayim_bunu/ui/views/product/product_comment_view.dart';
import '../../core/viewmodels/main_view_model.dart';
import '../shared/styles/colors.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'like/commend_like_view.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _mainViewModel = watch(mainViewProvider);
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) {
        return AppBar(
          title: Text(tabsRouter.current.name),
          leading: AutoBackButton(),
        );
      },
      backgroundColor: Colors.white,

      // fixedColor: mainColor,
      // key: MainViewModel.mainScaffoldKey,
      // body: Stack(
      //   children: <Widget>[
      //     _mainViewModel.bottomBarChildren[_mainViewModel.currentIndex],
      //     // _mainViewModel.state == ViewState.Busy ? Center(child: CircularProgressIndicator()) : Container()
      //   ],
      // ),
      drawer: _mainViewModel.leftDrawerWidget,
      routes: const [HomeRoute(), ProductSearchRoute(), ProductSearchRoute()],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          //backgroundColor: Colors.greenAccent,
          backgroundColor: mainColor,
          fixedColor: Colors.white,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Flow',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.comment),
              label: 'Akis',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Ekle',
            ),
          ],
        );
      },
    );
  }

  // bottomNavigationBar: BottomNavigationBar(
  //   type: BottomNavigationBarType.fixed,
  //   showSelectedLabels: false,
  //   showUnselectedLabels: false,
  //   currentIndex: _mainViewModel.currentIndex,
  //   backgroundColor: mainColor,
  //   onTap: _mainViewModel.onTabTapped,
  //   fixedColor: mainColor,
  //   items: <BottomNavigationBarItem>[
  //     _buildBottomNavigationBarItem(Icons.home, 'Anasayfa', 28, 0, _mainViewModel),
  //     _buildBottomNavigationBarItem(Icons.comment, 'Son Yorumlar', 28, 1, _mainViewModel),
  //     _buildBottomNavigationBarItem(Icons.add, 'Yorum Ekle', 28, 2, _mainViewModel),
  //     _buildBottomNavigationBarItem(Icons.search, 'Ara', 28, 3, _mainViewModel),
  //     _buildBottomNavigationBarItem(Icons.dashboard, 'Anketler', 28, 4, _mainViewModel),
  //   ],
  // ),

}

BottomNavigationBarItem _buildBottomNavigationBarItem(IconData _icon, String _title, double _size, int index, MainViewModel mainViewModel) {
  return BottomNavigationBarItem(
      icon: Icon(
        _icon,
        color: mainViewModel.currentIndex == index ? Colors.white : Colors.grey,
        size: _size,
      ),
      // ignore: deprecated_member_use
      title: Text(_title));
}
//}

// class MainView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData.dark(),
//       home: Scaffold(body: _MainViewState()),
//     );
//   }
// }

// // ignore: must_be_immutable
// class _MainViewState extends ConsumerWidget with WidgetsBindingObserver {
//   late MainViewModel _mainViewModel;

//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     final _mainViewModel = watch(counterProvider);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       key: MainViewModel.mainScaffoldKey,
//       body: Stack(
//         children: <Widget>[
//           _mainViewModel.bottomBarChildren[_mainViewModel.currentIndex],
//           //  _mainViewModel.state == ViewState.Busy ? Center(child: CircularProgressIndicator()) : Container()
//         ],
//       ),
//       drawer: _mainViewModel.leftDrawerWidget,
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         currentIndex: _mainViewModel.currentIndex,
//         backgroundColor: mainColor,
//         onTap: _mainViewModel.onTabTapped,
//         fixedColor: mainColor,
//         items: <BottomNavigationBarItem>[
//           _buildBottomNavigationBarItem(Icons.home, 'Anasayfa', 28, 0),
//           _buildBottomNavigationBarItem(Icons.comment, 'Son Yorumlar', 28, 1),
//           _buildBottomNavigationBarItem(Icons.add, 'Yorum Ekle', 28, 2),
//           _buildBottomNavigationBarItem(Icons.search, 'Ara', 28, 3),
//           _buildBottomNavigationBarItem(Icons.dashboard, 'Anketler', 28, 4),
//         ],
//       ),
//     );
//     //   },
//     // );
//   }

//   BottomNavigationBarItem _buildBottomNavigationBarItem(IconData _icon, String _title, double _size, int index) {
//     return BottomNavigationBarItem(
//         icon: Icon(
//           _icon,
//           color: _mainViewModel.currentIndex == index ? Colors.white : Colors.grey,
//           size: _size,
//         ),
//         // ignore: deprecated_member_use
//         title: Text(_title));
//   }
// }
