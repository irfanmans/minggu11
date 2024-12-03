// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Localization extends StatefulWidget {
  const Localization({super.key});

  @override
  State<Localization> createState() => _LocalizationState();
}

class _LocalizationState extends State<Localization> {
  Locale _currentLocale = const Locale('en'); // Default locale
  Map<String, String> _localizedStrings = {}; // Map untuk menyimpan terjemahan

  // Memuat file JSON berdasarkan locale yang dipilih
  Future<void> _loadLocale(String locale) async {
    String jsonString = await rootBundle.loadString('lib/lang/$locale.json');
    setState(() {
      _localizedStrings = Map<String, String>.from(json.decode(jsonString));
    });
  }

  // Fungsi untuk mengubah bahasa
  void _changeLanguage(Locale locale) {
    setState(() {
      _currentLocale = locale;
    });
    _loadLocale(locale
        .languageCode); // Muat terjemahan sesuai dengan locale yang dipilih
  }

  @override
  void initState() {
    super.initState();
    _loadLocale(
        _currentLocale.languageCode); // Muat locale default (misalnya 'en')
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale:
          _currentLocale, // Set locale aplikasi berdasarkan pilihan pengguna
      supportedLocales: const [
        Locale('en', 'US'), // Bahasa Inggris
        Locale('id', 'ID'), // Bahasa Indonesia
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            _localizedStrings['title'] ?? 'Welcome', // Gunakan terjemahan
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _localizedStrings['title'] ?? 'Welcome', // Gunakan terjemahan
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  _localizedStrings['description'] ??
                      'This application helps users interact with various features seamlessly. Enjoy your time and explore!',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _changeLanguage(const Locale('en', 'US')),
                  child: const Text('English'),
                ),
                ElevatedButton(
                  onPressed: () => _changeLanguage(const Locale('id', 'ID')),
                  child: const Text('Bahasa Indonesia'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const Localization());
}
