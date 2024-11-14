import 'package:flutter/material.dart';
import 'package:investsyncwebsite/common/widgets/description_card.dart';
import 'package:investsyncwebsite/common/widgets/navigation_bar.dart'; // Import the CustomNavigationBar
import 'package:investsyncwebsite/common/widgets/botnav.dart'; // Import the BotNav

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            110.0), // Set the height of your custom navigation bar
        child: CustomNavigationBar(),
      ),

      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // SliverAppBar with a parallax effect
          SliverAppBar(
            expandedHeight: 680,
            pinned: false,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Parallax Example"),
              background: Builder(
                builder: (context) {
                  // Adjust the image position as you scroll
                  double scrollOffset = _scrollController.hasClients
                      ? _scrollController.offset
                      : 0;
                  double parallaxOffset =
                      scrollOffset * 0.3; // Change 0.3 for different speed

                  return Transform.translate(
                    offset:
                        Offset(0, parallaxOffset), // Apply parallax translation
                    child: Image.network(
                      'assets/images/photos/golden_bull.png', // Replace with your image URL
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),

          // Some content to scroll
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text("ANYTHING")
                
              ),
              childCount: 1, // Number of items
            ),
          ),

          SliverAppBar(
            expandedHeight: 300.0,
            pinned: false,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Parallax Example"),
              background: Builder(
                builder: (context) {
                  // Adjust the image position as you scroll
                  double scrollOffset = _scrollController.hasClients
                      ? _scrollController.offset
                      : 0;
                  double parallaxOffset =
                      scrollOffset * 0.3; // Change 0.3 for different speed

                  return Transform.translate(
                    offset:
                        Offset(0, parallaxOffset), // Apply parallax translation
                    child: Image.network(
                      'https://static.wixstatic.com/media/2e6432_bec5502d7f66439b98caac67f7d27fcc~mv2.png/v1/fill/w_953,h_934,al_c,q_90,enc_auto/2e6432_bec5502d7f66439b98caac67f7d27fcc~mv2.png', // Replace with your image URL
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item #$index'),
              ),
              childCount: 2, // Number of items
            ),
          ),
        ],
      ),
    );
  }
}
