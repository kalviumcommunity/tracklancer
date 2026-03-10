import 'package:flutter/material.dart';

/// A screen demonstrating scrollable layouts using ListView.builder
/// and GridView.builder with efficient item rendering.
class ScrollableViews extends StatelessWidget {
  const ScrollableViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrollable Views Implementation'),
      ),
      body: SafeArea(
        // SingleChildScrollView wraps the entire body so both sections
        // can scroll together as one continuous page.
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- SECTION 1: LISTVIEW ----
              const Text(
                'ListView Example',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // A fixed-height Container prevents unbounded height errors
              // when embedding a ListView inside a Column.
              SizedBox(
                height: 180,
                // ListView.builder lazily builds items on demand, which is
                // more efficient than creating all children up-front.
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 140,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: Colors.primaries[index % Colors.primaries.length],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Card ${index + 1}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              // ---- SECTION 2: DIVIDER ----
              const Divider(thickness: 2),

              const SizedBox(height: 16),

              // ---- SECTION 3: GRIDVIEW ----
              const Text(
                'GridView Example',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // GridView.builder efficiently renders a grid of items on demand.
              // shrinkWrap: true makes it take only the space it needs.
              // NeverScrollableScrollPhysics prevents nested scroll conflicts
              // since the outer SingleChildScrollView handles scrolling.
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.primaries[(index + 4) % Colors.primaries.length],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Tile ${index + 1}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
