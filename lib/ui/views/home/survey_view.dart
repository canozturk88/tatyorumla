// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final _formKey = GlobalKey<FormState>();
//   final _openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("DropdownSearch Demo")),
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//         child: Form(
//           key: _formKey,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           child: ListView(
//             padding: EdgeInsets.all(4),
//             children: <Widget>[
//               ///Menu Mode with no searchBox
//               DropdownSearch<String>(
//                 validator: (v) => v == null ? "required field" : null,
//                 hint: "Select a country",
//                 mode: Mode.MENU,
//                 showSelectedItem: true,
//                 items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
//                 label: "Menu mode *",
//                 showClearButton: true,
//                 onChanged: print,
//                 popupItemDisabled: (String s) => s.startsWith('I'),
//                 selectedItem: "Tunisia",
//                 onBeforeChange: (a, b) {
//                   AlertDialog alert = AlertDialog(
//                     title: Text("Are you sure..."),
//                     content: Text("...you want to clear the selection"),
//                     actions: [
//                       FlatButton(
//                         child: Text("OK"),
//                         onPressed: () {
//                           Navigator.of(context).pop(true);
//                         },
//                       ),
//                       FlatButton(
//                         child: Text("NOT OK"),
//                         onPressed: () {
//                           Navigator.of(context).pop(false);
//                         },
//                       ),
//                     ],
//                   );

//                   return showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return alert;
//                       });
//                 },
//               ),
//               Divider(),

//               ///Menu Mode with overriden icon and dropdown buttons
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: DropdownSearch<String>(
//                       validator: (v) => v == null ? "required field" : null,
//                       hint: "Select a country",
//                       mode: Mode.MENU,
//                       dropdownSearchDecoration: InputDecoration(
//                         filled: true,
//                         border: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFF01689A)),
//                         ),
//                       ),
//                       showAsSuffixIcons: true,
//                       clearButtonBuilder: (_) => Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: const Icon(
//                           Icons.clear,
//                           size: 24,
//                           color: Colors.black,
//                         ),
//                       ),
//                       dropdownButtonBuilder: (_) => Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: const Icon(
//                           Icons.arrow_drop_down,
//                           size: 24,
//                           color: Colors.black,
//                         ),
//                       ),
//                       showSelectedItem: true,
//                       items: [
//                         "Brazil",
//                         "Italia (Disabled)",
//                         "Tunisia",
//                         'Canada'
//                       ],
//                       label: "Menu mode *",
//                       showClearButton: true,
//                       onChanged: print,
//                       popupItemDisabled: (String s) => s.startsWith('I'),
//                       selectedItem: "Tunisia",
//                     ),
//                   ),
//                   Expanded(
//                       child: TextField(
//                     decoration: InputDecoration(
//                       filled: true,
//                       labelText: "Menu mode *",
//                       border: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Color(0xFF01689A)),
//                       ),
//                     ),
//                   ))
//                 ],
//               ),
//               Divider(),
//               DropdownSearch<UserModel>(
//                 searchBoxController: TextEditingController(text: 'Mrs'),
//                 mode: Mode.BOTTOM_SHEET,
//                 isFilteredOnline: true,
//                 showClearButton: true,
//                 showSearchBox: true,
//                 label: 'User *',
//                 dropdownSearchDecoration: InputDecoration(
//                   filled: true,
//                   fillColor: Theme.of(context).inputDecorationTheme.fillColor,
//                 ),
//                 autoValidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (UserModel u) =>
//                     u == null ? "user field is required " : null,
//                 onFind: (String filter) => getData(filter),
//                 onChanged: (UserModel data) {
//                   print(data);
//                 },
//                 dropdownBuilder: _customDropDownExample,
//                 popupItemBuilder: _customPopupItemBuilderExample,
//               ),
//               Divider(),

//               ///custom itemBuilder and dropDownBuilder
//               DropdownSearch<UserModel>(
//                 showSelectedItem: true,
//                 compareFn: (UserModel i, UserModel s) => i.isEqual(s),
//                 label: "Person",
//                 onFind: (String filter) => getData(filter),
//                 onChanged: (UserModel data) {
//                   print(data);
//                 },
//                 dropdownBuilder: _customDropDownExample,
//                 popupItemBuilder: _customPopupItemBuilderExample2,
//               ),
//               Divider(),

//               ///BottomSheet Mode with no searchBox
//               DropdownSearch<String>(
//                 mode: Mode.BOTTOM_SHEET,
//                 items: ["Brazil", "Italia", "Tunisia", 'Canada', 'Zraoua', 'France', 'Belgique'],
//                 label: "Custom BottomShet mode",
//                 onChanged: print,
//                 selectedItem: "Brazil",
//                 showSearchBox: true,
//                 searchBoxDecoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
//                   labelText: "Search a country",
//                 ),
//                 popupTitle: Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).primaryColorDark,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Country',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 popupShape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(24),
//                     topRight: Radius.circular(24),
//                   ),
//                 ),
//               ),
//               Divider(),

//               ///show favorites on top list
//               DropdownSearch<UserModel>(
//                 showSelectedItem: true,
//                 showSearchBox: true,
//                 compareFn: (UserModel i, UserModel s) => i.isEqual(s),
//                 label: "Person with favorite option",
//                 onFind: (String filter) => getData(filter),
//                 onChanged: (UserModel data) {
//                   print(data);
//                 },
//                 dropdownBuilder: _customDropDownExample,
//                 popupItemBuilder: _customPopupItemBuilderExample2,
//                 showFavoriteItems: true,
//                 favoriteItemsAlignment: MainAxisAlignment.start,
//                 favoriteItems: (items) {
//                   return items.where((e) => e.name.contains("Mrs")).toList();
//                 },
//                 favoriteItemBuilder: (context, item) {
//                   return Container(
//                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey[200]),
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.grey[100]),
//                     child: Text(
//                       "${item.name}",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.indigo),
//                     ),
//                   );
//                 },
//               ),
//               Divider(),

