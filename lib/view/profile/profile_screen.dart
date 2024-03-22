import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skyer/utils/colors.dart';
import 'package:skyer/utils/globals.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {

          }, icon: Icon(Icons.menu_open,color: blackColor,),),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: height*0.22,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: Globals.defaultPadding*2),
            alignment: Alignment.center,
            // color: greyColor,
            child: Row(
              // verticalDirection: VerticalDirection.down,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: blackColor,width: 1),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: width*0.15,
                        backgroundImage: NetworkImage(Globals.profileImageUrl),
                      ),
                    ),
                    SizedBox(height: height*0.003,),
                    Container(
                      height: height*0.042,
                      // width: width*0.27,
                      padding: EdgeInsets.symmetric(horizontal: Globals.defaultPadding*2),
                      decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      alignment: Alignment.center,
                      child: Text('Edit Profile',style: Theme.of(context).textTheme.bodySmall,),
                    ),
                  ],
                ),
                SizedBox(width: width*0.05,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Globals.username,style: Theme.of(context).textTheme.bodyLarge,),
                    Text(Globals.userLocation,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: greyColor),),
                    SizedBox(
                        width: width*0.50,
                        child: Text(Globals.userBio,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: greyColor.withOpacity(0.5),),)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
