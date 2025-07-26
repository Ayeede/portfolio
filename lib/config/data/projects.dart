import 'package:cv_main_project/config/models/project_model.dart';

final List<Project> allProjects = [
  Project(
    id: 'flash-chat',
    title: 'Flash Chat',
    description: 'small application that allows a user to login or register, then send messages to the database using firebase Auth & firestore',
    githubUrl: 'https://github.com/Ayeede/flash-chat',
  ),

  Project(
    id: 'weather-app',
    title: 'Weather Application',
    description: 'Weather Application, that calls a weather api to get the current weather data',
    githubUrl: 'https://github.com/Ayeede/weather-app',
  ),
  Project(
    id: 'cryptoChecker',
    title: 'Crypto Checker',
    description: 'basic crypto tracker which grabs a crypto coin from an API, the user types in and displays that on a screen',
    githubUrl: 'https://github.com/Ayeede/crypto_checker',
  ),

  Project(
    id: 'todo',
    title: 'To-do Application',
    description:
        'Basic todo application to check and mark off applications, uses the package provider to hold the state of an item across different widgets. NOTE: will not hold tasks upon leaving page',
    githubUrl: 'https://github.com/Ayeede/todoey',
  ),
];
