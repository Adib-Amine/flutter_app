import 'package:flutter/material.dart';
import 'package:git_app/pages/qrcode_create.page.dart';
import 'package:git_app/pages/qrcode_scan.page.dart';
import 'package:git_app/widgets/drawer.widget.dart';

class QRPage extends StatefulWidget {
  @override
  _QRState createState() => _QRState();
}
class _QRState extends State<QRPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: MyDrawerWidget(),
      appBar: AppBar(
        title:Text("QR Code"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: Icon(
                Icons.create,
                color: Colors.white,
                size: 28.0,
              ),
              label: Text('QR Create',style: TextStyle(fontSize: 22,color: Colors.white),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.red)
                    ),
                ),
              ),
              onPressed:  () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => QRCreatePage(),
              ),
            )
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: Icon(
                Icons.scanner,
                color: Colors.white,
                size: 28.0,
              ),
              label: Text('QR Scan   ',style: TextStyle(fontSize: 22,color: Colors.white),),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: Colors.red)
                      )
                  ),
              ),
              onPressed:  () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => QRScanPage(),
                ),
              )
            )
          ],
        ),
      ),
    );
  }

}