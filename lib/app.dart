import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'pages/home.dart';
import 'pages/about.dart';
import 'components/header.dart';
import 'components/footer.dart';
import 'state/theme_state.dart';

class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isDarkMode = true;

  void _toggleTheme(bool value) {
    setState(() => _isDarkMode = value);
  }

  @override
  Component build(BuildContext context) {
    return ThemeState(
      isDarkMode: _isDarkMode,
      toggleTheme: _toggleTheme,
      child: div([
        Router(
          routes: [
            ShellRoute(
              builder: (context, state, child) {
                return .fragment([
                  div(classes: 'fixed top-0 left-0 right-0 z-10', [
                    const Header(),
                  ]),
                  div(classes: 'grow pt-24', [child]),
                  const Footer(),
                ]);
              },
              routes: [
                Route(
                  path: '/',
                  title: 'Home',
                  builder: (context, state) => const HomePage(),
                ),
                Route(
                  path: '/about',
                  title: 'About',
                  builder: (context, state) => const AboutPage(),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
