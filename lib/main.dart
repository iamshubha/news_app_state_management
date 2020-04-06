import 'package:flutter/material.dart';
import 'package:flutterapp/logic/bloc/news_bloc.dart';
import 'package:flutterapp/screen/business_news_screen.dart';
import 'package:provider/provider.dart';
main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BusinessNewsScreen(),
      ),
    );
