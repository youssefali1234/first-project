import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_tranning/layout/cubit/shop_cubit.dart';
import 'package:shopping_tranning/layout/cubit/shop_states.dart';

class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopCubit(),
      child: BlocConsumer<ShopCubit,ShopStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                ShopCubit.get(context).ChangeIndex(index);
              },
              currentIndex: ShopCubit.get(context).currentIndex ,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category),
                    label: 'Category'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outlined),
                    label: 'Favorites'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'settings'
                ),
              ],
            ),
            body: ShopCubit.get(context).screens[ShopCubit.get(context).currentIndex]
          );
        },

      ),
    );
  }
}
