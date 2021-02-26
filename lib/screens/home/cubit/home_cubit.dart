import 'package:bloc/bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:random_waifu/models/models.dart';
import 'package:random_waifu/repositories/local_database_repository.dart';
import 'package:random_waifu/screens/home/cubit/home_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:random_waifu/services/push_notification_service.dart';
import 'package:random_waifu/services/waifus_service.dart';

class HomeCubit extends Cubit<HomeState> {
  final WaifusService waifusService;
  final PushNotificationService pushNotificationService;
  final DatabaseRepository _databaseRepository;
  HomeCubit(
    this.waifusService,
    this._databaseRepository,
    this.pushNotificationService,
  ) : super(HomeStateLoading());

  void reportWaifu(JsonWaifu waifu) async {
    final Email email = Email(
      body: 'Character name: ${waifu.title}\nCharacter id: ${waifu.mal_id}',
      subject: 'Not a waifu report :(',
      cc: ['logicappsfeedback@gmail.com'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);

    await this._databaseRepository.deleteLastWaifu();

    getRandomWaifu();
  }

  Future getRandomWaifu() async {
    emit(HomeStateLoading());

    try {
      await _databaseRepository.init();
      await pushNotificationService.initialise();
      await Firebase.initializeApp();
      var lastWaifuDate = this._databaseRepository.getLastWaifuDate();

      var today = DateTime.now();

      JsonWaifu waifu;

      bool shouldFetchWaifu = today.day != lastWaifuDate && today.hour >= 0 ||
          lastWaifuDate == null;

      if (shouldFetchWaifu) {
        do {
          waifu = await this.waifusService.getRandomWaifu();
        } while (await this._databaseRepository.characterExists(waifu.mal_id));
        
        final newCharacter = SavedCharacter(
          characterId: waifu.mal_id,
          date: _getDate(),
          imageUrl: waifu.image_url,
          name: waifu.title,
        );

        await this._databaseRepository.addWaifu(newCharacter);
        await this._databaseRepository.resetTimer();
      } else
        waifu = this._databaseRepository.loadLastWaifu();

      emit(HomeStateLoaded(waifu));
    } catch (e) {
      print(e);
      emit(HomeStateError(e.toString()));
    }
  }

  String _getDate() {
    return "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}";
  }
}
