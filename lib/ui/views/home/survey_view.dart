import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:signalr_flutter/signalr_flutter.dart';

import 'dart:io';

import 'package:http/io_client.dart';
import 'package:signalr_core/signalr_core.dart';

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  String _signalRStatus = 'Unknown';
  //late SignalR signalR;
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    final connection = HubConnectionBuilder()
        .withUrl(
            'http://8fc8f2c797d0.ngrok.io/chatHub',
            HttpConnectionOptions(
              client: IOClient(HttpClient()..badCertificateCallback = (x, y, z) => true),
              logging: (level, message) => print(message),
            ))
        .build();

    await connection.start();

    connection.on('ReceiveMessage', (message) {
      print(message.toString());
    });

    await connection.invoke('AddToProductCommentGroup', args: ['Bob']);
    // await connection.invoke('SendMessage', args: ['Bob', 'Says hi!']);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SignalR Plugin Example App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Connection Status: $_signalRStatus\n', style: Theme.of(context).textTheme.headline5),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                // child: ElevatedButton(onPressed: _buttonTapped, child: Text('Invoke Method')),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.cast_connected),
          onPressed: () async {
            // final isConnected = await signalR.isConnected ?? false;
            // if (!isConnected) {
            //   await signalR.connect();
            // } else {
            //   signalR.stop();
            // }
          },
        ),
      ),
    );
  }

  // ignore: always_declare_return_types
  // _onStatusChange(dynamic status) {
  //   if (mounted) {
  //     setState(() {
  //       _signalRStatus = status as String;
  //     });
  //   }
  // }

  // ignore: always_declare_return_types
  // _onNewMessage(String? methodName, dynamic message) {
  //   print('MethodName = $methodName, Message = $message');
  // }

  // // ignore: always_declare_return_types
  // _buttonTapped() async {
  //   final res = await signalR.invokeMethod<dynamic>('/chatHub', arguments: ['user', 'message']).catchError((error) {
  //     print(error.toString());
  //   });
  //   final snackBar = SnackBar(content: Text('SignalR Method Response: $res'));
  //   rootScaffoldMessengerKey.currentState!.showSnackBar(snackBar);
  // }
}
