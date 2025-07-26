import 'package:cv_main_project/projects/flash_chat/screens/chat_screen.dart';
import 'package:cv_main_project/projects/flash_chat/screens/login_screen.dart';
import 'package:cv_main_project/projects/flash_chat/screens/registration_screen.dart';
import 'package:cv_main_project/projects/flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
