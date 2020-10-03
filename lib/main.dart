import 'package:flutter/material.dart';
import 'slide.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentPage = 0;
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hapus Debug banner
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF3084AC),
        body: Container(
          margin: EdgeInsets.only(top: 500 / 9),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Stack(
            children: [
              // Pageview
              PageView.builder(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: _onchanged,
                  controller: _controller,
                  itemCount: _pages.length,
                  itemBuilder: (context, int index) {
                    return _pages[index];
                  }),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(_pages.length, (int index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 6,
                        width: (index == _currentPage) ? 20 : 10,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? Color(0xFF263238)
                                : Color(0xFF8ED3F3)),
                      );
                    }),
                  ),
                  InkWell(
                    onTap: () {
                      _controller.nextPage(
                          duration: Duration(milliseconds: 800),
                          curve: Curves.easeInOutQuint);
                    },
                    child: AnimatedContainer(
                        alignment: Alignment.center,
                        duration: Duration(milliseconds: 300),
                        height: 44,
                        width: 217,
                        decoration: BoxDecoration(
                            color: Color(0xFF3084AC),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFF263238).withOpacity(0.5),
                                  blurRadius: 4,
                                  spreadRadius: 1)
                            ]),
                        child: (_currentPage == (_pages.length - 1))
                            ? Text(
                                "Get Started",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              )
                            : Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              )),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    "Please skip",
                    style: TextStyle(color: Color(0xFF9B9797), fontSize: 12),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // generate Page View
  List<Widget> _pages = [
    SliderPage(
      title: "Prototyping",
      description: "Realizing a product design that can be \ntried immediately",
      beginColor: Color(0xFFB6E3F3),
      endColor: Color(0xFF061922),
      image: "images/screen_1.png",
    ),
    SliderPage(
      title: "Research",
      description:
          "Colect data from  problem  that realy \nmatters is resolved",
      beginColor: Color(0xFFB469EC),
      endColor: Color(0xFF3E165B),
      image: "images/screen_2.png",
    ),
    SliderPage(
      title: "Ideation",
      description:
          "application of ideas from a \nconcept that has been determined",
      beginColor: Color(0xFF79E69F),
      endColor: Color(0xFF136A33),
      image: "images/screen_3.png",
    )
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
}
