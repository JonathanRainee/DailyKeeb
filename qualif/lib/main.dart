import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qualif/login.dart';
import 'package:qualif/theme.dart';
// import 'package:provider/provider.dart';

void main(){
  // runApp(const DailyKeeb());
  runApp(ChangeNotifierProvider(
      child: const DailyKeeb(),
      create: (context) => ThemeProvider(isDarkTheme: false),
    )
  );
}

class DailyKeeb extends StatefulWidget {
  const DailyKeeb({super.key});

  @override
  State<DailyKeeb> createState() => _DailyKeebState();
}

class _DailyKeebState extends State<DailyKeeb> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child){
        return MaterialApp(
          title: "DailyKeeb",
          theme: ThemeProvider.getTheme(),
          home: LoginPage(),
        );
      }
    );
  }
}