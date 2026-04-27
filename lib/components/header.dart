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

  List<({String title, String path})> destinations = [
    (title: "Home", path: "/"),
    (title: "About", path: "/about"),
  ];

  @override
  Component build(BuildContext context) {
    var activePath = RouteState.of(context).location;
    ;
    return header(
      classes:
          "fixed top-0 left-0 right-0 z-50 bg-white/80 dark:bg-slate-900/80 backdrop-blur-md shadow-sm shadow-slate-200/50 dark:shadow-none",
      [
        div(classes: "flex justify-between items-center w-full px-6 py-4 max-w-7xl mx-auto", [
          div(classes: "text-xl font-extrabold tracking-tighter text-red-700 dark:text-red-500 font-headline", [
            .text("Template"),
          ]),
          nav(classes: "hidden md:flex items-center gap-8", [
            for (var destination in destinations)
              switch (destination.path == activePath) {
                true => div(
                  classes:
                      "cursor-pointer text-red-700 dark:text-red-400 font-bold border-b-2 border-red-600 font-manrope font-semibold text-sm tracking-tight transition-colors duration-200",
                  [.text(destination.title)],
                ),
                false => Link(
                  to: destination.path,
                  child: div(
                    classes:
                        "text-slate-600 dark:text-slate-400 font-medium font-manrope font-semibold text-sm tracking-tight hover:text-red-600 dark:hover:text-red-400 transition-colors duration-200",
                    [.text(destination.title)],
                  ),
                ),
              },
          ]),
        ]),
      ],
    );
  }
}
