import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

var sl = GetIt.instance;

Future<void> initGetIt() async {
  // sl.registerFactory<VideoBloc>(() => VideoBloc(sl()));
  //
  // sl.registerLazySingleton<VideoRepository>(() => VideoRepositoryImpl(sl()));
  //
  // sl.registerLazySingleton<VideoDataSource>(() => VideoDataSourceImpl());

}