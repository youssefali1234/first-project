import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_tranning/layout/cubit/shop_states.dart';
import 'package:shopping_tranning/modules/category.dart';
import 'package:shopping_tranning/modules/favorites.dart';
import 'package:shopping_tranning/modules/home.dart';
import 'package:shopping_tranning/modules/settings.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit():super(intialState());

  static ShopCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget>screens=[
  HomeScreen(),
  CategoryScreen(),
  FavoritesScreen(),
  SettingScreen(),
  ];
  void ChangeIndex(index)
  {
    currentIndex=index;
    emit(ChangeBottomNavigationBarState());
  }

}