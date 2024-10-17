import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:testtech/src/common/ka/themes/app_theme.dart';
import 'package:testtech/src/features/Person/ui/person_list_screen.dart';
import 'package:testtech/src/router/router.dart';

class App extends HookWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Antigaspi Business',
      theme: KaTheme.theme,
      builder: (context, child) {
        return Directionality(
          textDirection: KaTheme.textDirection,
          child: child!,
        );
      },
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    //home : LoginScreen()
    );
  }
}