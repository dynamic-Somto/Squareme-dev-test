import 'package:bayfront/view/index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data/services/notification/index.dart';
import 'di/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await init();

  // PushNotificationService().createChannel();
  // PushNotificationService().setNotifications();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const Index());
  });
}
