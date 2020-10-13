import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:days_challange/Screens/daysScreen.dart';
import 'package:days_challange/Widgets/AppDrawer.dart';
import 'package:days_challange/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Home"),
            centerTitle: true,
            pinned: true,
            stretch: true,
            floating: true,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
              icon: Icon(Icons.sort),
            ),
            expandedHeight: MediaQuery.of(context).size.height * .25,
            flexibleSpace: Container(
              decoration: BoxDecoration(),
              height: MediaQuery.of(context).size.height * .4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotateAnimatedTextKit(
                        text: [
                          "Hii",
                          "Ranveer",
                          "Good Morning",
                          "Nice to meet you Again"
                        ],
                        textStyle: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TypewriterAnimatedTextKit(
                      text: [
                        "It is not enough to do your best you must know what to do, and then do your best"
                      ],
                      textStyle: Theme.of(context).textTheme.headline5.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate(
                (cxt, ind) => buildSingleTile(onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DaysScreen()));
                    }),
                childCount: 15),
          )
        ],
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildSingleItem(
              Icons.home,
              selectedIndex == 0,
              0,
              elevation: 10.0,
            ),
            buildSingleItem(Icons.account_circle, selectedIndex == 1, 1,
                elevation: 10.0),
            buildSingleItem(Icons.star, selectedIndex == 2, 2, elevation: 10.0),
          ],
        ),
      ),
    );
  }

  buildSingleItem(icon, bool selected, index, {elevation}) {
    return FloatingActionButton(
        focusColor: Colors.yellowAccent,
        foregroundColor: Colors.yellowAccent,
        elevation: selected ? elevation : 2,
        highlightElevation: elevation,
        isExtended: true,
        heroTag: index,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
              color: selected ? Colors.red : Colors.black12,
              width: .4,
              style: BorderStyle.solid),
        ),
        backgroundColor: selected ? primary : Colors.grey.shade100,
        child: Icon(
          icon,
          color: selected ? Colors.white : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            selectedIndex = index;
          });
        });
  }




  Widget buildSingleTile({onPress}) {
    return InkWell(
      onTap: onPress,
      child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children : [
              Text(
                "task name",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black),
              )


              ,Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.book,
                    color: primary,
                    size: 80,
                  ),


                  Expanded(
                    child : LinearProgressIndicator(
                      value : .5
                    )
                  ),


                ],
              )
            ]
          )),
    );
  }
}
