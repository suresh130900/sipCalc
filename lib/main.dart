import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sip_calc/Views/colour.dart';

void main() {
  runApp(const MyApp());
}

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme =
    _currentTheme == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English
              Locale('es'), // Spanish
            ],
            debugShowCheckedModeBanner: false,
            theme: themeProvider.currentTheme,
            home: ThemeColour(),
          );
        },
      ),
    );
  }
}