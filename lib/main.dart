import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mina_gallery/Login/Login_design.dart';
import 'package:mina_gallery/public%20cubit/bloc%20observer.dart';
import 'package:mina_gallery/public%20cubit/cashe%20helper.dart';
import 'package:mina_gallery/public%20cubit/dio%20helper.dart';
import 'package:mina_gallery/shared/Constants.dart';
Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  DioHelper.init();
  token = CachHelper.getData(key: 'token');
  print(token.toString());
  BlocOverrides.runZoned(
        (){
          runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login_screen(),
    );
  }
}

