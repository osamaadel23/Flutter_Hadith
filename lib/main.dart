import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './widgets/SplashScreen.dart';
import './screens/home_screen.dart';
import './screens/books_screen.dart';
import './screens/about_us_screen.dart';
import './screens/hadith_content_screen.dart';
import './screens/hadith_types_screen.dart';
import './screens/quizes_screen.dart';
import './screens/rosary_screen.dart';
import './screens/favorites_screen.dart';
import './screens/search_results_screen.dart';
import './screens/hadithes_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'جامع الأحاديث',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale('ar')],
      theme: ThemeData(
        // primaryColor: Color(0xFF121c16),
        primaryColor: Color(0xFF121b15),
        accentColor: Colors.amber,
        // canvasColor: Color(0xFFece88c),
        // canvasColor: Color(0xFFeceab2),
        canvasColor: Color(0xFFfbf9cf),
      ),
      // home: HomeScreen(),
      home: SearchResultsScreen(),
      // initialRoute: '/',
      routes: {
        // '/': (ctx) => SplashScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        BooksScreen.routeName: (ctx) => BooksScreen(),
        AboutUsScreen.routeName: (ctx) => AboutUsScreen(),
        HadithContentScreen.routeName: (ctx) => HadithContentScreen(),
        HadithTypesScreen.routeName: (ctx) => HadithTypesScreen(),
        QuizesScreen.routeName: (ctx) => QuizesScreen(),
        RosaryScreen.routeName: (ctx) => RosaryScreen(),
        FavoritesScreen.routeName: (ctx) => FavoritesScreen(),
        SearchResultsScreen.routeName: (ctx) => SearchResultsScreen(),
        HadithesListScreen.routeName: (ctx) => HadithesListScreen(),
      },
    );
  }
}
