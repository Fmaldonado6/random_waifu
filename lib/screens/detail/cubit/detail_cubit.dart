import 'package:bloc/bloc.dart';
import 'package:random_waifu/screens/detail/cubit/detail_state.dart';
import 'package:random_waifu/services/jikan_service.dart';

class DetailCubit extends Cubit<DetailState> {
  final JikanService jikanService;
  DetailCubit(this.jikanService) : super(DetailStateLoading());

  Future getWaifuInformation(int malId) async {
    emit(DetailStateLoading());
    try {
      final waifu = await this.jikanService.getCharacterInformation(malId);
      emit(DetailStateLoaded(waifu));
    } catch (e) {
      emit(DetailStateError(e.toString()));
    }
  }
}
