import 'package:days_challange/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Home"),
            pinned: true,
            floating: true,
            stretch: true,
            leading: IconButton(
              onPressed: (){},
              icon: Icon(Icons.sort),
            ),

            expandedHeight: MediaQuery.of(context).size.height*.3,
            flexibleSpace: Container(
              decoration: BoxDecoration(

              ),

              height: MediaQuery.of(context).size.height*.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hii",style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black),),
                  Text("Good Morning",style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black),),

                ],
              ),
            ),
          ),
          SliverGrid(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10
          ),delegate: SliverChildBuilderDelegate((cxt,ind)=>buildSingleTile()),)

        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSingleItem("sds", Icons.home, selectedIndex==0,0),
            SizedBox(width: 30),
            buildSingleItem("ssddfd", Icons.account_circle_rounded, selectedIndex==1,1),
            SizedBox(width: 30,),
            buildSingleItem("sdsa", Icons.star, selectedIndex==2,2),
          ],
        ),
      ),
    );
  }


  buildSingleItem(title,icon,bool selected,index)
  {
    return FloatingActionButton(
        heroTag: title,
        backgroundColor: selected?primary:Colors.white,
        child: Icon(icon,color: selected?Colors.white:Colors.grey,),
        onPressed: (){
          selectedIndex = index;
          setState(() {

          });
        }
        );

  }

  Widget buildSingleTile()
  {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("1/25"),
          Icon(Icons.book,color: primary,size: 80,),
          Text("task name",style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black),)
        ],
      )
    );
  }

}
