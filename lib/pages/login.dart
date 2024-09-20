import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //scaffold provides a basic layout structure for the app
      appBar: AppBar(
        //app bar is the top bar of the screen, usually containing a title or actions
        title: const Text(
          'Login to Wallet',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),

      //the body of the page is wrapped in padding for spacing
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        //column widget arranges its children vertically

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,// center aligns all the content
          children: <Widget>[
            // a text widget to display the title on top of form
            Text(
              'Login',
              style: Theme.of(context).textTheme.headlineMedium, // uses a predefined text style from the app,s theme
            ),

            //sizedbox adds a vertical gapof 20 pixelsbetween the text and next element
            const SizedBox(height: 20),

            //textfield widget that allows user to input email
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email', //placeholder for email

                //adding a black border around input field
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),// sets border to black
                ),
                
                //when the textfield is focussed, border turns black
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // sets focused border color to black
                ),
              ),
            ),

            //another sized box for spacing 10px btn email and password

           const SizedBox(height: 10),

            //another textfield widget for password

            const TextField(
              obscureText: true, // hides password characters
              decoration: InputDecoration(
                labelText: 'Password', // placeholder for password

                //adding border around the input field
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), //sets border to black
                ),
                
                // when focussed, border will also be black
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),// black border when the field is focussed
                ),
              ),
            ),

            //sized box for spacing between passord and button

           const SizedBox(height: 20),

            //elevated button is a clickable button that performs an action when clicked

            ElevatedButton(
              onPressed: (){
                //after presing login in button, navigate to dashboard page
                //navigator.pushreplacementnamed replaces the current page with dashboard

                Navigator.pushReplacementNamed(context, '/dashboard'); // go to login page when user registers
              },

              //styling the button: background color is teal and text color is black
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // teal button background
                foregroundColor: Colors.black, //black text on the button
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),  // Increase button size by padding
              ),

              // text shown in the button
              child: const Text('Login'),
            ),

              //sizedbox adds vertical spce between login button and text button
              const SizedBox(height: 10),

              //textbutton is a clickeble text that navigates to register page

              TextButton(
                onPressed: (){
                  //navigating to register when the text button is clicked
                  Navigator.pushNamed(context, '/register');
                },

                //styling text button
                style: TextButton.styleFrom(
                  foregroundColor: Colors.teal,
                ),

                 // the text inside the button
                child: const Text('Dont have an account, Register Here'),
              ),
          ],
        ),
      ),
    );
  }
}
