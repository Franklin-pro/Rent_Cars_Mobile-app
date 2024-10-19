import 'package:flutter/material.dart';
import 'package:CarRent/constraints.dart';

class Plant {
  final String name;
  final String imageUrl;
  bool isFavorited;

  Plant({required this.name, required this.imageUrl, this.isFavorited = false});

  // A sample list of plants
  static List<Plant> plantList = [
    Plant(name: 'Rose', imageUrl: 'assets/images/honda.png', isFavorited: true),
    Plant(name: 'Tulip', imageUrl: 'assets/images/lambo.jpg', isFavorited: false), // Fixed the image URL
    Plant(name: 'Sunflower', imageUrl: 'assets/images/rem.png', isFavorited: false),
  ];
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;

    List<String> plantTypes = [
      'Recommended',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement',
    ];

    // toggle favorite button
    bool toggleIsFavorited(isFavorited) {
      return !isFavorited;
    }

    int selectIndex = 0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    width: size.width * .8,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search, color: Colors.black54.withOpacity(0.6)),
                        const Expanded(
                          child: TextField(
                            showCursor: false,
                            decoration: InputDecoration(
                              hintText: 'Search ...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(Icons.mic),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Onboarding.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),

            // Plant Types ListView
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              height: 50.0,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: plantTypes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectIndex = index;
                        });
                      },
                      child: Center(
                        child: Text(
                          plantTypes[index],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: selectIndex == index ? FontWeight.bold : FontWeight.w300,
                            color: selectIndex == index
                                ? Onboarding.primaryColor
                                : Onboarding.blackColor,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Plant ListView
            SizedBox(
              height: size.height * 0.6, // Adjusted height for better visibility
              child: ListView.builder(
                itemCount: _plantList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          right: 20,
                          child: Container(
                            height: 50,
                            width: 50,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _plantList[index].isFavorited = toggleIsFavorited(_plantList[index].isFavorited);
                                });
                              },
                              icon: Icon(
                                _plantList[index].isFavorited
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              ),
                              color: Onboarding.primaryColor,
                              iconSize: 30,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 50,
                          right: 50,
                          top: 50,
                          bottom: 50,
                          child: Image.asset(_plantList[index].imageUrl), // Ensure image paths are correct
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
