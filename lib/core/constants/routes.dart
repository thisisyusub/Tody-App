enum Routes {
  splash(path: '/splash'),
  onboarding(path: '/onboarding'),
  login(path: '/login'),
  home(path: '/'),
  settings(path: '/settings'),
  taskList(path: '/taskList');

  const Routes({required this.path});

  final String path;
}

/// SSOT => Single Source of Truth
