import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quietpaper/provider/cat_provider.dart';
import 'package:quietpaper/view/splash_screen.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>ChangeNotifierProvider(
      create: (context) => CatProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
  );
}





