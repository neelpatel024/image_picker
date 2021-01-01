import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Camera(),
    );
  }
}

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File _image;
  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker By Codegenix"),
      ),
      body: Center(
          child: _image == null
              ? Text("Please Upload The Image")
              : Image.file(_image)),
      floatingActionButton: FloatingActionButton(
        tooltip: "Increment",
        onPressed: getImage,
        child: Icon(Icons.camera_enhance),
      ),
    );
  }
}
