import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thanawy_programming/lib/shared/bloc/cubit.dart';
import 'package:thanawy_programming/lib/shared/bloc/cubit_state.dart';

class HomeLayOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NameCubitApp, NameStateApp>(
      builder: (BuildContext context, state) {
        var cubit = NameCubitApp.get(context);
        return Scaffold(
          appBar: AppBar(
              title:Text(
                cubit.titles[cubit.currentIndex],
                style: Theme.of(context).textTheme.bodyText1,
              ),
            centerTitle: true,

            elevation: 5,
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.currentIndexChange(index, context);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "التلميذ",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_pin_outlined),
                label: "المربي",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_pin),
                label: "الولي",
              ),
            ],
            showUnselectedLabels: false,
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
