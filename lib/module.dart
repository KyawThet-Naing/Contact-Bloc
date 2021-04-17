import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_bloc/api/api_service.dart';
import 'bloc/get_all_contact_cubit.dart';
import 'bloc/post_contact_cubit.dart';

GetIt getIt = GetIt.I;
//getIt
void serviceLocator() {
  Dio dio = Dio();
  getIt.registerLazySingleton(() => dio);
  ApiService apiService = ApiService(getIt.call());
  getIt.registerLazySingleton(() => apiService);
  GetAllContactCubit getAllContactCubit = GetAllContactCubit(getIt.call());
  getIt.registerLazySingleton(() => getAllContactCubit);
  PostContactCubit postContactCubit = PostContactCubit(getIt.call());
  getIt.registerLazySingleton(() => postContactCubit);
}

//getX
void getXLocator() {
  Dio dio = Dio();
  Get.put(dio);
  ApiService apiService = ApiService(Get.find());
  Get.put(apiService);
}
