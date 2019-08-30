import 'package:bloclearn/src/models/baseresponse.dart';
import 'package:bloclearn/src/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MyBloc {
  final Repository _repository = Repository();
  final BehaviorSubject<BaseResponse<List<dynamic>>> _subject = BehaviorSubject<BaseResponse<List<dynamic>>>();

  getMeal() async {
    BaseResponse response = await _repository.getMeal();
    _subject.sink.add(response);
  }

  BehaviorSubject<BaseResponse<List<dynamic>>> get subject => _subject;

  void dispose() {
    _subject.close();
  }
}