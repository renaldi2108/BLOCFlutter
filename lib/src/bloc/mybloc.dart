import 'package:bloclearn/src/models/baseresponse.dart';
import 'package:bloclearn/src/models/meal.dart';
import 'package:bloclearn/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MyBloc {
  final Repository _repository = Repository();
  final BehaviorSubject<BaseResponse<List<Meal>>> _subject = BehaviorSubject<BaseResponse<List<Meal>>>();

  getMeal() async {
    BaseResponse response = await _repository.getMeal();
    _subject.sink.add(response);
  }

  BehaviorSubject<BaseResponse<List<Meal>>> get subject => _subject;

  void dispose() {
    _subject.close();
  }
}