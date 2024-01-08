import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/provider/theme_provider.dart';

class ThemeChangerScreen extends StatefulWidget {
  const ThemeChangerScreen({super.key});

  @override
  State<ThemeChangerScreen> createState() => _ThemeChangerScreenState();
}

class _ThemeChangerScreenState extends State<ThemeChangerScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeChanger = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
            title: Center(child: Text('Dark zyada acha hai')),
            backgroundColor: Colors.teal),
        body: Column(
          children: [
            RadioListTile<ThemeMode>(
                title: Text('Light Mode'),
                value: ThemeMode.light,
                groupValue: ThemeChanger.thememood,
                onChanged: ThemeChanger.settheme),
            RadioListTile<ThemeMode>(
                title: Text('Dark Mode'),
                value: ThemeMode.dark,
                groupValue: ThemeChanger.thememood,
                onChanged: ThemeChanger.settheme),
            RadioListTile<ThemeMode>(
                title: Text('System Mode'),
                value: ThemeMode.system,
                groupValue: ThemeChanger.thememood,
                onChanged: ThemeChanger.settheme),
          ],
        ));
  }
}
