//import 'dart:convert';

//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/returnButton.dart';
import 'package:frontend/global/host.dart';
import 'package:frontend/models/personInfo.dart';
import 'package:dio/dio.dart';
import 'package:frontend/models/httpRes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/components/customizedToast.dart';
import 'package:frontend/components/percentBar.dart';
import 'package:frontend/components/returnButton.dart';
import 'package:frontend/global/host.dart';
import 'package:frontend/global/iconTheme.dart';
import 'package:frontend/global/info.dart';
import 'package:frontend/models/clockRecord.dart';
import 'package:frontend/models/httpRes.dart';
import 'package:frontend/utils/utils.dart';
import 'dart:convert';

// ignore: must_be_immutable
class SetPersonInfoPage extends StatefulWidget
{
  PersonInfo myInfo;
  SetPersonInfoPage({this.myInfo});

  @override
  _SetPersonInfoPage createState() => _SetPersonInfoPage(myInfo: myInfo);
}



class _SetPersonInfoPage extends State<SetPersonInfoPage>
{
  FToast _fToast;
  PersonInfo myInfo;
  _SetPersonInfoPage({this.myInfo});
  @override
  void initState(){
    super.initState();
    _fToast = FToast();
    _fToast.init(context);

    //fetch();
  }
  @override
  Widget build(BuildContext context)
  {
    var change;
    return Scaffold(
      appBar: AppBar(
        leading: ReturnButton(),
        title: Text("修改个人信息"),centerTitle: true,
      ),
      body:
       ListView(
         padding: EdgeInsets.all(20.0),
         children: [
           ListTile(leading: Text("头像"), title: 
            ClipOval(child: Image.network(myHost+"/user/profile?path="+myInfo.profile, height: 50.0, width: 50.0)), trailing: Icon(Icons.chevron_right),
             onTap:(){
               print("修改头像");
             }
           ),

           Divider(),
           
           ListTile(leading: Text("昵称"), title: Text(myInfo.nickname, style: TextStyle(color:Colors.grey,fontSize:16.0),),
             trailing: Icon(Icons.chevron_right),
             onTap: ()async{
               showDialog(
                   context: context,
                   builder: (BuildContext context){
                     return AlertDialog(
                       title: Text("修改昵称",
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
                                 labelText: "昵称",
                                 hintText: "输入新的昵称",
                               ),
                               onChanged: (value) {
                                 setState(() {
                                   change = value;
                                 });
                               },
                               //validator:validateUserName
                           )),
                       actions: [
                         FlatButton(child:Text("取消",style:TextStyle(color: Colors.grey)),onPressed: (){Navigator.pop(context);},),
                         FlatButton(child:Text("确定",style:TextStyle(color: Theme.of(context).primaryColor)),onPressed: () async{
                           setState((){
                             myInfo.nickname = change.toString();
                           });

                           // 发起服务端请求
                           Dio _dio = new Dio();
                           _dio.options.responseType = ResponseType.plain;
                           var queryParams = {
                             "mobile": myInfo.mobile,
                             "key": 'nickname',
                             "val": myInfo.nickname
                           };
                           Response _res = await _dio.get(myHost+"/user/change",queryParameters: queryParams,options: Options(headers: {'Authorization':myToken}));

                           HttpRes _httpRes = HttpRes.fromJson(json.decode(_res.data.toString()));
                           if(_httpRes.status=='ok'){
                             print("succ");
                             showToast(_fToast,Icons.check, "修改成功");
                           }else{
                             showToast(_fToast, Icons.error, "修改失败,请重试");
                           }

                           Navigator.pop(context);
                         },),
                       ],
                     );
                   }
               );
             },
           ),

           Divider(),

           ListTile(leading:Text("手机"),title: Text(myInfo.mobile, style:TextStyle(color:Colors.grey,fontSize:16.0)),),
           
           Divider(),

            ListTile(leading: Text('修改密码'),
                trailing: Icon(Icons.chevron_right),
                onTap:(){
                  print("修改密码");
                }
              ),

            Divider(),


         ],
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