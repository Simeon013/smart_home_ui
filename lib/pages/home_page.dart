import 'package:flutter/material.dart';
import 'package:lordicon/lordicon.dart';
import 'package:smart_home_ui/constants/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    var homeController = IconController.assets(Assets.home);

    homeController.addStatusListener((status) {
      if (status == ControllerStatus.ready) {
        homeController.playFromBeginning();
      }
    });

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconViewer(
                  controller: homeController,
                  height: 45,
                  colorize: Colors.grey[800],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
