import 'package:flutter/material.dart';
import 'package:test_app/LoginPage.dart';
import 'package:test_app/utils/Toast.dart';
import 'utils/SendRequest.dart';

class Forget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'forg page',
      // 创建登陆界面对象
      color: Colors.grey[300],
      home: ForgPage(),
    );
  }
}

class ForgPage extends StatefulWidget {
  @override
  ForgPageState createState() => ForgPageState();
}

class ForgPageState extends State<ForgPage> {
  // 表单变量
  var userName = '';
  var userPhone = '';
  var password = '';
  var password1 = '';


  var isShowPwd = false; //是否显示密码
  var isShowPwd1 = false; //是否显示密码
  var isShowClear = false; //是否显示输入框尾部的清除按钮
  var isShowPhoneClear = false; //是否显示手机号输入框尾部的清除按钮

  //焦点
  FocusNode focusNodeUserName = new FocusNode();
  FocusNode focusNodeUserPhone = new FocusNode();
  FocusNode focusNodePassword = new FocusNode();
  FocusNode focusNodePassword1 = new FocusNode();

  //表单状态
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController userNameController = new TextEditingController();
  TextEditingController userPhoneController = new TextEditingController();

  @override
  void initState() {
    //设置焦点监听
    focusNodeUserName.addListener(focusNodeListener);
    focusNodeUserPhone.addListener(focusNodeListener);
    focusNodePassword.addListener(focusNodeListener);
    focusNodePassword1.addListener(focusNodeListener);

    //监听用户名框的输入改变
    userPhoneController.addListener(() {
      print(userPhoneController.text);

      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if (userPhoneController.text.length > 0) {
        isShowClear = true;
      } else {
        isShowClear = false;
      }
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    // 移除焦点监听
    focusNodeUserPhone.removeListener(focusNodeListener);
    focusNodePassword.removeListener(focusNodeListener);
    focusNodePassword1.removeListener(focusNodeListener);
    userPhoneController.dispose();
    super.dispose();
  }

  // 监听焦点具体执行方法
  Future<Null> focusNodeListener() async {
    if (focusNodeUserPhone.hasFocus) {
      print("用户名框获取焦点");
      // 取消其他框焦点状态
      focusNodePassword.unfocus();
      focusNodePassword1.unfocus();
    } else if (focusNodePassword.hasFocus) {
      print("密码框获取焦点");
      // 取消其他框焦点状态
      focusNodeUserPhone.unfocus();
      focusNodePassword1.unfocus();
    } else if (focusNodePassword1.hasFocus) {
      print("确认密码框获取焦点");
      // 取消其他框焦点状态
      focusNodeUserPhone.unfocus();
      focusNodePassword.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    // logo 图片区域
    Widget logoImageArea = new Container(
      alignment: Alignment.topCenter,
      child: Image.asset(
        "images/login.jpg",
        height: 135,
        width: 135,
        fit: BoxFit.cover,
      ),
    );

    //输入文本框区域
    Widget inputTextArea = new Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white),
      child: new Form(
        key: formKey,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // 用户名
            new TextFormField(
              controller: userNameController,
              focusNode: focusNodeUserName,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名",
                prefixIcon: Icon(Icons.person),
                //尾部添加清除按钮
                suffixIcon: (isShowClear)
                    ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    // 清空输入框内容
                    userNameController.clear();
                  },
                )
                    : null,
              ),
              //验证用户名
              validator: validateUserName,
              //保存数据
              onSaved: (String value) {
                userName = value;
              },
            ),
            new TextFormField(
              controller: userPhoneController,
              focusNode: focusNodeUserPhone,
              decoration: InputDecoration(
                labelText: "手机号",
                hintText: "请输入手机号",
                prefixIcon: Icon(Icons.phone_android),
                //尾部添加清除按钮
                suffixIcon: (isShowPhoneClear)
                    ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    // 清空输入框内容
                    userPhoneController.clear();
                  },
                )
                    : null,
              ),
              //验证手机号
              validator: validatePhone,
              //保存数据
              onSaved: (String value) {
                userPhone = value;
              },
            ),
            // 会员码


          ],
        ),
      ),
    );

    // 注册按钮区域
    Widget regButtonArea = new Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 45.0,
      child: new RaisedButton(
        color: Colors.blue[300],
        child: Text(
          "确定重置",
          style: TextStyle(
              fontSize: 17.0,
              color: Color.fromARGB(255, 255, 255, 255)
          ),
        ),
        // 设置按钮圆角
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(45.0)),
        onPressed: () {
          //点击登录按钮，解除焦点，回收键盘
          focusNodePassword.unfocus();
          focusNodeUserPhone.unfocus();
          focusNodePassword1.unfocus();

          if (formKey.currentState.validate()) {
            //只有输入通过验证，才会执行这里
            formKey.currentState.save();
            Map<String, dynamic> data = {
              'user_name': userPhone,
              'password': password,
            };
            // 注册请求
            request('/api/v1/user/reg', 'POST', null, null, data, context).then((res) {
              // 返回上一层
              if (res != null) {
                myToast("注册成功");
                Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new Login()));
              }
            }).whenComplete(() {
              print("登录请求处理完成");
            }).catchError(() {
              myToast("出现异常,请重试");
            });
          }
        },
      ),
    );
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
            //忘记密码按钮，点击执行事件
            onPressed: () {
              //跳转到新的 页面我们需要调用 navigator.push方法
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => new Login()));
            },
          )

        ],
      ),
    );
    // 返回
    return Scaffold(
//      appBar: new AppBar(
//        title: new Text("注册界面"),
//        leading: Icon(Icons.verified_user),
//        backgroundColor: getMainColor(),
//        centerTitle: true,
//      ),
      // 外层添加一个手势，用于点击空白部分，回收键盘
      body: new GestureDetector(
        onTap: () {
          // 点击空白区域，回收键盘
          print("点击了空白区域");
          focusNodePassword.unfocus();
          focusNodeUserPhone.unfocus();
          focusNodePassword1.unfocus();
        },
        child: new ListView(
          children: <Widget>[
            new SizedBox(height: 10.0),
            returnArea,
            new SizedBox(height: 20.0),
            logoImageArea,
            new SizedBox(height: 20.0),
            inputTextArea,
            new SizedBox(height: 30.0),
            regButtonArea,
            new SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }

  /**
   * 验证手机号
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
  /**
   * 验证用户名
   */
  String validateUserName(value) {
    if (value.isEmpty) {
      return "用户名不能为空";
    } else if (value.trim().length < 4 && value.trim().length > 18) {
      return "用户名长度不正确";
    }
    return null;
  }
  /**
   * 验证第一次出入的密码是否规范
   */
  String validatePassWord(String value) {
    if (value.isEmpty) {
      return '密码不能为空';
    } else if (value.trim().length < 6 || value.trim().length > 18) {
      return '密码长度不正确';
    }
    return null;
  }

  /**
   * 验证第二次输入的密码是否和前面一样
   */
  String validatePassWordCheck(String value) {
    print("当前密码：" + value + "; " + "第一次：" + password);
    if (value != password) {
      return "两次输入的密码不一致";
    }
    return null;
  }


}
