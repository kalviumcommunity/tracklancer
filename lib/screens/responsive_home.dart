import 'package:flutter/material.dart';

class ResponsiveHome extends StatelessWidget {
  const ResponsiveHome({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracklancer Dashboard"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: isTablet
            ? Row(
                children: [
                  Expanded(child: buildCard("Tasks", Icons.task)),
                  const SizedBox(width: 16),
                  Expanded(child: buildCard("Calendar", Icons.calendar_today)),
                ],
              )
            : Column(
                children: [
                  buildCard("Tasks", Icons.task),
                  const SizedBox(height: 16),
                  buildCard("Calendar", Icons.calendar_today),
                ],
              ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Add Task"),
        ),
      ),
    );
  }

  Widget buildCard(String title, IconData icon) {
    return Card(
      elevation: 4,
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
