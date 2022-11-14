import 'package:flutter/material.dart';
import 'package:image_search/data/pixabay_api.dart';
import 'package:image_search/model/ui/home_screen.dart';
import 'package:image_search/model/ui/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider(
        create: (_) => HomeViewModel(repository: PixabayApi()),
        child: const HomeScreen(),
      ),
    );
  }
}
