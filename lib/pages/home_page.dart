import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_home_ui/constants/constants.dart';
import 'package:smart_home_ui/constants/strings.dart';
import 'package:smart_home_ui/utils/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  AnimationController? _animationController;
  AnimationController? _homeAnimationController;
  AnimationController? _developerAnimationController;

  final Map<String, AnimationController> _smartDeviceControllers = {};

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _homeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _developerAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    for (var device in mySmartDevices) {
      _smartDeviceControllers[device[2]] = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _homeAnimationController?.dispose();
    _developerAnimationController?.dispose();

    for (var controller in _smartDeviceControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _toggleAnimation(AnimationController controller) {
    setState(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse(); // Si l'animation est terminée, inversez-la
      } else {
        controller.forward(); // Sinon, lancez l'animation
      }
    });
  }

  void powerSwitchChanged(bool value,bool reverse, int index, AnimationController controller) {
    setState(() {
      mySmartDevices[index][3] = value;
      mySmartDevices[index][4] = reverse;
      if (!reverse) {
        if (value) {
          controller.forward();
        } else {
          controller.reverse();
        }
      } else {
        if (value) {
          controller.reverse();
        } else {
          controller.forward();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        _toggleAnimation(_homeAnimationController!);
                      },
                      child: Lottie.asset(Assets.home,
                          height: 45,
                          controller: _homeAnimationController,
                          repeat: false, onLoaded: (composition) {
                        _homeAnimationController!.duration =
                            composition.duration;
                      })),
                  GestureDetector(
                      onTap: () {
                        _toggleAnimation(_developerAnimationController!);
                      },
                      child: Lottie.asset(Assets.developper,
                          height: 45,
                          controller: _developerAnimationController,
                          repeat: false, onLoaded: (composition) {
                        _developerAnimationController!.duration =
                            composition.duration;
                      })),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Home',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700]
                    )
                  ),
                  Text(
                    'John Doe',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 70,
                    )
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40
              ),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Smart Devices',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: mySmartDevices.length,
                  padding: const EdgeInsets.all(25),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                  itemBuilder: (context, index) {
                    final smartDevice = mySmartDevices[index];
                    bool reverse = mySmartDevices[index][4];
                    return SmartDeviceBox(
                      smartDeviceName: smartDevice[0],
                      iconPath: smartDevice[1],
                      powerOn: smartDevice[3],
                      controller: _smartDeviceControllers[smartDevice[2]],
                      onChanged: (value) => powerSwitchChanged(value, reverse, index, _smartDeviceControllers[smartDevice[2]]!),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
