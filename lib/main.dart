import 'package:apiecomers/home_screen.dart';
import 'package:apiecomers/provider_screen.dart';
import 'package:apiecomers/select_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(create: (context)=>HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>Home_Screen(),
         'sd':(context)=>Select_Screen(),
        },
      ),
    )
  );
}