import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Show extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'home page',
      color: Colors.grey[300],
      // 创建登陆界面对象
      home: ImagePickerWidget(),
    );
  }
}
class ImagePickerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<ImagePickerWidget> {
  var _imgPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ImagePicker"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('头像'),
                trailing:  Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage('images/head.jpg'),fit: BoxFit.fill)
                  ),
                  child:  FlatButton(
                    onPressed: _openGallery,
                    //child: Text("选择照片"),
                  ),
                ),

                onTap: () {
                },
              ),
              _ImageView(_imgPath),
              RaisedButton(
                onPressed: _takePhoto,
                child: Text("拍照"),
              ),
              RaisedButton(
                onPressed: _openGallery,
                child: Text("选择照片"),
              ),
            ],
          ),
        ));
  }

  /*图片控件*/
  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Text("请选择图片或拍照"),
      );
    } else {
      return Image.file(
        imgPath,
      );
    }
  }


  /*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _imgPath = image;
    });
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }
}


