import 'package:flutter/material.dart';

// main entry point of pockect bank
void main(){
  runApp(const PocketBankApp());
}
//pocketbankapp class defines the structure and behavior of the app
class PocketBankApp extends StatelessWidget {
  const PocketBankApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket banking',//app title


      //defining theme for the app
      theme: ThemeData(
        primaryColor: Colors.teal, // teal as the primary color for app theme
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,// color scheme uses teal as base color
        ).copyWith(
          secondary: Colors.tealAccent, // accent color set to teal accent
        ),

        //defining text themes for the app
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black), //body text style
        ),

        //defining default button style for all buttons
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.teal, // teal color for buttons
          textTheme: ButtonTextTheme.primary,
        ),

        //styling for modern buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal //elevated button color
          ),
        ),
      ),
      home: const DashboardPage(), // set the homescreen to dashboard page
    );
  }
}  

// dashboard page defines the main screenwith the grid and bottom navigation bar
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

   @override
   DashboardPageState createState() => DashboardPageState();
}
class DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;  // keeps track off the selected tab in the bottom navigation

  // list of pages to switch between in the dashboard page
   final List<Widget> _pages = <Widget>[
    const DashboardGrid(), //grid view for dashboard items
    const Center(child: Text('Savings Page')),
    const Center(child: Text('Loan Page')),
    const Center(child: Text('Account Page')),
   ];

   // handler for tapping a navigation item
   void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
   }

   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pocket wallet'), // appbar title
          backgroundColor: Colors.teal,
        ),

        body: _pages[_selectedIndex], //display selected page in grid 
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex, //current selected index
          onTap: _onItemTapped, // tap handler
          selectedItemColor: Colors.teal,// selected item color
          unselectedItemColor: Colors.grey, // unselected item color
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.savings), label: 'Svings'),
            BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Loan'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
          ],
        ),
      ),
    );
  }
}

//dashboard grid is the grid layout on the main screen
class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.count(
        crossAxisCount: 3, // three columns in the grid
        shrinkWrap: true, //shrinks the grid size to fit in its content
        physics: const NeverScrollableScrollPhysics(), // prevents idependent scrolling
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0), //padding around the grid
        crossAxisSpacing: 12.0, //horizontal spce between grid items
        mainAxisSpacing: 16.0, //vertical spce between grid items
        children: <Widget>[
          _buildDashboardItem(context, Icons.send, 'Send Money', '/sendmoney'),
          _buildDashboardItem(context, Icons.payment, 'Pay Bills', '/paybills'),
          _buildDashboardItem(context, Icons.phone, 'Buy Airtime', '/buyairtime'),
          _buildDashboardItem(context, Icons.attach_money, 'Withdraw', '/withdraw'),
          _buildDashboardItem(context, Icons.sync_alt, 'Bank Transfer', '/banktransfer'),
          _buildDashboardItem(context, Icons.account_balance_wallet, 'Deposit', '/deposit'),
        ],
      ),
    );
  }
  

  //builds a single dashboard item (icon + text)
  Widget _buildDashboardItem(BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () {
      Navigator.pushNamed(context, route); // navigating to corresponding route
    },

      child: Card(
        color: Colors.white,
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)), // rounded card shape
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // center all content vertically
          children: <Widget>[
            Icon(icon, size: 36.0, color: Colors.teal), // icon for grid item
            const SizedBox(height: 8.0), // space between icon and text
            Text(label, style: const TextStyle(fontSize: 12.0, color: Colors.teal)), // label below icon
          ],
        ),
      ),
    );
  }
}
