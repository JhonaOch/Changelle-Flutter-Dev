import 'package:challenge_flutter_dev/pages/home_page.dart';
import 'package:challenge_flutter_dev/provider/pokemon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider( create: ( _ ) => PokemonProvider()),
      ],
      child: MaterialApp(
        title: 'Change Flutter JH',
        theme: ThemeData(
       
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

