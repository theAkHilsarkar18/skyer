import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skyer/theme/animation_style.dart';
import 'package:skyer/theme/theme_data_file.dart';
import 'package:skyer/utils/colors.dart';
import 'package:skyer/utils/routes_file.dart';
import 'package:skyer/view/home/home_screen.dart';
import 'package:skyer/view/navigation%20bar/nav_bar_provider.dart';
import 'package:skyer/view/navigation%20bar/nav_bar_screen.dart';
import 'package:skyer/view/notification/provider/notification_provider.dart';
import 'package:skyer/view/post%20view/post_view.dart';
import 'package:skyer/view/profile/profile_screen.dart';
import 'package:skyer/view/search/search_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const SkyerApp());
}

class SkyerApp extends StatelessWidget {
  const SkyerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NavBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationProvider(),
        )
      ],
      child: MaterialApp(
        themeAnimationStyle: buildAnimationStyle(),
        theme: buildThemeData(),
        title: 'Skyer',
        debugShowCheckedModeBanner: false,
        routes: ScreenRoutes.routes,
      ),
    );
  }
}
