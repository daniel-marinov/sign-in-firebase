// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LikeListTile extends StatelessWidget {
  const LikeListTile(
      {Key? key,
      this.color = Colors.grey,
      this.subtitle,
      this.imgUrl =
          'https://www.vhv.rs/dpng/d/428-4287793_male-profile-round-circle-users-svg-png-icon.png'})
      : super(key: key);

  final String? subtitle;
  final Color color;
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Container(
        width: 50,
        child: AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        imgUrl.toString(),
                      ))),
            ),
          ),
        ),
      ),
      title: Text(" Selfie.png"),
      subtitle: Row(
        children: [
          SizedBox(
            width: 5,
          ),
          Text("Uploaded on Feb. 19 2020"),
          Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(width: 4, height: 4),
              )),
          // Text("Uploaded on Feb. 19")
        ],
      ),
    );
  }
}
