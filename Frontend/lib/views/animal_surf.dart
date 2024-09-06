import 'package:flutter/material.dart'; // Ensure this import path is correct
import 'package:GOSL/components/description_card.dart'; // Import the DescriptionCard

class AnimalSurf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Tab Example',
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
      backgroundImage: 'assets/surf/animal_surf/bigSquirrel.png',
      title: 'Big Squirrel',
      description: 'The Sri Lankan big squirrel, or Giant Squirrel (Ratufa macroura), is a strikingly large rodent endemic to the island, distinguished by its vibrant fur and impressive size.',
      extendedDescription: 'Inhabiting the lush rainforests and deciduous forests of Sri Lanka, this species plays a crucial role in its ecosystem as a seed disperser and a key part of the forest’s biodiversity.',
    ),
    const DescriptionCard(
      backgroundImage: 'assets/surf/animal_surf/leapord.jpg',
      title: 'Leopard',
      description: 'The Sri Lankan leopard (Panthera pardus kotiya) is a critically endangered subspecies native to Sri Lanka, renowned for its elusive nature and striking rosette-patterned coat.',
      extendedDescription: 'Found primarily in the island\'s dense forests and national parks, it is a top predator that helps maintain ecological balance by controlling prey populations and shaping the forest structure.',
    ),
    const DescriptionCard(
      backgroundImage: 'assets/surf/animal_surf/elephant.jpg',
      title: 'Elephant',
      description: 'The Sri Lankan elephant (Elephas maximus maximus) is a distinct subspecies of the Asian elephant, recognized for its larger size and unique characteristics, such as its relatively small ears compared to its African counterparts.',
      extendedDescription: 'Native to Sri Lanka, these elephants play a crucial role in the island\'s ecosystem by dispersing seeds and maintaining forest habitats, but they face threats from habitat loss and human-wildlife conflict.',
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
