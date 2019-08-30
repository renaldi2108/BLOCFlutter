import 'package:bloclearn/src/bloc/mybloc.dart';
import 'package:bloclearn/src/models/baseresponse.dart';
import 'package:bloclearn/src/models/meal.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MyBloc _myBloc = new MyBloc();

  @override
  void initState() {
    super.initState();
    _myBloc.getMeal();
  }

  @override
  void dispose() {
    super.dispose();
    _myBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
//        leading: IconButton(
//            icon: Icon(Icons.arrow_back),
//            onPressed: () => Navigator.pop(context, false))
        ),
        body: Container(
            child: StreamBuilder<BaseResponse<List<dynamic>>>(
                stream: _myBloc.subject.stream,
                builder: (BuildContext context, AsyncSnapshot<BaseResponse<List<dynamic>>> snapshot) {
                  List<Meal> list = List<Meal>.from(snapshot.data.meals.map((x) => Meal.fromJson(x)));
                  return Container(
                    child: Center(
                      child: Text(list[0].strMeal),
                    ),
                  );
                }
            )
        )
    );
  }
}