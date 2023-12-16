import 'package:flutter/material.dart';

enum KeyboardInputType { Amount, Pin, Custom }

class DynamicKeyboard extends StatelessWidget {
  final void Function(String)? onChanged;
  final VoidCallback? onBackspace;
  final KeyboardInputType inputType;
  final int maxLength;

  DynamicKeyboard({
    this.onChanged,
    this.onBackspace,
    required this.inputType,
    required this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildKey('1'),
                buildKey('2'),
                buildKey('3'),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildKey('4'),
                buildKey('5'),
                buildKey('6'),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildKey('7'),
                buildKey('8'),
                buildKey('9'),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (inputType == KeyboardInputType.Amount || inputType == KeyboardInputType.Custom)
                  buildKey('.'),
                buildKey('0'),
                buildBackspace(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildKey(String value) {
    return Expanded(
      child: GestureDetector(
        onTap: () => handleKeyPress(value),
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBackspace() {
    return Expanded(
      child: GestureDetector(
        onTap: onBackspace,
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Icon(Icons.backspace),
          ),
        ),
      ),
    );
  }

  void handleKeyPress(String value) {
    if (onChanged != null) {
      if (inputType == KeyboardInputType.Amount || inputType == KeyboardInputType.Custom) {
        onChanged!(value);
      } else if (inputType == KeyboardInputType.Pin && maxLength > 0) {
        if (value != '.' && value != '0') {
          // Handle onChanged potentially returning void
          try {
            onChanged!(value);
          } catch (e) {
            // Handle any exception if needed
            print("Error occurred: $e");
          }
        }
      }
    }
  }



}

