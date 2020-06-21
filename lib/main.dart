import 'package:flutter/material.dart';
import 'package:flutterapp/logic/bloc/news_bloc.dart';
import 'package:flutterapp/screen/news_screen.dart';
import 'package:provider/provider.dart';

main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FutureProvider(
        lazy: true,
        create: (BuildContext context) => NewsBloc().loadBusinessNews(),
        child: NewsScreen(),
      );
}
