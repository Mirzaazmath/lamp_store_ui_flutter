import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lamp_shop_ui_flutter/data/lamp_data.dart';
import 'package:lamp_shop_ui_flutter/utils/showup_animation.dart';

import '../utils/text_utils.dart';
class DetailScreen extends StatefulWidget {
 final  Lamp data;

  const DetailScreen({super.key,required this.data});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

 List<Color>colorList=[Colors.transparent,Colors.yellow.shade300,Colors.pink.shade300,Colors.deepPurpleAccent.shade100,Colors.black,Colors.green.shade300];
int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     extendBodyBehindAppBar: true,
     appBar: AppBar(
      leading:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
         onTap: (){
          Navigator.pop(context);
         },
          child:const  CircleAvatar(
           backgroundColor: Colors.black26,
           child: Icon(CupertinoIcons.back,color: Colors.white,),),
        ),
      ),
      actions: const [

       CircleAvatar(
       backgroundColor: Colors.black26,
       child: Icon(CupertinoIcons.heart,color: Colors.white,),),
       SizedBox(width: 20,),
      ],
      backgroundColor: Colors.transparent,),

     body:

       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Container(

         height: MediaQuery.of(context).size.height*0.45,
          decoration:  BoxDecoration(

           image:  DecorationImage(
               image:const  AssetImage("assets/final.png"),fit: BoxFit.fill,colorFilter: ColorFilter.mode(colorList[index], BlendMode.overlay)
           ),
           borderRadius:const  BorderRadius.vertical(bottom: Radius.circular(50))
          ),
        ),
        Expanded(
          child: Container(
           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
           child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           const  Spacer(),
             ShowUpAnimation(
              delay: 200,
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 TextUtil(text: widget.data.name,size: 25,),
                 TextUtil(text: "\$${widget.data.price}",size: 24,weight: true,)
                ],
               ),
             ),
             const  Spacer(),
             ShowUpAnimation(
              delay: 300,
                 child: TextUtil(text: "The most beautiful lamp in the world and very nice to see this color they.....",color:const  Color(0xffbbc1d1),)),
             const  Spacer(),
             ShowUpAnimation(
              delay: 400,
                 child: TextUtil(text: "Color",size: 20,)),
           const  SizedBox(height: 20,),
             ShowUpAnimation(
              delay: 500,
               child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                 child: Row(
                  children: [
                   for(int i=0;i<colorList.length; i++ )...[ GestureDetector(
                    onTap:(){
                     setState(() {
                       index=i;
                     });
                    },
                     child: Container(
                      margin: const EdgeInsets.only(right: 15),

                      height:60,
                      width: 60,
                      decoration: BoxDecoration(

                          image:  DecorationImage(
                              image:const  AssetImage("assets/final.png"),fit: BoxFit.fill,colorFilter: ColorFilter.mode(colorList[i], BlendMode.overlay)
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                     ),
                   ),]
                  ],

                 ),
               ),
             ),
            const  Spacer(),
           
             ShowUpAnimation(
              delay: 600,
               child: Row(
                children: [

                 Container(
                  height:60,
                  width: 70,
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   border: Border.all(color:const  Color(0xffbbc1d1)),
                  ),
                  alignment: Alignment.center,
                  child: Stack(
                   alignment: Alignment.topRight,
                    children: [
                     const  Icon(CupertinoIcons.cart,color: Colors.white,size: 30,),
                     CircleAvatar(
                      radius: 6,
                      backgroundColor: Theme.of(context).primaryColor,
                      child:const  Icon(Icons.add,color: Colors.white,size: 12,),
                     )
                    ],
                  ),
                 ),
                const  SizedBox(width: 20,),
                 Expanded(
                   child: Container(
                    height:60,

                    decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                        boxShadow:const  [
                         BoxShadow(
                             color: Color(0xff2e3545),
                             offset: Offset(5,5),
                             blurRadius: 10
                         ),

                        ]
                    ),
                    alignment: Alignment.center,
                    child: TextUtil(text: "Buy now ",size: 22,)
                   ),
                 ),
                ],
               ),
             ),
            const   SizedBox(height: 10,)
          
            ],
           ),
          ),
        ),

        ],
       ),

    );
  }
}
