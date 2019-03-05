import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import 'package:hello/store/app_state_model.dart';

///第二个界面
class Page2 extends StatefulWidget {
  final String message;

  const Page2(this.message);

  @override
  State<StatefulWidget> createState() => Page2State(message);
}

class Page2State extends State<Page2> {
  String message;
  Page2State(this.message);

  @override
  Widget build(BuildContext context) {
    var list = List<int>();

    ///字符串解码
    jsonDecode(message).forEach(list.add);
    final String value = Utf8Decoder().convert(list);
    return ScopedModelDescendant<AppStateModel>(builder: (context, child, model) {
      return Scaffold(
          appBar: AppBar(
            title: Text('第二个页面'),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(value),
              RaisedButton(
                  onPressed: () {
                    model.increment();
                    Navigator.pop(context, '${model.count}来自第二个界面');
                  },
                  child: Text(model.count.toString() + '返回上一个界面'))
            ],
          )));
    });
  }
}
