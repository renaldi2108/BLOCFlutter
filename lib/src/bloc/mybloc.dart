import 'dart:async';
import 'package:bloclearn/src/models/mymodel.dart';

class MyBloc {

  MyBloc() {
    _myStreamController.add(_myData);
  }

  List<MyModel> _myData = [
    MyModel(1, "Renaldi 1", "Depok"),
    MyModel(2, "Renaldi 2", "Depok"),
    MyModel(3, "Renaldi 3", "Depok"),
    MyModel(4, "Renaldi 4", "Depok"),
    MyModel(5, "Renaldi 5", "Depok"),
    MyModel(6, "Renaldi 6", "Depok"),
    MyModel(7, "Renaldi 7", "Depok")
  ];

  final _myStreamController = StreamController<List<MyModel>>();

  Stream<List<MyModel>> get myListStream => _myStreamController.stream;
  StreamSink<List<MyModel>> get myListSink => _myStreamController.sink;

  void dispose() {
    _myStreamController.close();
  }
}