# landing_page

A new Jaspr project

## Running the project

Run your project using `jaspr serve`.

The development server will be available on `http://localhost:8080`.

## Building the project

Build your project using `jaspr build`.

The output will be located inside the `build/jaspr/` directory.


🚀 Jaspr + Tailwind CSS (Latest Version) Setup Guide
1️⃣ Create a new Jaspr project
Bash

Copy code
dart pub global activate jaspr_cli
jaspr create my_site
cd my_site
2️⃣ Install Tailwind CSS with CLI
⚠ Critical Step — Without tailwindcss-cli, the tailwindcss command will not work.

Bash

Copy code
npm init -y
npm install -D tailwindcss tailwindcss-cli postcss autoprefixer
3️⃣ Initialize Tailwind
Bash

Copy code
npx tailwindcss init
4️⃣ Configure Tailwind
Edit tailwind.config.js:

Js

Copy code
module.exports = {
  content: [
    './web/**/*.html',
    './lib/**/*.dart', // Scan Jaspr components for Tailwind classes
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
5️⃣ Create Tailwind entry CSS
web/styles/tailwind.css:

Css

Copy code
@tailwind base;
@tailwind components;
@tailwind utilities;
6️⃣ Link Tailwind output in HTML
Edit web/index.html:

Html

Copy code
<link rel="stylesheet" href="styles/output.css">
7️⃣ Add npm scripts
In package.json:

Json

Copy code
"scripts": {
  "dev:css": "npx tailwindcss -i ./web/styles/tailwind.css -o ./web/styles/output.css --watch",
  "build:css": "npx tailwindcss -i ./web/styles/tailwind.css -o ./web/styles/output.css --minify"
}
8️⃣ Example Jaspr component using Tailwind
lib/components/home.dart:

Dart

Copy code
import 'package:jaspr/jaspr.dart';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'min-h-screen flex items-center justify-center bg-gray-100') {
      yield h1(classes: 'text-4xl font-bold text-blue-600') {
        text('Hello from Jaspr + Tailwind CSS!');
      };
    };
  }
}
9️⃣ Run Tailwind and Jaspr
In two terminals:

Terminal 1:

Bash

Copy code
jaspr serve
Terminal 2:

Bash

Copy code
npm run dev:css
🔟 (Optional) Run both together
Install concurrently:

Bash

Copy code
npm install -D concurrently
Update package.json:

Json

Copy code
"scripts": {
  "dev": "concurrently \"jaspr serve\" \"npm run dev:css\""
}
Run:

Bash

Copy code
npm run dev
✅ You’re done!
This setup:

Uses the latest Jaspr API
Installs tailwindcss-cli so the CLI command always works
Works on Windows, macOS, and Linux
Supports hot reload for both Jaspr and Tailwind