class Project {
  // AppRoute is an enum which holds a path for goRouter. e.g. AppRoute.portfolioScreen('/portfolio')
  // can access path through - AppRoute.portfolioScreen.fullpath;
  final String id;
  final String title;
  final String description;
  final String? imageUrl; // Thumbnail for the card

  final String? githubUrl;

  const Project({required this.id, required this.title, required this.description, this.imageUrl, this.githubUrl});
}
