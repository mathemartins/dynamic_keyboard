# Dynamic Keyboard

This package provides a customizable dynamic keyboard widget for Flutter applications. 
It allows users to integrate a flexible keyboard component with different input types into their 
Flutter projects.

## Features

- Create dynamic keyboards for various input types.
- Customize key layouts and functionality based on specific use cases.
- Support for handling different input scenarios like Amount, PIN, Custom, etc.


## Example Usage

```dart
import 'package:flutter/material.dart';
import 'package:dynamic_keyboard/dynamic_keyboard.dart';

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

```

## Getting Started

To start using the package, ensure you have Flutter installed. 
Then, add the `dynamic_keyboard` dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  dynamic_keyboard: ^1.0.0 
```

## Author
- Mathemartins Chizaram

Additional Information
For more details, check out the example directory. 
Feel free to contribute, report issues, or request features on the GitHub repository.

For guidance on contributing to this package, refer to the CONTRIBUTING file.



