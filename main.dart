import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test project for food",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHomePage(),
    );
  }
}

class AdContent {
  late String imagePath;
  late String restaurantName;
  late String itemDescription;
  late String distance;

  AdContent(String picture, String name, String description, String distance) {
    this.imagePath = picture;
    this.restaurantName = name;
    this.itemDescription = description;
    this.distance = distance;
  }

  String getPictureLocation() {
    return this.imagePath;
  }

  String getName() {
    return this.restaurantName;
  }

  String getDescription() {
    return this.itemDescription;
  }

  String getDistance() {
    return this.distance;
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List ads = <AdContent>[
    AdContent(
        '../images/example1.jpg',
        "Chikm",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        "15km"),
    AdContent(
        '../images/example2.jpg',
        "Pancek",
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
        "55km"),
    AdContent(
        '../images/example3.jpg',
        "Borgr",
        "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.",
        "65km")
  ];

  bool isPressed = false;
  int index = 0;

  void incrementIndex() {
    setState(() {
      ads.insert(
          ++index,
          AdContent(
              '../images/example2.jpg',
              "Pancek",
              "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
              "55km"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[150],
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.5, vertical: 8.0),
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(50, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search postings...",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
        body: Scaffold(
          body: ListView(
            children: <Widget>[
              ListTile(
                leading: ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 64,
                        maxHeight: 64),
                    child: Image.asset(ads[index].getPictureLocation(),
                        fit: BoxFit.cover)),
                title: Text(ads[index].getName()),
                subtitle: Text(ads[index].getDistance()),
                trailing: FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        insetPadding: EdgeInsets.all(16.0),
                        title: Text("Learn more.."),
                        content: Text(ads[index].getDescription()),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("Close"),
                          ),
                        ],
                      ),
                    );
                  },
                  tooltip: "Learn more",
                  child: Icon(Icons.arrow_right),
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: incrementIndex,
            tooltip: 'Add new post',
            child: Icon(Icons.add),
          ),
        ));
  }
}
