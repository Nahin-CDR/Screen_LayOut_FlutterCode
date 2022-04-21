import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
        child: FirstPart(),
      ) //Horizontalscroll(),
          ),
    );
  }
}

class FirstPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.00),
              width: 100.00,
              height: 110.00,
              // ignore: deprecated_member_use
              child: const Icon(
                FontAwesomeIcons.house,
                size: 28,
                color: Colors.white,
              ),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(15.00)),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://th.bing.com/th/id/R.13e5ad26acc4510919b6439954c2c116?rik=QeHPaDx4L2DbaQ&riu=http%3a%2f%2fwallpapercave.com%2fwp%2frJJ8m3y.jpg&ehk=x8t%2f8DKGD9B8%2f00SXjgTom6M3duqRf0jgRC12JxMAd0%3d&risl=&pid=ImgRaw&r=0"),
                    fit: BoxFit.fill),
              ),
            ),
            Container(
                margin: EdgeInsets.all(5.00),
                width: 100.00,
                height: 110.00,
                // ignore: deprecated_member_use
                child: const Icon(
                  FontAwesomeIcons.facebook,
                  size: 28,
                  color: Colors.white,
                ),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(15.00)),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://th.bing.com/th/id/R.13e5ad26acc4510919b6439954c2c116?rik=QeHPaDx4L2DbaQ&riu=http%3a%2f%2fwallpapercave.com%2fwp%2frJJ8m3y.jpg&ehk=x8t%2f8DKGD9B8%2f00SXjgTom6M3duqRf0jgRC12JxMAd0%3d&risl=&pid=ImgRaw&r=0"),
                      fit: BoxFit.fill),
                )),
            Container(
              margin: EdgeInsets.all(5.00),
              width: 100.00,
              height: 110.00,
              child: const Icon(
                FontAwesomeIcons.youtube,
                size: 28,
                color: Colors.white,
              ),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(15.00)),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://th.bing.com/th/id/R.13e5ad26acc4510919b6439954c2c116?rik=QeHPaDx4L2DbaQ&riu=http%3a%2f%2fwallpapercave.com%2fwp%2frJJ8m3y.jpg&ehk=x8t%2f8DKGD9B8%2f00SXjgTom6M3duqRf0jgRC12JxMAd0%3d&risl=&pid=ImgRaw&r=0"),
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.00),
              width: 100.00,
              height: 110.00,
              child: const Icon(
                FontAwesomeIcons.twitter,
                size: 28,
                color: Colors.white,
              ),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(15.00)),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://th.bing.com/th/id/R.13e5ad26acc4510919b6439954c2c116?rik=QeHPaDx4L2DbaQ&riu=http%3a%2f%2fwallpapercave.com%2fwp%2frJJ8m3y.jpg&ehk=x8t%2f8DKGD9B8%2f00SXjgTom6M3duqRf0jgRC12JxMAd0%3d&risl=&pid=ImgRaw&r=0"),
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.00),
              width: 100.00,
              height: 110.00,
              // ignore: deprecated_member_use
              child: const Icon(
                FontAwesomeIcons.instagram,
                size: 28,
                color: Colors.white,
              ),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(15.00)),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://th.bing.com/th/id/R.13e5ad26acc4510919b6439954c2c116?rik=QeHPaDx4L2DbaQ&riu=http%3a%2f%2fwallpapercave.com%2fwp%2frJJ8m3y.jpg&ehk=x8t%2f8DKGD9B8%2f00SXjgTom6M3duqRf0jgRC12JxMAd0%3d&risl=&pid=ImgRaw&r=0"),
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.00),
              width: 100.00,
              height: 110.00,
              // ignore: deprecated_member_use
              child: const Icon(
                FontAwesomeIcons.tiktok,
                size: 28,
                color: Colors.white,
              ),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(15.00)),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://th.bing.com/th/id/R.13e5ad26acc4510919b6439954c2c116?rik=QeHPaDx4L2DbaQ&riu=http%3a%2f%2fwallpapercave.com%2fwp%2frJJ8m3y.jpg&ehk=x8t%2f8DKGD9B8%2f00SXjgTom6M3duqRf0jgRC12JxMAd0%3d&risl=&pid=ImgRaw&r=0"),
                    fit: BoxFit.fill),
              ),
            ),
          ]),
        ),
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width - 40,
                  height: 250.00,
                  child: Text(""),
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(15.00)),
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://image.winudf.com/v2/image/Y29tLmxpdmVwcm8ud2FsbHBhcGVycy53cDIwMjI4X3NjcmVlbnNob3RzXzRfOTBkY2RjYjM/screen-4.jpg?fakeurl=1&type=.jpg",
                          ),
                          fit: BoxFit.fill)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width - 40,
                  height: 250.00,
                  child: Text(""),
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(15.00)),
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://image.winudf.com/v2/image/Y29tLmxpdmVwcm8ud2FsbHBhcGVycy53cDIwMjI4X3NjcmVlbnNob3RzXzRfOTBkY2RjYjM/screen-4.jpg?fakeurl=1&type=.jpg",
                          ),
                          fit: BoxFit.fill)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width - 40,
                  height: 250.00,
                  child: Text(""),
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(15.00)),
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://image.winudf.com/v2/image/Y29tLmxpdmVwcm8ud2FsbHBhcGVycy53cDIwMjI4X3NjcmVlbnNob3RzXzRfOTBkY2RjYjM/screen-4.jpg?fakeurl=1&type=.jpg",
                          ),
                          fit: BoxFit.fill)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width - 40,
                  height: 250.00,
                  child: Text(""),
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(15.00)),
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://image.winudf.com/v2/image/Y29tLmxpdmVwcm8ud2FsbHBhcGVycy53cDIwMjI4X3NjcmVlbnNob3RzXzRfOTBkY2RjYjM/screen-4.jpg?fakeurl=1&type=.jpg",
                          ),
                          fit: BoxFit.fill)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width - 40,
                  height: 250.00,
                  child: Text(""),
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(15.00)),
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://image.winudf.com/v2/image/Y29tLmxpdmVwcm8ud2FsbHBhcGVycy53cDIwMjI4X3NjcmVlbnNob3RzXzRfOTBkY2RjYjM/screen-4.jpg?fakeurl=1&type=.jpg",
                          ),
                          fit: BoxFit.fill)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width - 40,
                  height: 250.00,
                  child: Text(""),
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(15.00)),
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://image.winudf.com/v2/image/Y29tLmxpdmVwcm8ud2FsbHBhcGVycy53cDIwMjI4X3NjcmVlbnNob3RzXzRfOTBkY2RjYjM/screen-4.jpg?fakeurl=1&type=.jpg",
                          ),
                          fit: BoxFit.fill)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
