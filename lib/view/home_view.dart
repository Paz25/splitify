import 'package:flutter/material.dart';
import 'package:splitify/utils/theme/elevated_button_theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 48,
            bottom: 24,
            start: 24,
            end: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: TElevatedButtonTheme.primaryElevatedButton.style,
                child: const Text(
                  'Add new bills',
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Recent Bills',
                textAlign: TextAlign.left,
                style: TextStyle(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
