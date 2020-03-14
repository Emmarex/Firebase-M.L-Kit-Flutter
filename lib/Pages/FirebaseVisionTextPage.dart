import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mlkit/mlkit.dart';
import 'package:toast/toast.dart';

class FirebaseVisionTextPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FirebaseVisionTextPageState();
}

class _FirebaseVisionTextPageState extends State<FirebaseVisionTextPage>{

  File selectedImageFile;
  List<VisionText> _currentLabels = <VisionText>[];
  FirebaseVisionTextDetector detector = FirebaseVisionTextDetector.instance;

  @override
  void initState() { 
    super.initState();
  }

  _pickPicture() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        selectedImageFile = image;
      });
      predict(selectedImageFile);
    }
  }

  predict(File _image) async{
    try{
      var labels = await detector.detectFromPath(_image?.path);
      setState(() {
        _currentLabels = labels;
      });
      showPredictionResult();
    } catch (e){
      Toast.show(
        "$e",
        context,
        duration: Toast.LENGTH_SHORT,
        gravity:  Toast.BOTTOM
      );
    }
  }

  Future<void> showPredictionResult() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Predictions"),
          content: Text(_currentLabels.first.text),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Vision Text'),
      ),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: (selectedImageFile != null)
                ? Image.file(
                    selectedImageFile,
                    fit: BoxFit.cover,
                  )
                : SizedBox()
              ),
              Positioned(
                left: 50,
                right: 50,
                bottom: 20.0,
                child: RaisedButton(
                  onPressed: _pickPicture,
                  child: Icon(
                    Icons.image,
                    color: Colors.white,
                    size: 30,
                  ),
                  padding: const EdgeInsets.all(20),
                  color: Colors.red,
                  shape: CircleBorder()
                ),
              )
            ],
          ),
        )
      ),
    );
  }

}