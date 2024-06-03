import 'package:smart_home_ui/constants/strings.dart';

// [name, asset, controller, active, reverse]
List mySmartDevices = [
  ['Alarm', Assets.alarmClock, '_alarmClockAnimationController', false, false],
  ['Chandelier', Assets.chandelier, '_chandelierAnimationController', false, false],
  ['Computer', Assets.computerDisplay, '_computerDisplayAnimationController', false, false],
  ['Smart TV', Assets.smartTV, '_smartTvAnimationController', false, true],
  ['Speaker', Assets.computerSpeaker, '_computerSpeakerAnimationController', false, false],
  ['Echo Speaker', Assets.echoSpeaker, '_echoSpeakerAnimationController', false, false],
  ['Coffee Machine', Assets.coffeeMachine, 'coffeeMachineAnimationController', false, false],
  ['Electric Teapot', Assets.electricTeapot, '_electricTeapotAnimationController', false, false],
  ['Lava Lamp', Assets.lavaLamp, '_lavaLampAnimationController', false, false],
  ['Smart Door', Assets.windowsShutters, '_windowsShuttersAnimationController', false, true],
  ['Solar Panel', Assets.solarPanel, '_solarPanelAnimationController', false, false],
  ['Wifi Router', Assets.wifi, '_wifiAnimationController', false, false],
  ['Server', Assets.server, '_serverAnimationController', false, false],
  ['Sigle Type E', Assets.singleTypeE, '_singleTypeEAnimationController', false, false],
  ['Eye', Assets.eye, '_eyeAnimationController', false, true],
  ['Camera' , Assets.camera, '_cameraAnimationController', false, true],
];
