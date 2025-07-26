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
    id: 'todo',
    title: 'To-do Application',
    description:
        'Basic todo application to check and mark off applications, uses the package provider to hold the state of an item across different widgets. NOTE: will not hold tasks upon leaving page',
    githubUrl: 'https://github.com/Ayeede/todoey',
  ),

  Project(
    id: 'xylophone',
    title: 'Xylophone Application',
    description:
        'Basic Xylophone application which has different inputs based on where you click on the screen and will play a sound based on that input.',
    githubUrl: 'https://github.com/Ayeede/xylophone',
  ),

  Project(
    id: 'bmi-calculator',
    title: 'Bmi Calculator',
    description: 'Basic bmi-calculator, which uses 4 input variables to calculate the users bmi score.',
    githubUrl: 'https://github.com/Ayeede/bmi-calculator',
  ),
];
