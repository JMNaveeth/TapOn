import 'package:flutter/material.dart';
import 'package:tap_on/Home%20page.dart';
import 'package:tap_on/Service_Provider/SP_Dashboard.dart';
import 'package:tap_on/Service_Provider/SP_ForgotPassword.dart';

import 'package:tap_on/Service_Provider/SP_Register.dart';

class SP_Login extends StatelessWidget {
  const SP_Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          title: const Text('TapOn'),
          backgroundColor: Colors.amber[700],
          elevation: 0,
            leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            // Action when the button is pressed
          },
        ),

        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40), // Space between logo and text fields

              // Mobile number or email field
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile number or email',
                ),
              ),
              SizedBox(height: 20),

              // Password field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20),

              // Log in button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SP_Dashboard()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[700],
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Log in'),
              ),
              SizedBox(height: 10),

              // Forgot password text
              Center(
                child: TextButton(
                   onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SP_ForgotPassword()));
                },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.amber[700],
                    ),
                  ),
                ),
              ),

              Spacer(), // Push the "Create new account" button to the bottom

              // Create new account button
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SP_Register()));
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  side: BorderSide(color: Colors.amber),
                ),
                child: Text('Register as Service Provider'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