//               ///merge online and offline data in the same list and set custom max Height
//               DropdownSearch<UserModel>(
//                 items: [
//                   UserModel(name: "Offline name1", id: "999"),
//                   UserModel(name: "Offline name2", id: "0101")
//                 ],
//                 maxHeight: 300,
//                 onFind: (String filter) => getData(filter),
//                 label: "choose a user",
//                 onChanged: print,
//                 showSearchBox: true,
//               ),
//               Divider(),

//               ///open dropdown programmatically
//               DropdownSearch<String>(
//                 items: ["no action", "confirm in the next dropdown"],
//                 label: "open another dropdown programmatically",
//                 onChanged: (String v) {
//                   if (v == "confirm in the next dropdown") {
//                     _openDropDownProgKey.currentState.openDropDownSearch();
//                   }
//                 },
//               ),
//               Padding(padding: EdgeInsets.all(4)),
//               DropdownSearch<String>(
//                 key: _openDropDownProgKey,
//                 items: ["Yes", "No"],
//                 label: "confirm",
//                 showSelectedItem: true,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   RaisedButton(
//                       onPressed: () {
//                         _openDropDownProgKey.currentState.openDropDownSearch();
//                       },
//                       color: Theme.of(context).accentColor,
//                       child: Text("Open dropdownSearch")),
//                   RaisedButton(
//                       onPressed: () {
//                         _openDropDownProgKey.currentState
//                             .changeSelectedItem("No");
//                       },
//                       child: Text("set to 'NO'")),
//                   Material(
//                     child: RaisedButton(
//                         onPressed: () {
//                           _openDropDownProgKey.currentState
//                               .changeSelectedItem("Yes");
//                         },
//                         child: Text("set to 'YES'")),
//                   ),
//                   RaisedButton(
//                       onPressed: () {
//                         _openDropDownProgKey.currentState
//                             .changeSelectedItem("Blabla");
//                       },
//                       child: Text("set to 'Blabla'")),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _customDropDownExample(
//       BuildContext context, UserModel item, String itemDesignation) {
//     return Container(
//       child: (item?.avatar == null)
//           ? ListTile(
//               contentPadding: EdgeInsets.all(0),
//               leading: CircleAvatar(),
//               title: Text("No item selected"),
//             )
//           : ListTile(
//               contentPadding: EdgeInsets.all(0),
//               leading: CircleAvatar(
//                 backgroundImage: NetworkImage(item.avatar),
//               ),
//               title: Text(item.name),
//               subtitle: Text(
//                 item.createdAt.toString(),
//               ),
//             ),
//     );
//   }

//   Widget _customPopupItemBuilderExample(
//       BuildContext context, UserModel item, bool isSelected) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 8),
//       decoration: !isSelected
//           ? null
//           : BoxDecoration(
//               border: Border.all(color: Theme.of(context).primaryColor),
//               borderRadius: BorderRadius.circular(5),
//               color: Colors.white,
//             ),
//       child: ListTile(
//         selected: isSelected,
//         title: Text(item.name),
//         subtitle: Text(item.createdAt.toString()),
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage(item.avatar),
//         ),
//       ),
//     );
//   }

//   Widget _customPopupItemBuilderExample2(
//       BuildContext context, UserModel item, bool isSelected) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 8),
//       decoration: !isSelected
//           ? null
//           : BoxDecoration(
//               border: Border.all(color: Theme.of(context).primaryColor),
//               borderRadius: BorderRadius.circular(5),
//               color: Colors.white,
//             ),
//       child: ListTile(
//         selected: isSelected,
//         title: Text(item.name),
//         subtitle: Text(item.createdAt.toString()),
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage(item.avatar),
//         ),
//       ),
//     );
//   }

//   Future<List<UserModel>> getData(filter) async {
//     var response = await Dio().get(
//       "http://5d85ccfb1e61af001471bf60.mockapi.io/user",
//       queryParameters: {"filter": filter},
//     );

//     var models = UserModel.fromJsonList(response.data);
//     return models;
//   }
// }

// class UserModel {
//   final String id;
//   final DateTime? createdAt;
//   final String name;
//   final String? avatar;

//   UserModel(
//       {required this.id, this.createdAt, required this.name, this.avatar});

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json["id"],
//       createdAt:
//           json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//       name: json["name"],
//       avatar: json["avatar"],
//     );
//   }

//   static List<UserModel> fromJsonList(List list) {
//     return list.map((item) => UserModel.fromJson(item)).toList();
//   }

//   ///this method will prevent the override of toString
//   String userAsString() {
//     return '#${this.id} ${this.name}';
//   }

//   ///this method will prevent the override of toString
//   bool? userFilterByCreationDate(String filter) {
//     return this.createdAt?.toString().contains(filter);
//   }

//   ///custom comparing function to check if two users are equal
//   bool isEqual(UserModel? model) {
//     return this.id == model?.id;
//   }

//   @override
//   String toString() => name;
// }
