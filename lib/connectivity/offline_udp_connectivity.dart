import 'dart:io';

import 'package:udp/udp.dart';

///Created by Neeraj Vijayvargiya on 10/11/22.
class UdpConnectivity {
  late UDP conn;

  void start() async {
    conn = await UDP.bind(Endpoint.any(port: Port.any));
    sendData();
    conn.asStream().listen((event) {
      print("recv udp data:" + String.fromCharCodes(event!.data));
    });
  }

  void sendData() async {
    var datalength = await conn.send(
        [0XC2, 0X64],
        Endpoint.multicast(
            InternetAddress("192.168.4.1", type: InternetAddressType.IPv4),
            port: Port(8888)));
    print("Data send size" + datalength.toString());
  }
}
