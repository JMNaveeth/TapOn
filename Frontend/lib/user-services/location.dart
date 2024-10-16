import 'package:flutter/material.dart';
import 'package:tap_on/user-services/showprovider.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TapOn'),
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NearbyServiceProvidersPage(),
              ),
            );
          },
        ),
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final TextEditingController locationController = TextEditingController();
  final List<String> locations = ['Colombo', 'Trincomalee', 'Kandy', 'Jaffna'];

  void _addLocation() {
    if (locationController.text.isNotEmpty) {
      setState(() {
        locations.add(locationController.text);
        locationController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: locationController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Your Location Details',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _addLocation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text('Add'),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            'Choose Your Location',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            color: const Color.fromARGB(255, 233, 231, 207),
            child: GridView.count(
              crossAxisCount: 1, // 1 column
              padding: const EdgeInsets.all(10.0),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 6, // Adjust to make the items wide rectangles
              children: [
                ServiceCard(
                  label: 'Colombo',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NearbyServiceProvidersPage(),
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Trincomalee',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NearbyServiceProvidersPage(),
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Kandy',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NearbyServiceProvidersPage(),
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Jaffna',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NearbyServiceProvidersPage(),
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Gardener',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NearbyServiceProvidersPage(),
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Fridge Repair',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NearbyServiceProvidersPage(),
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Beauty Professional',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NearbyServiceProvidersPage(),
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Phone Repair',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NearbyServiceProvidersPage(),
                      ),
                    );
                  },
                ),
                ServiceCard(
                  label: 'Other',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NearbyServiceProvidersPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color.fromARGB(255, 250, 184, 78),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
