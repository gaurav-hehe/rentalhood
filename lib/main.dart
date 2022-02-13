import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'package:rental_hood_1/login_page/login_page_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'home_page/home_page_widget.dart';
import 'favourites_page/favourites_page_widget.dart';
import 'post_ad_page/post_ad_page_widget.dart';
import 'messages_page/messages_page_widget.dart';
import 'more_options_page/more_options_page_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = ThemeMode.system;
  Stream<RentalHood1FirebaseUser> userStream;
  RentalHood1FirebaseUser initialUser;
  bool displaySplashImage = true;
  final authUserSub = authenticatedUserStream.listen((_) {});

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  void initState() {
    super.initState();
    userStream = rentalHood1FirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RentalHood 1',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : LoginPageWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'HomePage';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': HomePageWidget(),
      'FavouritesPage': FavouritesPageWidget(),
      'PostAdPage': PostAdPageWidget(),
      'MessagesPage': MessagesPageWidget(),
      'MoreOptionsPage': MoreOptionsPageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: Colors.white,
        selectedItemColor: FlutterFlowTheme.of(context).secondaryColor,
        unselectedItemColor: Color(0xFF616161),
        selectedBackgroundColor: FlutterFlowTheme.of(context).primaryColor,
        borderRadius: 8,
        itemBorderRadius: 10,
        margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
        width: MediaQuery.of(context).size.width * 1,
        elevation: 5,
        items: [
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 0 ? Icons.home : Icons.home_outlined,
                  color: currentIndex == 0
                      ? FlutterFlowTheme.of(context).secondaryColor
                      : Color(0xFF616161),
                  size: 24,
                ),
                Text(
                  'Home',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 0
                        ? FlutterFlowTheme.of(context).secondaryColor
                        : Color(0xFF616161),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 1 ? Icons.favorite : Icons.favorite_border,
                  color: currentIndex == 1
                      ? FlutterFlowTheme.of(context).secondaryColor
                      : Color(0xFF616161),
                  size: 24,
                ),
                Text(
                  'Favourites',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 1
                        ? FlutterFlowTheme.of(context).secondaryColor
                        : Color(0xFF616161),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 2 ? Icons.file_upload : Icons.upload_outlined,
                  color: currentIndex == 2
                      ? FlutterFlowTheme.of(context).secondaryColor
                      : Color(0xFF616161),
                  size: 24,
                ),
                Text(
                  'Post Ad',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 2
                        ? FlutterFlowTheme.of(context).secondaryColor
                        : Color(0xFF616161),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 3
                      ? Icons.chat_bubble_rounded
                      : Icons.chat_bubble_outline,
                  color: currentIndex == 3
                      ? FlutterFlowTheme.of(context).secondaryColor
                      : Color(0xFF616161),
                  size: 24,
                ),
                Text(
                  'Chats',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 3
                        ? FlutterFlowTheme.of(context).secondaryColor
                        : Color(0xFF616161),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 4 ? Icons.settings : Icons.settings,
                  color: currentIndex == 4
                      ? FlutterFlowTheme.of(context).secondaryColor
                      : Color(0xFF616161),
                  size: 24,
                ),
                Text(
                  'More',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 4
                        ? FlutterFlowTheme.of(context).secondaryColor
                        : Color(0xFF616161),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
