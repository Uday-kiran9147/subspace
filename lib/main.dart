// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subspace/provider/provider.dart';
import 'presentation/pages/favourites_screen.dart';
import 'presentation/pages/home_screen.dart';

void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value:AppState(),
        )
      ],
      child: MaterialApp(
        title: 'Subspace',
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Montserrat',
          // colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        routes: {
          "/home": (context) => MyHomePage(),
          FAVOURITES: (context) => FavouritesScreen(),
        },
      ),
    );
  }
}
