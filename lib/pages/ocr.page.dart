import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:git_app/pages/text_recognition.page.dart';
import 'package:git_app/widgets/drawer.widget.dart';
import "package:image_cropper/image_cropper.dart";
import 'package:image_picker/image_picker.dart';

class OCRPage extends StatefulWidget {
  @override
  _OCRState createState() => _OCRState();
}
class _OCRState extends State<OCRPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: MyDrawerWidget(),
      appBar: AppBar(
        title:Text("OCR"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SizedBox(height: 25),
            TextRecognitionWidget(),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

}