import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  var _userId = TextEditingController();
  var _userName = TextEditingController();
  var _userPhone = TextEditingController();
  var change;
  GlobalKey _globalKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _userId.text = "123456";
    _userName.text = "123456";
    _userPhone.text = "12345678900";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 255, 200, 0),
          title: Text("个人页面"),
        ),
        body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
               ),
                Stack(
                  alignment: Alignment(0.8, 0),
                  children: [
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text('ID'),
                      ),
                    ),
                    Text("${_userId.text}",
                        style: TextStyle(fontSize: 16, color: Colors.grey))
              ],
            ),
            Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            Stack(
              alignment: Alignment(0.7, 0),
              children: [
                Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text('昵称'),
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
                                  title: Text("修改昵称"),
                                  content: Theme(
                                      data: Theme.of(context).copyWith(
                                          primaryColor:
                                              Color.fromARGB(255, 255, 200, 0)),
                                      child: TextFormField(
                                        //controller: _userName,
                                        decoration: InputDecoration(
                                          labelText: "昵称",
                                          hintText: "输入你的昵称",
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            change = value;
                                          });
                                        },
                                        validator: (v) {
                                          return v.trim().length > 0
                                              ? null
                                              : "昵称不能为空";
                                        },
                                      )),
                                  actions: <Widget>[
                                    FlatButton(
                                        child: Text("取消",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 200, 0))),
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        }),
                                    FlatButton(
                                      child: Text("确认",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 200, 0))),
                                      onPressed: () {
                                        if ((_globalKey.currentState
                                                as FormState)
                                            .validate()) {
                                          setState(() {
                                            _userName.text = change;
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
                Text("${_userName.text}",
                    style: TextStyle(fontSize: 16, color: Colors.grey))
              ],
            ),
            Container(
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            Stack(
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
                                  title: Text("修改手机号"),
                                  content: Theme(
                                      data: Theme.of(context).copyWith(
                                          primaryColor:
                                              Color.fromARGB(255, 255, 200, 0)),
                                      child: TextFormField(
                                        // controller: _userPhone,
                                        decoration: InputDecoration(
                                          labelText: "手机号",
                                          hintText: "输入你的手机号",
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            change = value;
                                          });
                                        },
                                        validator: (v) {
                                          if (v.trim().length != 0) {
                                            return v.trim().length == 11
                                                ? null
                                                : "手机号不符合规定";
                                          }
                                          return "手机号不能为空";
                                        },
                                      )),
                                  actions: <Widget>[
                                    FlatButton(
                                        child: Text("取消",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 200, 0))),
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        }),
                                    FlatButton(
                                        child: Text("确认",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 200, 0))),
                                        onPressed: () {
                                          if ((_globalKey.currentState
                                                  as FormState)
                                              .validate()) {
                                            setState(() {
                                              _userPhone.text = change;
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
                Text("${_userPhone.text}",
                    style: TextStyle(fontSize: 16, color: Colors.grey))
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                child: Text('修改密码'),
                textColor: Colors.black,
                color: Colors.white,
                elevation: 10,
                onPressed: () {
                  Navigator.pushNamed(context, "/modify");
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                  child: Text('退出登录'),
                  textColor: Colors.red,
                  color: Colors.white,
                  elevation: 10,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("提示"),
                          content: Text("退出后不会删除任何数据，下次登录依然可以使用本账号"),
                          actions: <Widget>[
                            FlatButton(
                                child: Text("取消",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 200, 0))),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                }),
                            FlatButton(
                              child: Text("退出登录",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 200, 0))),
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    "/login",
                                    ModalRoute.withName("/login")); //返回登录页面
                              },
                            )
                          ],
                        );
                      },
                    );
                  }),
            )
          ],
        )));
  }
}
