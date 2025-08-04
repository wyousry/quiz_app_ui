import 'package:flutter/material.dart';
import 'package:quiz_app/models/colors.dart';

class CustomButton extends StatelessWidget {
  final Widget destination;
  final String title;
  final bool replace;
  final VoidCallback onPressedExtra; 

  const CustomButton({
    super.key,
    required this.destination,
    required this.title,
    required this.onPressedExtra, 
    this.replace = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: linearGradient,
      ),
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: () {
          onPressedExtra(); 

          if (replace) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          }
        },
        child: Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }
}
