import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/provider/count_provider.dart';
import 'package:provider_basic/provider/fav_provider.dart';
import 'package:provider_basic/provider/login_provider.dart';
import 'package:provider_basic/provider/slider_provider.dart';
import 'package:provider_basic/provider/theme_provider.dart';
import 'package:provider_basic/screens/count_screen.dart';
import 'package:provider_basic/screens/favourites/favourite.dart';
import 'package:provider_basic/screens/login.dart';
import 'package:provider_basic/screens/slider.dart';
import 'package:provider_basic/screens/theme_changer_screen.dart';
import 'package:provider_basic/screens/value_notify_listener.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
        ////ONE PROVIDER
        //  ChangeNotifierProvider(
        //   create: (_) => SliderProvider(),
        //   child: MaterialApp(
        //     title: 'Flutter Demo',
        //     theme: ThemeData(
        //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //       useMaterial3: true,
        //     ),
        //     home: SliderScreen(),
        //   ),

        // );

        MultiProvider(
            providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => SliderProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => LoginProvider()),
        ],
            child: Builder(builder: (BuildContext context) {
              final themechanger = Provider.of<ThemeProvider>(context);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                themeMode: themechanger.thememood,
                theme: ThemeData(
                    primarySwatch: Colors.blueGrey,
                    brightness: Brightness.light),
                darkTheme: ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.blueGrey,
                    appBarTheme: AppBarTheme(color: Colors.amberAccent)),
                home: LoginScreen(),
              );
            }));
  }
}
