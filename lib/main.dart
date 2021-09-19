
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:thanawy_programming/lib/layout/home_layout.dart';
import 'package:thanawy_programming/lib/shared/bloc/cubit.dart';
import 'package:thanawy_programming/lib/shared/bloc_observer.dart';

import 'package:thanawy_programming/lib/shared/styles/themes.dart';
import 'package:splash_screen_view/SplashScreenView.dart';


main()async{
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  // await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NameCubitApp(),
      child: MaterialApp(
        theme: lightTheme,
        darkTheme:darkTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          body: SplashScreenView(
            text:'Welcome In Education App',
              imageSrc: "Assets/Images/2.jpg",
              speed: 6,
              backgroundColor: Colors.grey,
              imageSize: 640,
              navigateRoute: HomeLayOut(),
          ),
        ),
      ),
    );
  }
}

