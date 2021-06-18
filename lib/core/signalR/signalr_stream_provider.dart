import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/io_client.dart';
import 'package:signalr_core/signalr_core.dart';

final messageProvider = StreamProvider.autoDispose<String>((ref) async* {
  // Open the connection
  final connection = HubConnectionBuilder()
      .withUrl(
          'http://2822fc2ea8f4.ngrok.io/chatHub',
          HttpConnectionOptions(
            client: IOClient(HttpClient()..badCertificateCallback = (x, y, z) => true),
            logging: (level, message) => print(message),
          ))
      .build();

  await connection.start();
  // connection.stream('ReceiveMessage', (message) {
  //   print(message.toString());
  // });

  connection.on('ReceiveMessage', (message) {
    print(message.toString());
  });

  await connection.invoke('SendMessage', args: ['Bob', 'Says hi!']);
});
