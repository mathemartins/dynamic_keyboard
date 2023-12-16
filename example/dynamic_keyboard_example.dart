import 'package:dynamic_keyboard/dynamic_keyboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Dynamic Keyboard Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Dynamic Keyboard Example', style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              DynamicKeyboard(
                onChanged: (String value) {
                  // Handle onChanged callback logic here
                  print('Value changed: $value');
                },
                onBackspace: () {
                  // Handle onBackspace callback logic here
                  print('Backspace pressed');
                },
                inputType: KeyboardInputType.Amount,
                maxLength: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
