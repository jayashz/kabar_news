import 'package:flutter/material.dart';

class HomepageWidget extends StatelessWidget {
  const HomepageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Text("Heres the center widget at homepage"),
        ),
      ),
    );
  }
}
