import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: "bg-slate-50 dark:bg-slate-950 rounded-t-3xl mt-12 text-center", [
      div(classes: "grid grid-cols-1 md:grid-cols-4 gap-12 px-8 py-16 max-w-7xl mx-auto", [
        div(classes: "text-lg font-bold text-slate-900 dark:text-slate-100 mb-6 font-headline", [
          .text("Company Name"),
          p(classes: "text-slate-500 dark:text-slate-400 font-manrope text-sm leading-relaxed mb-6", [
            .text("Company Tagline"),
          ]),
          div(classes: "flex gap-4", [
            a(
              href: "mailto:mycompany.com",
              classes: "text-slate-400 hover:text-red-600 transition-all",
              [
                span(classes: "material-symbols-outlined", [.text("mail")]),
              ],
            ),
          ]),
        ]),
        div([
          h4(classes: "font-bold mb-6 text-sm uppercase tracking-widest text-on-surface", [
            .text("Quick Links"),
          ]),
          ul(classes: "space-y-4", [
            for (var quick in quickLinks)
              li([
                a(
                  href: quick.link,
                  classes:
                      "text-slate-500 dark:text-slate-400 font-manrope text-sm hover:text-red-600 dark:hover:text-red-400 transition-all",
                  [.text(quick.title)],
                ),
              ]),
          ]),
        ]),
        div([
          h4(classes: "font-bold mb-6 text-sm uppercase tracking-widest text-on-surface", [
            .text("Legal"),
          ]),
          ul(classes: "space-y-4", [
            for (var legal in legals)
              li([
                a(
                  href: legal.link,
                  classes:
                      "text-slate-500 dark:text-slate-400 font-manrope text-sm hover:text-red-600 dark:hover:text-red-400 transition-all",
                  [.text(legal.title)],
                ),
              ]),
          ]),
        ]),
        div([
          h4(classes: "font-bold mb-6 text-sm uppercase tracking-widest text-on-surface", [
            .text("Newsletter"),
          ]),
          p(classes: "text-slate-500 dark:text-slate-400 text-sm mb-4", [
            .text("Stay updated."),
          ]),
          div(classes: "flex gap-2", [
            input(
              type: .email,
              classes:
                  "bg-white dark:bg-slate-900 border-none rounded-lg text-sm w-full focus:ring-2 focus:ring-primary/20",
            ),
            button(classes: "bg-primary-container text-on-primary px-4 py-2 rounded-lg", [
              span(classes: "material-symbols-outlined", [.text("send")]),
            ]),
          ]),
        ]),
      ]),
      div(
        classes:
            "border-t border-slate-200 dark:border-slate-800 py-8 px-8 max-w-7xl mx-auto flex flex-col md:flex-row justify-between items-center gap-4",
        [
          p(classes: "text-slate-500 dark:text-slate-400 font-manrope text-sm", [
            .text("Company name"),
          ]),
          div(classes: "flex gap-8", [
            a(href: "", classes: "text-red-700 dark:text-red-400 underline font-manrope text-sm", [
              .text("English"),
            ]),
            a(href: "", classes: "text-slate-500 dark:text-slate-400 font-manrope text-sm", [
              .text("Français"),
            ]),
          ]),
        ],
      ),
    ]);
  }
}

List<({String title, String link})> quickLinks = [
  (title: "Option 1", link: ""),
  (title: "Option 2", link: ""),
  (title: "Option 3", link: ""),
  (title: "Option 4", link: ""),
  (title: "Option 5", link: ""),
];

List<({String title, String link})> legals = [
  (title: "Privacy Policy", link: ""),
  (title: "Terms of Service", link: ""),
];
