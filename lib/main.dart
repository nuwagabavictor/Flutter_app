import 'package:flutter/material.dart';

//import the login, dashbord and register pages
//imports dasshboard page
import 'package:pocketbank/pages/dashboard.dart';
//imports login page
import 'package:pocketbank/pages/register.dart';
//imports register page
import 'package:pocketbank/pages/login.dart';


void main() {
  runApp( const PocketBankApp());// starts the pocket bank app
}

class PocketBankApp extends StatelessWidget {
  const PocketBankApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket banking',//app title


      //defining theme for the app
      theme: ThemeData(
        primaryColor: Colors.teal,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
        ).copyWith(
          secondary: Colors.tealAccent,
        ),

        //defining text themes for the app
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 24, color: Colors.teal),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
        ),

        //defining default button style for all buttons
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.teal,
          textTheme: ButtonTextTheme.primary,
        ),

        //styling for modern buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal
          ),
        ),
      ),

        //defining dark theme for the app
        darkTheme: ThemeData.dark(). copyWith(
          primaryColor: Colors.teal,

          // defining color sheme for dark mode
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.teal,
          ). copyWith(
            secondary: Colors.tealAccent,
          ),
          
          //defining text themes for dark theme
          textTheme: const TextTheme(
            headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.tealAccent),
            bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
          ),

          //styling for elevated buttons in darkmode
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
            ),
          ),
        ),

        //setting app automatically to switch btn light and dark
        themeMode: ThemeMode.system,

        //defining initial route of the app which is the login
        initialRoute: '/',

        //defining routes of navigation between different pages
        routes: {
          '/': (context) =>  const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/dashboard': (context) => const DashboardPage(),
        },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

  

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
      
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
          
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
