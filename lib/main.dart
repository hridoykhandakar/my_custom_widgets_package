import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_custom_widgets_package/features/file_upload/screen/file_upload_screen.dart';
import 'package:my_custom_widgets_package/features/file_upload/screen/language_select_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('es')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      startLocale: Locale('es'), // Optional: force start locale
      saveLocale: true, // Save selected locale
      useOnlyLangCode: true,
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Scaffold(
        body: LanguageSelectionPage(),
        // body: Column(children: [FileUploadScreen(), ]),
      ),
    );
  }
}
