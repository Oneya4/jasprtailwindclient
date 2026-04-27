import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class AboutPage extends StatelessComponent {
  const AboutPage({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: "text-center", [.text("About")]);
  }
}
