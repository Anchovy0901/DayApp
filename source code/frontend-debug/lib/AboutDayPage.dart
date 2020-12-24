import 'package:flutter/material.dart';
import 'package:test_app/home.dart';
import 'Test.dart';
class AboutDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AboutDay',
      // 创建登陆界面对象
      color: Colors.grey[300],
      home: AboutDayPage(),
    );
  }
}

class AboutDayPage extends StatefulWidget {
  @override
  AboutDayPageState createState() => AboutDayPageState();
}

class AboutDayPageState extends State<AboutDayPage> {
  var _imgPath;
  Widget build(BuildContext context) {
    // logo 图片区域
    Widget logoImageArea = new Container(
      alignment: Alignment.topCenter,
      // 设置图片为圆形

      child: Image.asset(
        "images/login.jpg",
        height: 125,
        width: 125,
        fit: BoxFit.cover,
      ),
    );
  // 返回
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




    return Scaffold(
//        appBar: new AppBar(
//            title: new Text("关于 Day",
//            style: TextStyle(
//            color: Colors.blue[400],
//            fontSize: 24.0,
//          ),),
//          elevation: 0,
//          backgroundColor:Colors.white,
//          centerTitle: true,
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
                logoImageArea,
                //wordSayArea,
                new Text ('Day の 小小日记',textAlign: TextAlign.center,
                  style: TextStyle(
                  height: 4.0,
                  color: Colors.blue[400],
                  fontSize: 20.0,
                ),),
                new Text ('\n作者：Anchovy\n版本信息：v1.0\n发布时间：2020-12-14\n',textAlign: TextAlign.center,
                  style: TextStyle(
                    //height: 4.0,
                    color: Colors.blueGrey,
                    fontSize: 17.0,
                  ),),
                new Text( '有关该应用的功能信息方面，有待后续完善.\n希望大家可以持续关注，并提出您宝贵的意见与建议！',textAlign: TextAlign.center,
                  style: TextStyle(
                    //height: 4.0,
                    color: Colors.black,
                    fontSize: 14.0,
                  ),),

              ],
          ),
        ),
      );
  }

}