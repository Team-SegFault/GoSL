import 'package:flutter/material.dart'; 
import 'package:GOSL/components/description_card.dart'; 

class PlacesSurf extends StatelessWidget {
  const PlacesSurf({super.key});

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
      backgroundImage: 'assets/surf/places_surf/ellaBridge.jpg',
      title: '9 Arches Bridge, Ella',
      description: 'Commissioned under the British in the year 1921, the Nine Arch Bridge stands proudly, a testament to the engineering and architectural brilliance of the early 20th century.',
      extendedDescription: 'Ideally placed between the Ella and Demodara railway station, those choosing to walk along the bridge will be presented with scenes of rolling hills and dense jungle to delight in.',
    ),
    const DescriptionCard(
      backgroundImage: 'assets/surf/places_surf/Sigiriya.jpg',
      title: 'Sigiriya, Matale',
      description: 'Sigiriya, often referred to as the "Lion Rock," is an ancient rock fortress located in Sri Lanka, renowned for its stunning frescoes and intricate water gardens.',
      extendedDescription: 'This UNESCO World Heritage Site, built during the 5th century by King Kasyapa, offers panoramic views from its summit and is a significant example of ancient urban planning and engineering.',
    ),
    const DescriptionCard(
      backgroundImage: 'assets/surf/places_surf/galleFort.jpg',
      title: 'Galle Fort, Galle',
      description: 'Galle Fort, a historic fortified city on Sri Lanka\'s southwestern coast, showcases a unique blend of European and South Asian architectural styles, reflecting its colonial past.',
      extendedDescription: 'Built by the Portuguese in the 16th century and later expanded by the Dutch, it is now a UNESCO World Heritage Site known for its well-preserved ramparts, charming streets, and vibrant cultural heritage.',
    ),
    // Add more DescriptionCards as needed
  ];

  // Extract image paths from DescriptionCard list
  late List<String> _imagePaths = _views.map((view) => view.backgroundImage).toList();

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
