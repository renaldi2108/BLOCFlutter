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
            child: StreamBuilder<BaseResponse<List<Meal>>>(
                stream: _myBloc.subject.stream,
                builder: (BuildContext context, AsyncSnapshot<BaseResponse<List<Meal>>> snapshot) {
                  if(snapshot.hasData) {
                    if (snapshot.data.meals != null && snapshot.data.meals.length > 0){
                      return Container(
                          child: GridView.builder(
                              itemCount: snapshot.data.meals.length,
                              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2
                              ),
                              itemBuilder: (context, position) {
                                var data = snapshot.data.meals[position];
                                return GestureDetector(
                                    child: _createList(data)
                                );
                              }
                          )
                      );
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
            )
        )
    );
  }

  Widget _createList(Meal data) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(16.0),
              child: new Image.network(
                data.strMealThumb,
                // height: 90.0,
                // width: 100.0,
                height: 130.0,
                fit: BoxFit.cover,
              ),
            ),
          )),
      SizedBox(
        width: 5.0,
      ),
      Container(
        child: Center(
            child: Text(
              data.strMeal,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            )
        ),
      )
    ],
  );
}