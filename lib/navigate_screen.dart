import 'package:flutter/material.dart';
import 'package:movies_app/modules/movies/presentation/screens/movies_screen.dart';

class NavigateScreen extends StatelessWidget {
  const NavigateScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MoviesScreen()));
          },
          child: const Text('Go to Movies Screen'),
        ),
      ),
    );
  }
}