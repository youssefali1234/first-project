import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_tranning/layout/home_layout.dart';
import 'package:shopping_tranning/modules/login/login_screen.dart';
import 'package:shopping_tranning/modules/rigester/cubit/rigester_cubit.dart';
import 'package:shopping_tranning/shared/components/constants.dart';
import 'package:shopping_tranning/shared/network/local/sharedprefrence.dart';
import 'package:shopping_tranning/shared/network/remote/dio.dart';

import 'shared/bloc_observer.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
 await CachHelper.init();
 token=CachHelper.getdata(key: 'token');
        DioHelper.init();
Widget widget;
        if(token!=null)
          {
            widget=HomeLayout();
          }
        else{
          widget=LoginScreen();
        }
        runApp(MyApp(widget));
}
class MyApp extends StatelessWidget {
Widget widget;
MyApp(
  this.widget
);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (context)=>RigesterCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: widget,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black
            ),
            elevation: 0
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.grey[700],
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
          ),
          iconTheme: IconThemeData(
            color: Colors.black
          )
        ),
      ),
    );
  }
}
