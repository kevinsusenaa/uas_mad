part of 'shared.dart';

class MyTheme{

  static ThemeData lightTheme(){
    return ThemeData(
      primarySwatch: Colors.blue,
      backgroundColor: Color(0xFFffffff),
      scaffoldBackgroundColor: Color(0xFFffffff),
      primaryColor: Colors.lightBlue,
      accentColor:Colors.lightBlue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.lato().fontFamily,
      

    );

  }
  static ThemeData darkTheme(){
    return ThemeData(
      primarySwatch: Colors.blue,
      backgroundColor: Color(0xFF262626),
      scaffoldBackgroundColor: Color(0xFF262626),
      primaryColor: Colors.lightBlue,
      accentColor:Colors.lightBlue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.lato().fontFamily,
      

    );

  }

  }
   
