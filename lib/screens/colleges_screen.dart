import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:round2task/screens/college_details_screen.dart';
import 'package:round2task/utils/colors.dart';
import 'package:round2task/widgets/app_icon.dart';

import 'package:round2task/widgets/big_text.dart';
import 'package:round2task/widgets/small_text.dart';

class CollegesScreen extends StatefulWidget {
  const CollegesScreen({Key? key}) : super(key: key);

  @override
  State<CollegesScreen> createState() => _CollegesScreenState();
}

class _CollegesScreenState extends State<CollegesScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search_outlined,
                              color: AppColors.inactiveIconColor,
                              size: 27,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            // SmallText(text: "Search for colleges , schools aroun...",color: AppColors.inactiveIconColor,size: 15,)
                            SizedBox(
                              width: 210,
                              child: TextField(
                                decoration: InputDecoration.collapsed(
                                    hintText:
                                        "Search for colleges, schools aroun.."),
                                controller: _controller,
                                style: TextStyle(
                                    color: AppColors.inactiveIconColor,
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    height: 1.2),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.mic_rounded,
                          color: AppColors.mainColor,
                          size: 30,
                        ),
                      )
                    ]),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 20,left: 20,right:20),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5)
                  ,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(width:2,color:Colors.black26)
                  ),
                  child: SmallText(text:'MVSH Engineering college ',color: Colors.black26,size: 13,),
                ),
        SizedBox(width:5)
        ,Container(
                  padding: EdgeInsets.all(5)
                  ,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(width:2,color:Colors.black26)
                ),
                  child: SmallText(text:'MVSH Engineering college ',color: Colors.black26,size: 13,),
                )
              ],
            ),
          ),

          // here goes card of ways
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(blurRadius: 5,spreadRadius: 5,color: Colors.black26)
                    ]
                  ),
                  child: GestureDetector(
                      onTap: () {
                        print('tapping');
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CollegeDetailsScreen() ));
                        // this will open new page
                      },

                      // card goes here
                      child: Stack(children: [
                        Positioned(
                            child: Container(
                                child: Column(children: [
                         Container(
                           width: double.maxFinite,
                           height: 120,
                           decoration: BoxDecoration(
                           borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                           image: DecorationImage(
                           fit: BoxFit.cover,
                             image: AssetImage('assets/images/school.jpg')
                           )
                         ),),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(text: 'GHJK Engineering college'),
                                            Container(
                                                padding: EdgeInsets.all(7),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: AppColors.green
                                                ),
                                                child:Row(
                                                  children: [
                                                    BigText(text: '4.5',size: 13,color: Colors.white,),
                                                    Icon(Icons.star_rounded,color: Colors.white,)
                                                  ],
                                                )
                                            )
                                          ],
                                        ),
                                        SizedBox(height:10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(child: Container(
                                                margin: EdgeInsets.only(left: 10),child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eu ut imperdiet sed nec ullamcorper.',softWrap: true,)))
                                            ,
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => CollegeDetailsScreen() ));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: AppColors.mainColor
                                                ),
                                                child: BigText(text: 'Apply Now',color: Colors.white,size: 16,),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height:20),
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: 10),
                                          height: 2,
                                          width: double.maxFinite,
                                          color: AppColors.inactiveIconColor,
                                        ),
                                        SizedBox(height:10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset('assets/images/like.jpg',width: 50,height: 50,),
                                            Expanded(child: Container(child: SmallText(text:'More than 1000+ students have been placed',color: AppColors.inactiveIconColor,))),
                                            Icon(Icons.remove_red_eye_outlined,color: AppColors.inactiveIconColor,),
                                            SmallText(text:'400+')
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                        ]))),
                        Positioned(
                          child: Container(
                            padding:EdgeInsets.only(left:10,right:10,top:10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppIcon(icon:Icons.share_outlined,size:40),
                                AppIcon(icon:Icons.bookmark_outlined,size:40)
                              ],
                            ),
                          )
                        )
                      ])),
                );
              },
            ),
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: AppColors.inactiveIconColor,
        showSelectedLabels: true,
        backgroundColor: AppColors.mainColor,
        showUnselectedLabels: true,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.tag_outlined), label: "saved"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_rounded), label: "saved"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: "Profile")
        ],
      ),
    );
  }
}
