import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection_config.config.dart';
final getIt = GetIt.instance;

@InjectableInit()
void configureInjection() => $initGetIt(getIt);


@module
abstract class NetworkModule{

  @singleton 
  Dio get dio => Dio();

}