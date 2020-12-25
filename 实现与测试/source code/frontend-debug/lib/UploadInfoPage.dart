
import 'package:flutter/material.dart';
import 'package:test_app/utils/Constant.dart';
import 'package:test_app/utils/SendRequest.dart';
import 'package:test_app/utils/Toast.dart';
import 'package:test_app/home.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UpdateInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'update info page',
      color: Colors.grey[300],
      // 创建登陆界面对象
      home: UpdateInfoPage(),
    );
  }
}

class UpdateInfoPage extends StatefulWidget {
  @override
  UpdateInfoPageState createState() => new UpdateInfoPageState();
}

class UpdateInfoPageState extends State<UpdateInfoPage> {
  var userName = TextEditingController();
  var userPhone = TextEditingController();
  File userImg = File('images/head.jpg');
  var change;
  GlobalKey _globalKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    userName.text = "Anchovy";
    userPhone.text = "13588631227";
    userImg;
  }
  /// 从相册选择的图片文件。
  File _image;

//  /// 打开系统相册并选择一张照片。
//  Future getImage() async {
//    // Flutter团队开发的图片选择器（`image_picker`）插件。z
//    // 适用于iOS和Android的Flutter插件，用于从图像库中拾取图像，并使用相机拍摄新照片。
//    // https://pub.dartlang.org/packages/image_picker
//    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//
//    setState(() {
//      // 更新用作头像的照片。
//      _image = image;
//    });
//  }
  /*相册*/
  Future _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      userImg = image;
      print(userImg);
    });
  }
  @override
  Widget build(BuildContext context) {
    //返回区域
    Widget returnArea = new Container(
      margin: EdgeInsets.only(right: 20, left: 0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            child: Text(
              "<  返回",
              style: TextStyle(
                color: Colors.blue[400],
                fontSize: 16.0,
              ),
            ),
            onPressed: () {
              //跳转到新的 页面我们需要调用 navigator.push方法
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => new Home()));
            },
          )
        ],
      ),
    );
    //用户名区域
    Widget userNameArea = new Stack(
      alignment: Alignment(0.7, 0),
      children: [
        Container(
          color: Colors.white,
          child: ListTile(
            title: Text('用户名'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Form(
                        key: _globalKey,
                        // ignore: deprecated_member_use
                        autovalidate: true,
                        child: AlertDialog(
                          title: Text("修改用户名",
                            style: TextStyle(
                              //height: 1.6,
                              color: Colors.blue,
                              //fontSize: 16.0,
                            ),),
                          content: Theme(
                              data: Theme.of(context).copyWith(
                                  primaryColor:
                                  Colors.blue),
                              child: TextFormField(
                                //controller: _userName,
                                decoration: InputDecoration(
                                  labelText: "用户名",
                                  hintText: "输入新的用户名",
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    change = value;
                                  });
                                },
                                validator:validateUserName
                              )),
                          actions: <Widget>[
                            FlatButton(
                                child: Text("取消",
                                    style: TextStyle(
                                        color:  Colors.blue)),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                }),
                            FlatButton(
                              child: Text("确认",
                                  style: TextStyle(
                                      color:  Colors.blue)),
                              onPressed: () {
                                if ((_globalKey.currentState
                                as FormState)
                                    .validate()) {
                                  setState(() {
                                    userName.text = change;
                                  });
                                  Navigator.of(context).pop(true);
                                }
                                //返回登录页面
                              },
                            ),
                          ],
                        ));
                  });
            },
          ),
        ),
        Text("${userName.text}",
            style: TextStyle(fontSize: 16, color: Colors.grey))
      ],
    );
    //修改手机号
    Widget userPhoneArea = new Stack(
      alignment: Alignment(0.7, 0),
      children: [
        Container(
          color: Colors.white,
          child: ListTile(
            title: Text('手机号'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Form(
                        key: _globalKey,
                        // ignore: deprecated_member_use
                        autovalidate: true,
                        child: AlertDialog(
                          title: Text("修改手机号",
                            style: TextStyle(
                              //height: 1.6,
                              color: Colors.blue,
                              //fontSize: 16.0,
                            ),),
                          content: Theme(
                              data: Theme.of(context).copyWith(
                                  primaryColor:
                                  Colors.blue),
                              child: TextFormField(
                                // controller: _userPhone,
                                decoration: InputDecoration(
                                  labelText: "手机号",
                                  hintText: "输入新的手机号",
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    change = value;
                                  });
                                },
                                validator: validatePhone
                              )),
                          actions: <Widget>[
                            FlatButton(
                                child: Text("取消",
                                    style: TextStyle(
                                        color:  Colors.blue)),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                }),
                            FlatButton(
                                child: Text("确认",
                                    style: TextStyle(
                                        color:  Colors.blue)),
                                onPressed: () {
                                  if ((_globalKey.currentState
                                  as FormState)
                                      .validate()) {
                                    setState(() {
                                      userPhone.text = change;
                                    });
                                    Navigator.of(context).pop(true);
                                  }
                                }),
                          ],
                        ));
                  });
            },
          ),
        ),
        Text("${userPhone.text}",
            style: TextStyle(fontSize: 16, color: Colors.grey))
      ],
    );
    //修改头像
    Widget userImgArea = new Stack(
      alignment: Alignment(0.7, 0),
      children: [
        Container(
          color: Colors.white,
          child: ListTile(
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

                _openGallery;

            },
          ),
        ),
      ],
    );
    return Scaffold(
//        appBar: AppBar(
//
//          title: Text("个人页面"),
//        ),
        body: new GestureDetector(
        onTap: () {
      // 点击空白区域，回收键盘
            print("点击了空白区域");
          },
          child: new ListView(
            children: <Widget>[
              new SizedBox(height: 10.0),
              returnArea,
              new SizedBox(height: 20.0),
              userImgArea,
              Container(
                height: 0.5,
                width: double.infinity,
                color: Colors.grey,
              ),
              userNameArea,
              Container(
                height: 0.5,
                width: double.infinity,
                color: Colors.grey,
              ),
              userPhoneArea
            ]
           ),
        )
    );
  }
}

/**
 * 验证用户名
 */
String validateUserName(value) {
  if (value.isEmpty) {
    return "用户名不能为空";
  } else if (value.trim().length < 4 || value.trim().length > 18) {
    return "用户名长度不正确";
  }
  return null;
}

/**
 * 验证手机号是否规范
 */
String validatePhone(String value) {
  //正则匹配手机号
  RegExp exp = RegExp(
      r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
  if (value.isEmpty) {
    return '手机号不能为空!';
  } else if (!exp.hasMatch(value)) {
    return '请输入正确手机号';
  }
  return null;
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
