import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatelessWidget {
  final List<Map<String, String>> languages = [
    {'code': 'en', 'name': 'English'},

    {'code': 'es', 'name': 'Español'},
  ];

  LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('language'.tr())),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          final lang = languages[index];
          final isSelected = context.locale.languageCode == lang['code'];

          return ListTile(
            title: Text(lang['name']!),
            trailing: isSelected ? Icon(Icons.check, color: Colors.blue) : null,
            selected: isSelected,
            onTap: () async {
              await context.setLocale(Locale(lang['code']!));
            },
          );
        },
      ),
    );
  }
}
