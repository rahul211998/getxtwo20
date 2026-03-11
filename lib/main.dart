import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:getxprofirst/screens/connectivityplusfolder/show_available_network.dart';
import 'package:getxprofirst/screens/countryCodePicker/country_code_picker_screen.dart';
import 'package:getxprofirst/screens/filepickerfolder/file_picker_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:getxprofirst/screens/imagepickerfolder/image_picker_screen.dart';
import 'package:getxprofirst/screens/userApiScreen/users_api_screen.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 final app = await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

print("🔥 Firebase Project ID: ${app.options.projectId}");
  print("best");
  print("best github");
  int ts = 100;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        supportedLocales: [
    Locale("en"),
    Locale("hi"),
    // you don’t actually need to manually list all 70+ unless required
  ],
  localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    CountryLocalizations.delegate,
  ],
      home: UsersApiScreen(),
      // ImagePickerScreen()
      // CountryCodePickerScreen()
      // ShowAvailableNetwork()
      // FilePickerScreen()
    );
  }
}
