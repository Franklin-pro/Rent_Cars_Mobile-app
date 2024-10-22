import 'package:CarRent/UI/models/product.dart';
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
    List<Product> productList = Product.productList;

    List<String> productTypes = [
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
                    decoration: BoxDecoration(
                      color: Onboarding.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
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
                        const Icon(Icons.mic),
                      ],
                    ),
                  ),
                ],
              ),
            ),

           Container(
             padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50.0,
              width: size.width ,
             child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productTypes.length,
              itemBuilder: (BuildContext content, int index){
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectIndex = index;
                      });
                    },
                    child: Text(
                      productTypes[index],
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: selectIndex == index ? FontWeight.bold :FontWeight.w300,
                        color: selectIndex == index ? Onboarding.primaryColor : Onboarding.blackColor,
                      ),
                    ),
                  ),
                  );
             }),
            ),
          
          SizedBox(
            height: size.height * .3,
            child: ListView.builder(
              itemCount: productList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context , int index){
                return Container(
                  width: 300,
                  margin: const EdgeInsets.symmetric(horizontal: 20),

                       decoration: BoxDecoration(
                    color: Onboarding.primaryColor.withOpacity(0.88),
                    borderRadius: BorderRadius.circular(20)
                  ),

                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        right: 20,
                        child: Container(
                          width: 50,
                          height: 50,
                       decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                       ),
                          child: IconButton(
                            onPressed: null, 
                          icon: Icon(productList[index].isFavorited == true ? Icons.favorite : Icons.favorite_border),
                          color: Onboarding.primaryColor,
                          iconSize: 30,
                          ),
                        ),
                      
                      
                        ),

                        Positioned(
                          left: 50,
                          right: 50,
                          top: 50,
                          bottom: 50,
                          child: Image.asset(productList[index].imageUrl),),

                          Positioned(
                            bottom: 15,
                            right: 20,

                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Text(r'$' + productList[index].rentPrice.toString(),style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Onboarding.primaryColor
                              ),),
                            ),
                          ),
                            Positioned(
                              bottom: 15,
                              left: 20,
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(productList[index].productName,style:const TextStyle(
                            color: Colors.white,
                            fontSize: 16
                          ),),

                           Text(productList[index].description,style:const TextStyle(
                            color: Colors.white,
                            fontSize: 16
                          ),),
                                ],
                              )
                          
                          
                          ),
                    ],
                  ),
                  
           

                );
              }),
          ),
          
          Container(
            padding: const EdgeInsets.only(left: 16,top: 20,bottom: 20),

            child: Text('New Cars',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Onboarding.primaryColor
            ),),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: size.height * .5,
            child: ListView.builder(
              itemCount: productList.length,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext content, int index){
                return Container(
                  height: 80.0,
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  margin: const EdgeInsets.only(bottom: 10,top: 10),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Onboarding.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center, 

                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 60.0,
                            // height: 60.0,
                            decoration: BoxDecoration(
                              color: Onboarding.primaryColor.withOpacity(.8),
                              shape: BoxShape.circle

                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 0,
                            right: 0,
                            child: SizedBox(
                              height: 60.0,
                              child: Image.asset(productList[index].imageUrl),
                            ),),
                            Positioned(
                              top: 5,
                              left: 80.0,
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(productList[index].productName,style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Onboarding.primaryColor
                                  ),),
                                   Text(productList[index].description,style: TextStyle(
                                    fontSize: 16.0,
                                    color: Onboarding.blackColor
                                  ),),
                                ],
                              ),),
                              
                        ],
                      ),
                         Container(
                          padding: const EdgeInsets.only(right: 10,),
                          child: Text(r'$' + productList[index].rentPrice.toString(),style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Onboarding.primaryColor
                          ),),
                          ),
                    ],
                  ),
                );
              }),
          ),
          ],
        ),
      ),
    );
  }
}
