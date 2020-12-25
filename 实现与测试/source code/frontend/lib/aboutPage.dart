import 'package:flutter/material.dart';
import 'package:frontend/components/returnButton.dart';


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

  Widget build(BuildContext context) {
    // logo 图片区域
    Widget logoImageArea = new Container(
      alignment: Alignment.topCenter,
      // 设置图片为圆形

      child: Image.asset(
        "assets/images/logo.jpg",
        height: 125,
        width: 125,
        fit: BoxFit.cover,
      ),
    );




    return Scaffold(
      appBar: AppBar(title:Text("关于我们"),centerTitle: true,leading: ReturnButton(),),
      body: new GestureDetector(
        onTap: () {
          // 点击空白区域，回收键盘
          print("点击了空白区域");
        },

        child: new ListView(
          children: <Widget>[
            new SizedBox(height: 10.0),
            new SizedBox(height: 20.0),
            logoImageArea,
            //wordSayArea,
            new Text ('Days の 小小日记',textAlign: TextAlign.center,
              style: TextStyle(
                height: 4.0,
                color: Colors.blue[400],
                fontSize: 20.0,
              ),),
            new Text ('\n作者：二C、Anchovy\n版本信息：v1.0\n发布时间：2020-12-20\n',textAlign: TextAlign.center,
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
            new Text( '邮箱：31801341@stu.zucc.edu.cn',textAlign: TextAlign.center,
              style: TextStyle(
                //height: 4.0,
                color: Colors.blueAccent,
                fontSize: 14.0,
              ),),
          ],
        ),
      ),
    );
  }

}