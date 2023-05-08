import 'package:flutter/material.dart';
import 'package:tflite_image_classification/screen/about_this_screen.dart';
import 'package:tflite_image_classification/screen/contact_us_screen.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [AboutThisApp(), ContactUsPage()],
        ),
      ),
    );
  }
}
