import 'package:flutter/material.dart'; // Ensure this import path is correct
import 'package:GOSL/components/description_card.dart'; // Import the DescriptionCard

class FoodSurf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tab Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabPage(),
    );
  }
}

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  final double _tabSize = 40.0; // Size of each tab
  final double _tabSpacing = 8.0; // Spacing between tabs

  // List of DescriptionCards
  final List<DescriptionCard> _views = [
    const DescriptionCard(
      backgroundImage: 'assets/surf/food_surf/kottu.jpg',
      title: 'Kottu',
      description: 'A tasty blend of roti, vegetables, and spices.',
      extendedDescription: 'Kottu is a Sri Lankan street food that’s both flavorful and satisfying.',
    ),
    const DescriptionCard(
      backgroundImage: 'assets/surf/food_surf/milkRice.jpg',
      title: 'Milk Rice',
      description: 'A traditional dish of cooked rice in coconut milk.',
      extendedDescription: 'Milk rice, or "kiribath", is a staple in Sri Lankan households, especially during celebrations.',
    ),
    const DescriptionCard(
      backgroundImage: 'assets/surf/food_surf/hoppers.jpg',
      title: 'Hoppers',
      description: 'A crispy pancake with a soft, spongy center.',
      extendedDescription: 'Hoppers are a unique Sri Lankan dish, perfect with curry or an egg at the center.',
    ),
    // Add more DescriptionCards as needed
  ];

  // Dynamically generate image paths from _views
  List<String> get _imagePaths => _views.map((view) => view.backgroundImage).toList();

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTabSelected(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentIndex = index;
    });

    // Scroll to the selected tab
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final double tabOffset = (index * (_tabSize + _tabSpacing)) - (MediaQuery.of(context).size.width / 2 - _tabSize / 2);

      _scrollController.animateTo(
        tabOffset,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _views.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              return _views[index]; // Display corresponding DescriptionCard
            },
          ),
          Positioned(
            bottom: 0, // Adjust the distance from the bottom
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5), // Semi-transparent background
                  borderRadius: BorderRadius.circular(0), // Rounded corners
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_imagePaths.length, (index) {
                      return GestureDetector(
                        onTap: () => _onTabSelected(index),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: _tabSpacing),
                          width: _tabSize,
                          height: _tabSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _currentIndex == index
                                  ? Colors.white
                                  : Colors.transparent,
                              width: 4,
                            ),
                            image: DecorationImage(
                              image: AssetImage(_imagePaths[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
