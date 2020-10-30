import 'package:bloc/bloc.dart';

import 'HistoryEvent.dart';
import 'HistoryState.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc(HistoryState initialState) : super(initialState);


  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
  }
}