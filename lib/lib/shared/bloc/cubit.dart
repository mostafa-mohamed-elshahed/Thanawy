import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thanawy_programming/lib/modules/morapy/morapy.dart';
import 'package:thanawy_programming/lib/modules/telmez/telmez.dart';
import 'package:thanawy_programming/lib/modules/waly/waly.dart';
import 'package:thanawy_programming/lib/shared/bloc/cubit_state.dart';

class NameCubitApp extends Cubit<NameStateApp>{
  NameCubitApp() : super(InitialAppState());
 static NameCubitApp get(context)=>BlocProvider.of(context);

  int currentIndex=0;
  void currentIndexChange(index,context){
      currentIndex=index;
    emit(BottomNavBarAppState());
  }
  List<String> titles=[
    "ألتلميذ",
    "ألمربي",
    "ألولي",
  ];
  List<Widget> screens=[
    Telmez(),
    Morapy(),
    Waly(),
  ];

}