import 'package:flutter/material.dart'; // Ensure this import path is correct
import 'package:GOSL/components/description_card.dart'; // Import the DescriptionCard

class EventSurf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Tab Example',
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
      backgroundImage: 'assets/surf/event_surf/perahara.jpg',
      title: 'Esala Perahara, Kandy',
      description: 'The Esala Perahara, held annually in Kandy, Sri Lanka, is one of the most spectacular and revered Buddhist festivals, celebrated in honor of the Sacred Tooth Relic of the Buddha.',
      extendedDescription: 'This grand procession features beautifully adorned elephants, traditional dancers, and drummers, creating a vibrant and colorful display of Sri Lankan cultural heritage.',
    ),
    const DescriptionCard(
      backgroundImage: 'assets/surf/event_surf/Kirimadu.jpg',
      title: 'Kimadu Shanthikarma',
      description: 'Kirimadu Shanthikarmaya is a traditional Sri Lankan ritual held to seek blessings and ensure prosperity and harmony for the community.',
      extendedDescription: 'This sacred event often includes offerings and prayers conducted by local priests to honor deities and invoke divine favor, reflecting the deep-rooted spiritual practices in Sri Lankan culture.',
    ),
    const DescriptionCard(
      backgroundImage: 'assets/surf/event_surf/kovil.jpg',
      title: 'Kovil Pooja',
      description: 'Kovil Pooja refers to the worship and ceremonies conducted in Hindu temples (kovils) in Sri Lanka, where devotees perform rituals to honor and seek blessings from Hindu deities.',
      extendedDescription: 'Kovil pooja is a significant event in the Tamil Hindu community, marked by devotional rituals and prayers.',
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
