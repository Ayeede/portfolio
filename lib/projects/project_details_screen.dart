import 'package:ayden_davis_portfolio_website/config/data/projects.dart';
import 'package:ayden_davis_portfolio_website/config/models/project_model.dart';
import 'package:ayden_davis_portfolio_website/config/route_config.dart';
import 'package:ayden_davis_portfolio_website/projects/bmi_calculator/input_page.dart';
import 'package:ayden_davis_portfolio_website/projects/crypto_checker/price_screen.dart';
import 'package:ayden_davis_portfolio_website/projects/flash_chat/flash_chat.dart';
import 'package:ayden_davis_portfolio_website/projects/todo/models/task_data.dart';
import 'package:ayden_davis_portfolio_website/projects/todo/screens/task_screen.dart';
import 'package:ayden_davis_portfolio_website/projects/weather_app/screens/location_screen.dart';
import 'package:ayden_davis_portfolio_website/projects/xylophone/xylophone.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailPage extends StatelessWidget {
  final String projectId; // The ID passed from GoRouter's path parameter

  const ProjectDetailPage({super.key, required this.projectId});

  // Helper function to launch URLs (from url_launcher package)
  Future<void> _launchURL(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        // Check if widget is still in tree before showing SnackBar
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not open link: $url')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Find the project based on the projectId received
    final Project project = allProjects.firstWhere(
      (p) => p.id == projectId, // Assuming your Project model has an 'id' field
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => context.go(AppRoute.homeScreen.fullPath), tooltip: 'back'),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            //title
            Text('Project: ${project.title}'),

            //Github external link button.
            IconButton(
              tooltip: 'View on Github',
              onPressed: () {
                if (project.githubUrl != null) {
                  _launchURL(project.githubUrl!, context);
                }
                assert(project.githubUrl != null, 'Project must contain a githubUrl. Please fix this at first notice');
              },
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              style: TextButton.styleFrom(backgroundColor: Colors.black, shape: RoundedRectangleBorder()),
              icon: Row(
                spacing: 12,
                children: [
                  // Github image
                  Image.asset('assets/github_logo.png', width: 24, height: 24),

                  // text
                  Text('View Github Repository', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
      body: switch (projectId) {
        'bmi-calculator' => InputPage(),
        'weather-app' => LocationScreen(),
        'xylophone' => XylophoneApp(),
        'flash-chat' => FlashChat(),
        'todo' => ChangeNotifierProvider(
          create: (context) => TaskData(),
          builder: (context, child) => MaterialApp(home: TaskScreen()),
        ),
        'cryptoChecker' => PriceScreen(),

        // Default case, _ (is a wildcard and will allow all else.)
        _ => Center(
          child: Text(
            'Error: Project ID "$projectId" not found or implemented.',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      },
    );
  }
}
