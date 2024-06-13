import 'package:flutter/material.dart';
import 'package:tsm_app/const.dart';
import 'package:tsm_app/screens/web_view_screen.dart';
import '../widget/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/logo.png',
                height: 200,
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewScreen(
                        webLink: teacherLink,
                      ),
                    ),
                  );
                },
                title: 'Teacher',
              ),
              CustomButton(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewScreen(
                        webLink: studentLink,
                      ),
                    ),
                  );
                },
                title: 'Student',
              ),
              CustomButton(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewScreen(
                        webLink: parentLink,
                      ),
                    ),
                  );
                },
                title: 'Parent',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
