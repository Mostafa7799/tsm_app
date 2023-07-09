import 'package:flutter/material.dart';
import 'package:tsm_app/const.dart';
import 'package:tsm_app/screens/web_view_screen.dart';

import '../widget/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff000f26),
        title: const Text(
          'TSM',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                onTap: ()async{
                  await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebViewScreen(
                        webLink: teacherLink,
                      ),
                    ),
                  );
                },
                title: 'Teacher',
              ),
              CustomButton(
                onTap: ()async{
                  await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebViewScreen(
                        webLink: studentLink,
                      ),
                    ),
                  );
                },
                title: 'Student',
              ),
              CustomButton(
                onTap: ()async{
                  await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebViewScreen(
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
