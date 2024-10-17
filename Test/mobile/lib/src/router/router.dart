import 'package:flutter/material.dart';

import '../features/Person/ui/person_create_screen.dart';
import '../features/Person/ui/person_list_screen.dart';
import '../features/Person/ui/verify_person_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => PersonListScreen()); // Page d'accueil
      case '/createPerson':
        return MaterialPageRoute(builder: (_) => PersonAddScreen()); // Page de création
      case '/searchPerson':
        return MaterialPageRoute(builder: (_) => VerifyPersonScreen()); // Page de recherche
      default:
        return _errorRoute(); // Page d'erreur si la route est inconnue
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR: Route not found'),
          ),
        );
      },
    );
  }
}
