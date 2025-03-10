import 'package:fake_store/presentation/main/main_screen.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../core/constants/app_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Icon(
              Icons.shopping_bag,
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              AppStrings.appName,
              style: AppStyles.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
