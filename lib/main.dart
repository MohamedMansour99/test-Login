import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login_screen/business_logic/cubit/cubit/login_cubit.dart';
import 'package:test_login_screen/componants/constants.dart';
import 'package:test_login_screen/local/bloc_observer.dart';
import 'package:test_login_screen/local/cache_helper.dart';
import 'package:test_login_screen/presentation/screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Bloc.observer = MyBlocObserver();

  // uId = CacheHelper.getData(key: 'uid') ?? '';
  // print('uid is $uId');

  // isUser = CacheHelper.getData(key: 'isUser');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
