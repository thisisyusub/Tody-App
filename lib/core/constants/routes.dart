enum Routes {
  splash(path: '/splash'),
  onboarding(path: '/onboarding'),
  login(path: '/login');

  const Routes({required this.path});

  final String path;
}

/// SSOT => Single Source of Truth
