import 'dart:ffi';

import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:round2task/models/category.dart';
import 'package:round2task/models/sortBy.dart';
import 'package:round2task/screens/colleges_screen.dart';
import 'package:round2task/utils/colors.dart';
import 'package:round2task/widgets/big_text.dart';
import 'package:round2task/widgets/small_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _controller;
  BottomDrawerController _drawerController = BottomDrawerController();
  List _sortByList = [SortBy( icon: Icons.local_pharmacy_outlined,text:"Bachelor of Technology",value: false),
    SortBy( icon: Icons.local_pharmacy_outlined,text:"Bachelor of Architecture",value: false),
    SortBy( icon: Icons.local_pharmacy_outlined,text:"Pharmacy",value: false),
    SortBy( icon: Icons.local_pharmacy_outlined,text:"Law",value: false),
    SortBy( icon: Icons.local_pharmacy_outlined,text:"Managment",value: false),


  ];
  bool _isOpen = false;

  List<Category> list = [
    Category(
        title: "Top Colleges",
        discr: 'Search through thousands of accredited colleges and universities online to find the right one for you.  Apply in 3 min, and connect with your future.',
        img: "assets/images/school.jpg"),
    Category(
        title: "Top Schools",
        discr: 'Searching for the best school for you just got easier! With our Advanced School Search, you can easily filter out the schools that are fit for you.',
        img: "assets/images/college1.jpg"),
    Category(
        title: "Exams",
        discr: 'Find an end to end information about the exams that are happening in India',
        img: "assets/images/college2.jpg"),

  ];

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
      body: Stack(
        children: [
          Column(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BigText(
                          text: "Find your own way",
                          color: Colors.white,
                          size: 25,
                        ),
                        Icon(
                          Icons.notifications_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SmallText(
                      text: "Search in 600 colleges around",
                      color: Colors.white,
                      size: 14,
                    ),
                    SizedBox(
                      height: 30,
                    ),
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
              // here goes card of ways
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.maxFinite,
                      height: 200,
                      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          print('tapping');
                          if(_isOpen)
                          _drawerController.close();
                          else
                            _drawerController.open();

                          _isOpen = !_isOpen;
                        },
                        child: Stack(
                          children: [
                            Positioned(
                                child: Container(
                                    width: double.maxFinite,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(list[index].img)),
                                    ))),
                            Positioned(
                                child: Container(
                              width: double.maxFinite,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        AppColors.gradientStartColor,
                                        AppColors.gradientEndColor
                                      ])),
                            )),
                            Positioned(
                                child: Container(
                              width: double.maxFinite,
                              height: 200,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(
                                    text: list[index].title,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 20,),
                                  SmallText(
                                    text:list[index].discr
                                        ,  size: 14,
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],),
     BottomDrawer(
    header: Container(),
    body: Container(
      padding: EdgeInsets.only(top: 20,bottom: 10,left: 30,right:30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight:Radius.circular(30),topLeft: Radius.circular(30)),
          boxShadow: [BoxShadow(blurRadius: 5,spreadRadius: 5,color:Colors.black26)],
          color: Colors.white
      ),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(text: "Sort by",),
              GestureDetector(onTap:(){
                _isOpen = !_isOpen;
                _drawerController.close();

              },child: Icon(Icons.close,color: AppColors.inactiveIconColor,))
            ],
          ),
          SizedBox(height: 15,),
          Container(margin:EdgeInsets.symmetric(horizontal: 10),height: 2,width: double.maxFinite,color: AppColors.inactiveIconColor,),
          Expanded(
            child: ListView.builder(scrollDirection:Axis.vertical,itemBuilder: (context,index){
              return InkWell(
    onTap: () {

    },
    child: Row(
    children: [
    Icon(_sortByList[index].icon),
    SizedBox(width: 16),
    BigText(text:_sortByList[index].text),
    Spacer(),
    Radio<bool>(
    value: true,
    groupValue: _sortByList[index].value,
    onChanged: (v){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CollegesScreen()));
      },
    ),
    ],
    ),
    );

  },itemCount: _sortByList.length,),
          )
        ],
      ),

    ),
    headerHeight: 0,
    drawerHeight: 400,
    color: Colors.white,
    controller: _drawerController,
    )
        ],
      ),
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
