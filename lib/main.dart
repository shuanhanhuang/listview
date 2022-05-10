import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 建立AppBar
    final appBar = AppBar(
      title: Text('ListView例題'),
    );

    // 建立App的操作畫面
    final textWrapper = _TextWrapper(GlobalKey<_TextWrapperState>());

    const items = <String>['第一項', '第二項', '第三項','第四項','第五項','第六項','第七項','第八項'];
    const subtitle =<String>['first', 'second', 'third','the fourth','the fifth','the sixth','the seventh','the eighth',];
    //const icons = <String>['Icons.accessibility_new_outlined ', 'assets/2.png', 'assets/3.png'];

    var listView = ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) =>
          ListTile(title: Text(items[index], style: TextStyle(fontSize: 20),),
            onTap: () => textWrapper.setText('點選' + items[index]),
            leading: Container(
              child: Icon(Icons.airplanemode_active, color: Colors.lightBlue, size: 50),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),),
            subtitle: Text(subtitle[index],style: TextStyle(fontSize: 16),)),//Text('項目說明', style: TextStyle(fontSize: 16),),),
      separatorBuilder: (context, index) => Divider(),
    );

    final widget = Container(
      child: Column(
        children: <Widget>[
          textWrapper,
          Expanded(child: listView,),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 10,),
    );

    // 結合AppBar和App操作畫面
    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}

class _TextWrapper extends StatefulWidget {
  final GlobalKey<_TextWrapperState> _key;

  _TextWrapper(this._key): super (key: _key);

  @override
  State<StatefulWidget> createState() => _TextWrapperState();

  setText(String string) {
    _key.currentState?.setText(string);
  }
}

class _TextWrapperState extends State<_TextWrapper> {
  String _str = '';

  @override
  Widget build(BuildContext context) {
    var widget = Text(
      _str,
      style: TextStyle(fontSize: 20),
    );

    return widget;
  }

  setText(String string) {
    setState(() {
      _str = string;
    });
  }
}
