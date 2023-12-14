import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lamp_shop_ui_flutter/screens/detail_screen.dart';
import 'package:lamp_shop_ui_flutter/utils/text_utils.dart';

import '../data/lamp_data.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String>categoryList=["All","Buffet","Torchiere","Unique","Others"];
  int selectedCategory=0;
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextUtil(text: "Exclusive Lights",weight: true,size: 20,),
            TextUtil(text: "for your house",color:const  Color(0xffbbc1d1),)
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white),
              image:const  DecorationImage(
                image: AssetImage("assets/profile.jpeg")
              )

            ),
          )
        ],
      ),bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house),
          label: '',
            backgroundColor:  Color(0xff333C4B)

        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          label: '',
            backgroundColor:  Color(0xff333C4B)
        ),

        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell),
            label: '',
            backgroundColor:  Color(0xff333C4B)
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
          label: '',
          backgroundColor:  Color(0xff333C4B)
        ),


      ],
      currentIndex: selectedIndex,
      selectedItemColor:Theme.of(context).primaryColor,
        unselectedItemColor:const  Color(0xffbbc1d1),
      onTap: (val){
        setState(() {
          selectedIndex=val;
        });

      },


    ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
                itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  setState(() {
                    selectedCategory=index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  margin:const  EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:selectedCategory==index?Theme.of(context).primaryColor: Theme.of(context).primaryColorLight
                  ),
                  alignment: Alignment.center,
                  child: TextUtil(text:categoryList[index],size: 13,weight: true,),



                ),
              );
            }),),
           const  SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUtil(text: "Recommended",weight: true,size: 17,),
                  TextUtil(text: "See all",color:const  Color(0xffbbc1d1),size: 14,)
                ],
              ),
            ),
            const  SizedBox(height: 20,),
            SizedBox(height: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: fistList.length,
                  itemBuilder: (context,index){
                    return Container(
                      width: 150,
                      padding: const EdgeInsets.only(bottom: 10,left: 15,right: 15),
                      margin:const  EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(20),
                          color:Theme.of(context).primaryColorLight,
                        boxShadow:const  [
                          BoxShadow(
                            color: Color(0xff2e3545),
                            offset: Offset(5,5),
                            blurRadius: 10
                          ),

                        ]
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Center(
                              child: SizedBox(
                                child: Image.asset(fistList[index].image,fit: BoxFit.fill,),
                              ),
                            ),
                          )),
                          TextUtil(text: fistList[index].name,weight: true,size: 18,),
                          Row(
                            children: [
                             const  Icon(Icons.star,color: Colors.yellow,size: 15,),
                              const SizedBox(width: 5,),
                              TextUtil(text:fistList[index].rating ,color:const  Color(0xffbbc1d1),)

                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextUtil(text: "\$${fistList[index].price}",weight: true,color:Theme.of(context).primaryColor,size: 19,),
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: Theme.of(context).primaryColor,
                                child:const  Icon(Icons.add,color: Colors.white,),
                              )
                            ],
                          )
                          
                        ],
                      )


                    );
                  }),),
            const  SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUtil(text: "Popular Lamps",weight: true,size: 17,),
                  TextUtil(text: "See all",color:const  Color(0xffbbc1d1),size: 14,)
                ],
              ),
            ),
            const  SizedBox(height: 20,),
            SizedBox(height: 100,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: secondList.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailScreen(data: secondList[index])));
                      },
                      child: Container(
                          width: 270,
                          padding: const EdgeInsets.only(bottom: 10,left: 15,right: 15),
                          margin:const  EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:Theme.of(context).primaryColorLight,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xff2e3545),
                                    offset: Offset(5,5),
                                    blurRadius: 10
                                ),

                              ]
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                width: 100,
                                child: Center(
                                  child: SizedBox(
                                    child: Image.asset(secondList[index].image,fit: BoxFit.fill,),
                                  ),
                                ),
                              ),
                              Expanded(
                                child:Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                      
                                      TextUtil(text: secondList[index].name,weight: true,size: 17,),
                                      Row(
                                        children: [
                                          const  Icon(Icons.star,color: Colors.yellow,size: 12,),
                                          const SizedBox(width: 5,),
                                          TextUtil(text:secondList[index].rating ,color:const  Color(0xffbbc1d1),size: 13,)
                      
                                        ],
                                      ),
                                      const SizedBox(height: 5,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextUtil(text: "\$${secondList[index].price}",weight: true,color:Theme.of(context).primaryColor,size: 16,),
                                          CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Theme.of(context).primaryColor,
                                            child:const  Icon(Icons.add,color: Colors.white,),
                                          )
                                        ],
                                      )
                      
                                    ],
                                  ),
                                )
                              ),
                            ],
                          )
                      
                      
                      ),
                    );
                  }),),



          ],
        ),
      ),

    );
  }
}
