import 'package:flutter/material.dart';

import '../widgets/dashboard_card.dart';

/// Responsive home screen that adapts between phone and tablet layouts
/// using MediaQuery, LayoutBuilder, and adaptive widgets.
class ResponsiveHome extends StatelessWidget {
  const ResponsiveHome({super.key});

  /// Dashboard card data: each entry holds icon, title, description, and color.
  static const List<Map<String, dynamic>> _cardData = [
    {
      'icon': Icons.task_alt,
      'title': 'Tasks',
      'description': 'Manage your ongoing tasks',
      'color': Colors.blue,
    },
    {
      'icon': Icons.access_time,
      'title': 'Deadlines',
      'description': 'Track upcoming deadlines',
      'color': Colors.orange,
    },
    {
      'icon': Icons.people,
      'title': 'Clients',
      'description': 'View and manage clients',
      'color': Colors.green,
    },
    {
      'icon': Icons.payment,
      'title': 'Payments',
      'description': 'Monitor payment status',
      'color': Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---- HEADER SECTION ----
      appBar: AppBar(
        title: const Text('Tracklancer Dashboard'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      // ---- MAIN CONTENT SECTION ----
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth > 600) {
                return _buildTabletLayout();
              } else {
                return _buildPhoneLayout();
              }
            },
          ),
        ),
      ),

      // ---- FOOTER SECTION ----
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add New Task'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Phone layout: single-column scrollable list of cards.
  // ---------------------------------------------------------------------------
  Widget _buildPhoneLayout() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _cardData.map((data) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: DashboardCard(
              icon: data['icon'] as IconData,
              title: data['title'] as String,
              description: data['description'] as String,
              color: data['color'] as Color,
            ),
          );
        }).toList(),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Tablet layout: 2-column grid of cards.
  // ---------------------------------------------------------------------------
  Widget _buildTabletLayout() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.6,
      children: _cardData.map((data) {
        return DashboardCard(
          icon: data['icon'] as IconData,
          title: data['title'] as String,
          description: data['description'] as String,
          color: data['color'] as Color,
        );
      }).toList(),
    );
  }
}
