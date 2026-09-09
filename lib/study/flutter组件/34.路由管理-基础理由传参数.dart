import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

// 路由跳转-Material风格 只能有一个MaterialApp
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListPage() // 列表页 详情页
        );
  }
}

// 列表页
class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("列表页"),
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // 跳转到详情页
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                id: index + 1,
                              )));
                },
                child: Container(
                  color: Colors.blue,
                  margin: EdgeInsets.only(top: 10),
                  height: 100,
                  alignment: Alignment.center,
                  child: Text('列表项${index + 1}',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              );
            }));
  }
}

// 详情页
class DetailPage extends StatefulWidget {
  final int? id;
  DetailPage({Key? key, this.id}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("详情页"),
        ),
        body: Center(
          child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("返回上一个页面${widget.id}")),
        ));
  }
}
