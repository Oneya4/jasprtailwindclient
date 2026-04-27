import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class Header extends StatefulComponent {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool _isMenuOpen = false;

  void _toggleMenu() {
    setState(() => _isMenuOpen = !_isMenuOpen);
  }

  @override
  Component build(BuildContext context) {
    var activePath = RouteState.of(context).location;

    return header(
      classes: 'bg-white shadow-md',
      [
        div(classes: 'max-w-7xl mx-auto px-4 sm:px-6 lg:px-8', [
          div(classes: 'flex justify-between items-center h-16', [
            // Logo
            Link(
              to: '/',
              child: div(classes: 'flex items-center', [
                img(
                  src: "",
                  alt: 'Logo',
                  classes: 'h-8 w-8 mr-2',
                ),
                span(
                  classes: 'font-bold text-xl text-gray-900',
                  [.text("Template")],
                ),
              ]),
            ),
            // Mobile menu button
            div(classes: 'md:hidden', [
              button(
                classes:
                    'text-gray-600 hover:text-gray-900 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500',
                events: {'click': (e) => _toggleMenu()},
                [
                  span(classes: 'sr-only', [.text('Open main menu')]),
                  // Hamburger icon
                  svg(
                    classes: 'h-6 w-6',
                    attributes: {
                      'fill': 'none',
                      'viewBox': '0 0 24 24',
                      'stroke': 'currentColor',
                      'aria-hidden': 'true',
                    },
                    [],
                  ),
                ],
              ),
            ]),
            // Desktop navigation
            nav(classes: 'hidden md:flex space-x-4', [
              for (var entry in [])
                Link(
                  to: entry.value,
                  child: div(
                    classes:
                        'px-3 py-2 rounded-md text-sm font-medium ${activePath == entry.value ? ('bg-gray-200 text-gray-900') : ('text-gray-700 hover:text-gray-900')}',
                    [.text(entry.key)],
                  ),
                ),
            ]),
            // Theme toggle button
            button(
              classes: 'ml-4 p-2 rounded-md bg-gray-200 text-gray-800',
              // events: {
              //   'click': (e) => themeState.toggleTheme(!themeState.isDarkMode),
              // },
              [
                .text("🌙"),
                // .text(themeState.isDarkMode ? '☀️' : '🌙'),
              ],
            ),
          ]),
        ]),
        // Mobile navigation
        div(classes: 'md:hidden ${_isMenuOpen ? '' : 'hidden'}', [
          div(classes: 'px-2 pt-2 pb-3 space-y-1 sm:px-3', [
            for (var entry in navLinks)
              Link(
                to: entry.path,
                child: div(
                  classes:
                      'block px-3 py-2 rounded-md text-base font-medium ${activePath == entry.path ? ('bg-gray-200 text-gray-900') : ('text-gray-700 hover:text-gray-900')}',
                  [.text(entry.title)],
                ),
              ),
          ]),
        ]),
      ],
    );
  }
}

List<({String title, String path})> navLinks = [];
