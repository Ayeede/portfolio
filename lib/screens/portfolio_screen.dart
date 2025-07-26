import 'package:ayden_davis_portfolio_website/config/data/projects.dart';
import 'package:ayden_davis_portfolio_website/config/route_config.dart';
import 'package:ayden_davis_portfolio_website/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    int crossAxisCount = 2;
    double childAspectRatio = 1;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 120),
            constraints: BoxConstraints(maxWidth: 1000),
            child: Column(
              spacing: 40,
              children: [
                // Title Widget
                Text('Ayden Davis - CV Portfolio', style: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                // description
                Text(
                  'Welcome to my Flutter project showcase!\n Here you\'ll find a collection of cross-platform applications demonstrating my skillss in mobile and web development.',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: textTheme.titleMedium,
                ),

                // grid of applicationw
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 32.0,
                    mainAxisSpacing: 32.0,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemCount: allProjects.length,
                  itemBuilder: (context, index) {
                    final project = allProjects[index];
                    return ProjectCard(
                      title: project.title,
                      description: project.description,
                      imageUrl: project.imageUrl,
                      onPressed: () {
                        debugPrint('Pushed button should direct to project: ${project.id}');
                        // Use GoRouter to navigate to the project's detail page
                        context.goNamed(AppRoute.project.name, pathParameters: {'projectId': project.id});
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
