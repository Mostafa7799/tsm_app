import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: const Color(0xff000f26),
            borderRadius: BorderRadius.circular(15)),
        child:  Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
