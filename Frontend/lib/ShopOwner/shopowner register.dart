import 'package:flutter/material.dart';
import 'package:tap_on/ShopOwner/ShopOwnerDashboard.dart';
import 'package:http/http.dart'
    as http; // Import the HTTP package for backend communication.
import 'dart:convert'; // For JSON encoding/decoding.

class ShopOwnerRegistration extends StatefulWidget {
  const ShopOwnerRegistration({super.key});

  @override
  _ShopOwnerRegistrationState createState() => _ShopOwnerRegistrationState();
}

class _ShopOwnerRegistrationState extends State<ShopOwnerRegistration> {
  // Create controllers for each TextField
  final TextEditingController nameController = TextEditingController();
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  List<String> genderOptions = [
    "Colombo",
    "Trincomalee",
    "Batticaloa",
    "Kandy",
    "Jaffna"
  ];
  String selectedGender = "";
  final TextEditingController locationController = TextEditingController();

  bool isAgreed = false; // Track if the user has agreed to the terms
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  String? selectedCategory; // Variable to hold the selected category

  // List of categories for the dropdown
  final List<String> categories = [
    'Plumbing Tools',
    'Electrical Tools',
    'Carpenting Tools',
    'Painting Tools',
    'Gardening Tools',
    'Repairing Tools',
    'Building Tools',
    'Phone Accessories',
    'Other',
  ];

  // Function to handle the submission of form data
  Future<void> registerOwner() async {
    if (_formKey.currentState!.validate() && isAgreed) {
      // Prepare the data for submission
      Map<String, String> shopownerData = {
        'name': nameController.text,
        'shop_name': shopNameController.text,
        'phone': phoneController.text,
        'address': addressController.text,
        'location': selectedGender,
        'email': emailController.text,
        'category': selectedCategory ?? '', // Add category to the data
      };

      try {
        // Send POST request to backend with user data
        var response = await http.post(
          Uri.parse('http://localhost:3000/shopregistration'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(shopownerData),
        );
 
        if (response.statusCode == 200) {
          // Successfully saved data to MongoDB, navigate to the dashboard
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShopdashboardPage(),
            ),
          );
          print('Shopowner Details successfully Registered ');
        } else {
          // Handle error from the backend
          print('Failed to save data. Status code: ${response.statusCode}');
        }
      } catch (error) {
        print('Error occurred while submitting data: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text(
          'Registration Form For Shop Owner',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Assign the form key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: shopNameController,
                  decoration: const InputDecoration(
                    labelText: 'Shop Name',
                    hintText: 'Enter your shop name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your shop name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Enter your phone number',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    hintText: 'Enter your address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

// Location Input Field with Icon

                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                    labelText: "Select Your Location",
                    labelStyle: TextStyle(color: Colors.blue),
                  ),
                  value: selectedGender.isNotEmpty ? selectedGender : null,
                  items: genderOptions
                      .map((gender) => DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),

                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                        .hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                // DropdownButtonFormField for Category
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    hintText: 'Select your category',
                  ),
                  value: selectedCategory,
                  items: categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text('Terms and Conditions',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text(
                  'By using the Handyman App, you agree to these terms. Provide '
                  'accurate information during registration. You are responsible for '
                  'keeping your account details secure. Must ensure tools are '
                  'described accurately, safe, and functional. The app only connects '
                  'users and providers. We are not responsible for the quality or '
                  'outcome of services or tools provided. You must provide accurate '
                  'contact information.',
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    const Text('Do You Agree?',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 5),
                    Checkbox(
                      value: isAgreed,
                      onChanged: (bool? value) {
                        setState(() {
                          isAgreed = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Center(
                  child: ElevatedButton(
                    onPressed: isAgreed
                        ? registerOwner
                        : null, // Disable if not agreed
                    child: Text('Continue'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.yellow[700], // Button color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
