import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String btnText;
  final VoidCallback? onTap;

  const AppButton({
    required Key key,
    required this.btnText,
    this.onTap,
    required Function() onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 260,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
        decoration: BoxDecoration(
          color: Colors.deepOrange.shade400,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          btnText,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ListContent extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final String imagePath;

  // ignore: use_key_in_widget_constructors
  const ListContent({
    Key? key,
    required this.text,
    required this.onTap,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.fill,
        ),
        title: Text(
          text,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
