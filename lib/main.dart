import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit_bloc/module.dart';
import 'package:retrofit_bloc/screen/home.dart';
import 'package:dio/dio.dart';

import 'bloc/get_all_contact_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //serviceLocator();
  getXLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dio dio = Get.find();
    dio.interceptors.add(PrettyDioLogger());
    return BlocProvider<GetAllContactCubit>(
      create: (_) => GetAllContactCubit(Get.find()),
      child: GetMaterialApp(
        title: 'Contact',
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
