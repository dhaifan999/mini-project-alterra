import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tflite_image_classification/screen/disease_view_model.dart';
import 'package:tflite_image_classification/screen/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DiseaseViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tomatocare',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
