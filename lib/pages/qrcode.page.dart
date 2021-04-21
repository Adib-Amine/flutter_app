import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:git_app/widgets/drawer.widget.dart';

class QrScanPage extends StatefulWidget {
  @override
  _QrScanPageState createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawerWidget(),
      appBar: AppBar(
        title: Text("QR Code"),
      ),
      body: Center(
        child: Text(result != null ? result : 'Scan QR',
            style: TextStyle(fontSize: 18)),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.scanner), onPressed: scanQR, label: Text("QR Scan")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future scanQR() async {
    try {
      String scanResult = (await BarcodeScanner.scan()) as String;
      setState(() {
        result = scanResult;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error";
        });
      }
    } on FormatException {
      result = "You pressed the back button before scanning";
    } catch (e) {
      setState(() {
        result = "Somme error occured while scanning";
      });
    }
  }
}
