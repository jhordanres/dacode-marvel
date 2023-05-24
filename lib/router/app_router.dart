

import 'package:daco_marvel/view/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: 'details',
      name: DetailsScreen.name,
      builder: (context, state) => DetailsScreen() 

    )
  ]
);