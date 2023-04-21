import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:round2task/utils/colors.dart';
import 'package:round2task/widgets/app_icon.dart';
import 'package:round2task/widgets/big_text.dart';
import 'package:round2task/widgets/small_text.dart';

class CollegeDetailsScreen extends StatefulWidget {
  const CollegeDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CollegeDetailsScreen> createState() => _CollegeDetailsScreenState();
}

class _CollegeDetailsScreenState extends State<CollegeDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: AppColors.mainColor,
        automaticallyImplyLeading: true,
        actions: [
          Container(padding: EdgeInsets.all(10),child: AppIcon(icon:Icons.bookmark_outline,iconColor: Colors.black,backgroundColor: Colors.white,))
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 350,
              pinned: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(children: [
                  Container(
                    width: double.maxFinite,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/school.jpg'))),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: 'GHJK Engineering college'),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(left: 10,right:10),
                                    child: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eu ut imperdiet sed nec ullamcorper.',
                                      softWrap: true,
                                    ))),
                            Container(
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.green),
                                child: Column(
                                  children: [
                                    BigText(
                                      text: '4.5',
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    Icon(
                                      Icons.star_rounded,
                                      color: Colors.white,
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              bottom: TabBar(
                controller: _tabController,
                labelColor: Colors.black,

                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 4.0,
                    color: AppColors.mainColor,
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 16.0),
                ),

                tabs: [
                  Tab(text: 'About'),
                  Tab(text: 'Hostel Facility'),
                  Tab(text: 'QnA'),
                  Tab(text: 'Events'),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
              Container(
                padding: EdgeInsets.all(20),
                child: 
                SingleChildScrollView(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "Description"),
                       SizedBox(height: 10,),
                       SmallText(size: 15,text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque accumsan, scelerisque eget lectus ullamcorper a placerat. Porta cras at pretium varius purus cursus. Morbi justo commodo habitant morbi quis pharetra posuere mauris. Morbi sit risus, diam amet volutpat quis. Nisl pellentesque nec facilisis ultrices.',),
                      SizedBox(height: 20,),
                      BigText(text: "Location"),
                      SizedBox(height: 10,),
                      Container(
                        height: 200,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage('assets/images/map.png'),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      SizedBox(height: 20,),
                      BigText(text: "Students Review"),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            width:80,
                            height: 80,
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/person.jpg')
                              )
                            ),
                          ),
                          Container(
                            width:80,
                            height: 80,
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/images/person.jpg')
                                )
                            ),
                          ),
                          Container(
                            width:80,
                            height: 80,
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/images/person.jpg')
                                )
                            ),
                          ),
                          Container(
                            width:80,
                            height: 80,
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:AppColors.inactiveIconColor
                            ),
                          child:Center(
                            child:Text('12+')
                          )
                          )

                        ],

                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black26,spreadRadius: 3,blurRadius: 3)
                          ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: 'Arun Sai'),
                            SizedBox(height: 10,),
                            SmallText(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nec sed lorem nunc varius rutrum eget dolor, quis. Nulla sit magna suscipit tellus malesuada in facilisis a.'),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child:
                                  Icon(Icons.star,color: Colors.yellow,size: 16,)
                                  ,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child:
                                  Icon(Icons.star,color: Colors.yellow,size: 16,)
                                  ,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child:
                                  Icon(Icons.star,color: Colors.yellow,size: 16,)
                                  ,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child:
                                  Icon(Icons.star,color: Colors.yellow,size: 16,)
                                  ,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child:
                                  Icon(Icons.star,color: Colors.yellow,size: 16,)
                                  ,
                                ),

                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
              ,

            Container(
              color: Colors.white,
              child: Center(
                child: Text('Hostel Facility'),
              ),
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: Text('QnA'),
              ),
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: Text('Events'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
