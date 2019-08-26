import 'package:bloclearn/src/bloc/mybloc.dart';
import 'package:bloclearn/src/models/mymodel.dart';
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
  void dispose() {
    super.dispose();
    _myBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: StreamBuilder<List<MyModel>>(
          stream: _myBloc.myListStream,
          builder: (BuildContext context, AsyncSnapshot<List<MyModel>> snapshot){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text("${snapshot.data[index].name}"),
                            Text("${snapshot.data[index].address}")
                          ],
                        ),
                      )
                    ],
                  )
                );
              }
            );
          }
        )
      )
    );
  }
}
