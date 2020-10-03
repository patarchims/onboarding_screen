import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final Color beginColor;
  final Color endColor;

  SliderPage(
      {this.title,
      this.description,
      this.image,
      this.beginColor,
      this.endColor});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              // Box
              Container(
                margin:
                    EdgeInsets.fromLTRB(width / 9, height / 13, width / 9, 0),
                height: 275,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    gradient: LinearGradient(
                        colors: [beginColor, endColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(0, height / 13, 0, 0),
                height: 362,
                width: double.infinity,
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 11,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xFF9B9797),
                fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
