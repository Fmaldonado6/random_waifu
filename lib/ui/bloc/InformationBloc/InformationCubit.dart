// class InformationBloc extends Bloc<InformationEvent, InformationState> {
//   final KitsuRepository _kitsuRepository;
//   final PushNotificationService _pushNotificationService;

//   InformationBloc(InformationState initialState, this._kitsuRepository,
//       this._pushNotificationService)
//       : super(initialState);

//   void getRandomWaifu() {
//     add(GetWaifu());
//   }

//   @override
//   Stream<InformationState> mapEventToState(InformationEvent event) async* {
//     if (event is GetWaifu) {
//       try {
//         yield InformationState.loading();
//         await Hive.openBox("savedCharacters");
//         await Hive.openBox("today");
//         await _pushNotificationService.initialise();
//         await Firebase.initializeApp();

//         var lastWaifuDate = Hive.box('today').get(0);

//         var today = DateTime.now();

//         var characterInformation;
//         if (today.day != lastWaifuDate && today.hour >= 0 ||
//             lastWaifuDate == null)
//           characterInformation = await _kitsuRepository.getRandomWaifu();
//         else
//           characterInformation = _kitsuRepository.loadLastWaifu();

//         yield InformationState.success(characterInformation);
//       } on KitsuSearchError catch (e) {
//         print(e);
//         yield InformationState.error();
//       }
//     }
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:random_waifu/services/PushNotificationService.dart';
import 'package:random_waifu/services/waifusService.dart';
import 'package:random_waifu/ui/bloc/InformationBloc/InformationState.dart';

class InformationCubit extends Cubit<InformationState> {
  final WaifusService waifusService;
  final PushNotificationService pushNotificationService;
  InformationCubit(
    this.waifusService,
    this.pushNotificationService,
  ) : super(InformationStateLoading());

  Future getRandomWaifu() {
    try {} catch (e) {}
  }
}
