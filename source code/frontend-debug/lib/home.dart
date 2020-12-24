import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/LoginPage.dart';
import 'package:test_app/utils/Constant.dart';
import 'package:test_app/utils/LocalStore.dart';
import 'package:test_app/utils/Toast.dart';
import 'package:test_app/AboutDayPage.dart';
import 'package:test_app/ChangePage.dart';
import 'package:test_app/UploadInfoPage.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'home page',
      color: Colors.grey[300],
      // 创建登陆界面对象
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var userName = TextEditingController();
  var userSay = TextEditingController();
  @override
  void initState() {
    super.initState();
    userName.text = "Anchovy";
    userSay.text = "Show me something.";
  }

  @override
  Widget build(BuildContext context) {
    getStorage('expired').then((value) {
      if (int.parse(value.toString()) <
          new DateTime.now().millisecondsSinceEpoch) {
        myToast("身份已过期，请重新登录");
        Navigator.pushAndRemoveUntil(
            context,
            new MaterialPageRoute(builder: (context) => new Login()),
            (route) => false);
      }
    });


   // 退出登录
    Widget reLoginButtonArea = new Container(
      margin: EdgeInsets.only(left: 60, right: 60),
      height: 45.0,
      child: new RaisedButton(
        color: Colors.blue[300],
        child: Text(
          "退出登录",
          style: TextStyle(
              fontSize: 17.0,
              color: Color.fromARGB(255, 255, 255, 255)
          ),
        ),
        // 设置按钮圆角
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(45.0)),
        onPressed: () {
          setStorage('user_id', null);
          setStorage('token', null);
          showDialog(
            context: context,
            barrierDismissible: true, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("提示",
                style: TextStyle(
                  color: Colors.blue,
                )),
                content: Text('退出后不会删除任何数据\n下次登录依然可以使用本账号',
                  style: TextStyle(
                  //height: 4.0,
                  //color: Colors.blue[400],
                  fontSize: 14.0,)
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('取消'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },

                  ),
                  FlatButton(
                    child: Text('退出'),
                    onPressed: () {
//                      UserUtil.loginout();
//                      Navigator.of(context).pop();
//                      Routes.navigateTo(
//                          context, '${Routes.loginPage}',
//                          clearStack: true,
//                          transition: TransitionType.fadeIn);
                      Navigator.pushAndRemoveUntil(context,
                          new MaterialPageRoute(builder: (context) {
                            return Login();
                          }), (route) => false);
                    },
                  ),
                ],
                backgroundColor: Colors.white,
                elevation: 20,
                // 设置成 圆角
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              );
            },
          );

        },
      ),
    );

    //顶部用户信息按钮区域
//    Widget userImageButtonArea  = new Container(
//        padding: EdgeInsets.all(16),
//        color: Colors.blue[50],
//        child:Row(
//          children:
//          <Widget>[
//            CircleAvatar(backgroundImage: AssetImage("images/head.jpg",),),
//            SizedBox(width:25),
//            Expanded(child: ListTile(
//              title: Text("Anchovy"),
//              subtitle: Text("Show me sth"),
//            )),
//            Icon(Icons.keyboard_arrow_right,),
//          ],
//        ),
//    );
    //关于App按钮区域
    Widget userImageButtonArea  = new Container(
      padding: EdgeInsets.all(16),
      color: Colors.blue[50],
      child:ListTile(
        leading: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage('images/head.jpg'),fit: BoxFit.fill)),
        ),
        title: Text('${userName.text}'),
        //subtitle: Text('${userSay.text}'),
        trailing: Icon(Icons.sort),
        onTap: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return UpdateInfo();
          })
          );
        }
      )
    );
    Widget aboutDayButtonArea = new Container(
      color:Colors.white,
      child:ListTile(
        leading: Icon(Icons.info_outline),
        title: Text("关于Day"),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return AboutDay();
          })
          );
        }),
      );

    //修改密码按钮区域
    Widget resetUserSecertButtonArea = new Container(
      color:Colors.white,
      child:ListTile(
        leading: Icon(Icons.security_rounded),
        title: Text("修改密码"),
        trailing: Icon(Icons.keyboard_arrow_right),
        // 一行都可以跳转
        onTap: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return Change();
          }));
        }),
    );


    //修改系统设置
    Widget setSystemSecertButtonArea = new Container(
      color:Colors.white,
      child:ListTile(
          leading: Icon(Icons.speaker_notes_outlined),
          title: Text("意见反馈"),
          trailing: Text("31801341@stu.zucc.edu.cn",
            style: TextStyle(
            height: 1.6,
            color: Colors.blue[400],
            fontSize: 16.0,
          ),),
          // 一行都可以跳转
          ),
    );


    // 修改个人信息按钮区域
    Widget updateInfoButtonArea = new Container(
      color:Colors.white,
      child:ListTile(
          leading: Icon(Icons.person_outline_outlined),
          title: Text("个人信息"),
          trailing: Icon(Icons.keyboard_arrow_right),
          // 一行都可以跳转
          onTap: () {
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return UpdateInfo();
            }));
          }),
    );

    return Scaffold(
      appBar: AppBar(
//        title: new Text("主页"),
//        leading: Icon(Icons.backpack),
        elevation: 0,
        backgroundColor: Colors.white,
//        centerTitle: true,
      ),
      body: new GestureDetector(
        onTap: () {
          // 点击空白区域，回收键盘
          print("点击了空白区域");
        },
        child: new ListView(
          children: <Widget>[
            userImageButtonArea,
            new SizedBox(height: 10.0),
            updateInfoButtonArea,
            Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            resetUserSecertButtonArea,
            Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            aboutDayButtonArea,
            Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            setSystemSecertButtonArea,
            new SizedBox(height: 70.0),
            reLoginButtonArea,
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[300],
        shape: CircularNotchedRectangle(),
        elevation: 8.0,
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.format_list_bulleted_sharp),
            ),
            IconButton(
              icon: Icon(Icons.person,color:Colors.blue),
               onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) {
                    return Home();
                  }));
                }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );

  }

}
