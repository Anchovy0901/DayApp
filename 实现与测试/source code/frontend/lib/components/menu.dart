import 'package:flutter/material.dart';
import 'package:frontend/pages/personal/personalFunc/myAchieve.dart';
import 'package:frontend/pages/personal/personalFunc/myCollection.dart';
import 'package:frontend/pages/personal/personalFunc/myDynamic.dart';
import 'package:frontend/pages/personal/personalFunc/recentMeal.dart';

class MainMenu extends StatelessWidget
{
  
  @override 
  Widget build(BuildContext context)
  {
    return new Container(
      margin:const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0, top:5.0),
      constraints: const BoxConstraints(maxHeight: 250.0),
      child: new ListView(
        padding: const EdgeInsets.only(left:5.0),
        children: [
          _buildListItem("最近饮食", Icons.restaurant,
          (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new RecentMealPage()));
          }),
         // _buildListItem("体重报告", Icons.line_weight, (){}),
          _buildListItem("我的发布", Icons.camera, 
          (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>new MyDynamics()));
          })
          ,
          _buildListItem("我的收藏", Icons.favorite, (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>new MyCollectionsPage()));
          }),
          _buildListItem("我的成就", Icons.military_tech, (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>new MyAchievePage()));
          }),
        ],
      )
    );
  }


  
  Widget _buildListItem(String title, IconData iconData, VoidCallback action)
  {
    final textStyle = new TextStyle(color:Colors.black54, fontSize:18.0, fontWeight: FontWeight.w600);

    return new InkWell(
      onTap: action,
      child: new Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0, top:5.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Container(
              width: 35.0,
              height: 35.0,
              margin: const EdgeInsets.only(right: 10.0),
              decoration: new BoxDecoration(color:Colors.blue, borderRadius: new BorderRadius.circular(5.0)),
              alignment: Alignment.center,
              child:new Icon(iconData, color:Colors.white, size:24.0),
            ),
            new Text(title, style: textStyle),
            new Expanded(child: new Container()),
            new IconButton(
              icon: new Icon(Icons.chevron_right, color:Colors.black26),
              onPressed: action,
            )
          ],
        ),
      )
    );
  }

}
