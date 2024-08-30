import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class AppTheme {
  static Color primary = HexColor('09FBD3');

  static Color secondary = HexColor('B6116B');

  static Color background = HexColor('2E1371');

  static Color tertiary = HexColor('FE53BB');

  static Color shadowColor = HexColor('21232F');

  static Color darkColor = HexColor('130B2B');

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    //? botton Navigate Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(22, 255, 255, 255),
        elevation: 1,
        unselectedIconTheme: IconThemeData(size: 40),
        selectedIconTheme: IconThemeData(size: 40)),
    //? TextFormField decoration
    inputDecorationTheme: InputDecorationTheme(
      helperMaxLines: 1,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
    ),
  );

  static BoxDecoration backgoundDecoration = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage('lib/core/assets/background.jpg'), fit: BoxFit.cover),
  );

  static TextStyle stayConnected = const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        color: Colors.black,
        offset: Offset(1, 1),
        blurRadius: 1,
      ),
    ],
  );

  static TextStyle titlePoster = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    shadows: [
      Shadow(
        color: Colors.black,
        offset: Offset(3, 3),
        blurRadius: 5,
      )
    ],
  );

  static TextStyle titleCollection = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 22,
    shadows: [
      Shadow(
        color: Colors.black,
        offset: Offset(3, 3),
        blurRadius: 5,
      )
    ],
  );

  static TextStyle titleMoviePage = const TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        blurRadius: 5,
        offset: Offset(5, 5),
        color: Colors.black,
      ),
      Shadow(
        blurRadius: 10,
        offset: Offset(1, 1),
        color: Colors.black,
      ),
    ],
  );

  static TextStyle premiseMovie = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 13,
    shadows: [
      Shadow(
        blurRadius: 5,
        offset: Offset(5, 5),
        color: Colors.black,
      ),
      Shadow(
        blurRadius: 10,
        offset: Offset(1, 1),
        color: Colors.black,
      ),
    ],
  );

  static BoxDecoration dataComponent = BoxDecoration(
    border: GradientBoxBorder(
      gradient: LinearGradient(
        colors: [primary, darkColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(16),
    color: darkColor,
    boxShadow: [
      BoxShadow(
        color: primary,
        blurRadius: 4,
        offset: const Offset(1, 1),
      ),
      BoxShadow(
        color: darkColor,
        blurRadius: 4,
        offset: const Offset(-1, -1),
      ),
    ],
  );

  static BoxDecoration dataComponentSelect = BoxDecoration(
    border: GradientBoxBorder(
      gradient: LinearGradient(
        colors: [secondary, darkColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(16),
    //color: darkColor,
    gradient: LinearGradient(
      colors: [secondary, darkColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    boxShadow: [
      BoxShadow(
        color: darkColor,
        blurRadius: 4,
        offset: const Offset(4, 8),
      ),
      BoxShadow(
        color: secondary,
        blurRadius: 4,
        offset: const Offset(-4, -3),
      ),
    ],
  );

  static TextStyle dataTimeDisplay = const TextStyle(
    fontSize: 25,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        color: Colors.black,
        blurRadius: 10,
        offset: Offset(1, 1),
      ),
    ],
  );

  static BoxDecoration styleButton = BoxDecoration(
    border: GradientBoxBorder(
      gradient: LinearGradient(
        colors: [secondary, darkColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(16),
    //color: darkColor,
    gradient: LinearGradient(
      colors: [secondary, darkColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    boxShadow: [
      BoxShadow(
        color: darkColor,
        blurRadius: 4,
        offset: const Offset(4, 8),
      ),
      BoxShadow(
        color: secondary,
        blurRadius: 4,
        offset: const Offset(-4, -3),
      ),
    ],
  );

  static TextStyle subtitleSeat = const TextStyle(
    fontSize: 15,
    color: Colors.white,
    shadows: [
      Shadow(
        blurRadius: 5,
        color: Colors.black,
        offset: Offset(2, 2),
      ),
    ],
  );

  static TextStyle seatInfoStyle = const TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        blurRadius: 5,
        color: Colors.black,
        offset: Offset(2, 2),
      )
    ],
  );

  static TextStyle tickt = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}
