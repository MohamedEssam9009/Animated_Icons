import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  bool isDone = false;
  void switchIcon() {
    if (isDone == false) {
      animationController.forward();
      isDone = true;
    } else {
      animationController.reverse();
      isDone = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: GestureDetector(
          onTap: switchIcon,
          child: AnimatedIcon(
            color: Colors.white,
            size: 150.0,
            icon: AnimatedIcons.play_pause,
            progress: animationController,
          ),
        ),
      ),
    );
  }
}
