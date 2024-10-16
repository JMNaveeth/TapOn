import 'package:flutter/material.dart';
import 'package:tap_on/Enter verification page.dart';
import 'package:tap_on/Home%20page.dart';
import 'package:tap_on/constants.dart';


class Enternumber extends StatefulWidget {
  const Enternumber({super.key});

  @override
  _EnternumberState createState() => _EnternumberState();
}


class _EnternumberState extends State<Enternumber> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  String? validatePhoneNumber(String? value) {
    // Check if the number starts with 0 and is followed by 9 digits
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (!RegExp(r'^0\d{9}$').hasMatch(value)) {
      return 'Please enter a valid Sri Lankan phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/image02.jpeg',
                height: height * 0.50,
                width: width,
                fit: BoxFit.cover,
              ),
              Container(
                height: height * 0.50,
                width: width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.white],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    appName,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    slogan,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: "Enter your Number",
                        ),
                        keyboardType: TextInputType.phone,
                        validator: validatePhoneNumber,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Optionally show a loading indicator here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerificationScreen(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
