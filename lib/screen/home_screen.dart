import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {


  List popularList = [
    {
      "imageUrl":
          "https://c8.alamy.com/comp/2AF96P6/a-woman-walking-along-an-idyllic-tropical-beach-2AF96P6.jpg",
      "title": "Night King Beach",
      "rating": "3"
    },
    {
      "imageUrl":
          "https://i.pinimg.com/originals/c4/cf/4a/c4cf4a114c3009df926e615ac1e38fdc.jpg",
      "title": "Loktak Lake",
      "rating": "5"
    },
    {
      "imageUrl":
          "https://images.pexels.com/photos/2070485/pexels-photo-2070485.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "title": "Thailand",
      "rating": "4"
    }
  ];
  List recomendedList = [
    {
      "imageUrl":
      "https://c4.wallpaperflare.com/wallpaper/390/92/848/architecture-building-portrait-display-pagoda-wallpaper-preview.jpg",
      "title": "Japan",
      "rating": "4"
    },
    {
      "imageUrl":
      "https://c8.alamy.com/comp/2AF96P6/a-woman-walking-along-an-idyllic-tropical-beach-2AF96P6.jpg",
      "title": "Goa",
      "rating": "2"
    },
    {
      "imageUrl":
      "https://i.pinimg.com/originals/c4/cf/4a/c4cf4a114c3009df926e615ac1e38fdc.jpg",
      "title": "Loktak Lake",
      "rating": "5"
    }
  ];
  List CosteffectList = [
    {
      "imageUrl":
      "https://i.pinimg.com/originals/b8/08/9a/b8089a847c7ce5acb5af0543faa7525d.jpg",
      "title": "Dubai",
      "rating": "3"
    },
    {
      "imageUrl":
      "https://c8.alamy.com/comp/2AF96P6/a-woman-walking-along-an-idyllic-tropical-beach-2AF96P6.jpg",
      "title": "Goa",
      "rating": "2"
    },
    {
      "imageUrl":
      "https://i.pinimg.com/originals/c4/cf/4a/c4cf4a114c3009df926e615ac1e38fdc.jpg",
      "title": "Loktak Lake",
      "rating": "5"
    }
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Colors.amber
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.menu,
                          size: 30.0,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.account_circle,
                          size: 40.0,
                        )
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: RichText(
                       text: TextSpan(
                         text: "Where would you like to go?",
                         style: TextStyle(
                           fontSize: 30
                         )
                       )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        text: "Popular",
                      ),
                      Tab(
                        text: "Recomended",
                      ),
                      Tab(
                        text: "Cost-effect",
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: 300.0,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      PopularWidget(popularList),
                      PopularWidget(recomendedList),
                      PopularWidget(CosteffectList),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class PopularWidget extends StatefulWidget {

  final List vacationList;
  PopularWidget(this.vacationList);

  @override
  State<PopularWidget> createState() => _PopularWidgetState();
}

class _PopularWidgetState extends State<PopularWidget> {
  Color c = Colors.black;
  bool check = false;

  setFavorite(){
    if(check){
      setState(() {
        c = Colors.red;
        check = false;
      });
    }else{
      setState(() {
        c = Colors.black;
        check = true;
      });
}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.vacationList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage.assetNetwork(
                  height: 240,
                  width: 180,
                  fit: BoxFit.cover,
                  placeholder: 'images/place.png',
                  image: widget.vacationList[index]['imageUrl'],
                ),
              ),
              Positioned(
                top: 20,
                right: 10,
                child: Container(
                child: InkWell(
                  onTap: (){
                    setFavorite();
                  },
                    child: Icon(Icons.favorite,color: c,)
                  ,),
              ),
              ),
              Positioned(
                bottom: 30,
                left: 10,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.vacationList[index]['title'],
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white),
                      ),
                      RatingBar.builder(
                        itemSize: 20,
                        initialRating: double.parse(widget.vacationList[index]['rating']),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: int.parse(widget.vacationList[index]['rating']),
                        itemPadding: EdgeInsets.symmetric(
                            horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}



