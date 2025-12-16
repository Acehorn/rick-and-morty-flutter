import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rickmortyproject/features/characters/domain/entities/character.dart';
import 'package:rickmortyproject/features/characters/presentation/pages/characters_detail_page.dart';
import 'features/characters/presentation/pages/characters_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<int>('favorites');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CharactersPage(),
    routes: {
  '/detail': (context) {
    final character =
        ModalRoute.of(context)!.settings.arguments as Character;

    return CharacterDetailPage(character: character);
  },
},

    );
  }
}
