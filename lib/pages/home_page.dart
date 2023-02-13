import 'package:coffee_app/utils/coffee_tiles.dart';
import 'package:coffee_app/utils/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List coffeeType = [
    'Cappucino' , true,
    'Latte' ,false ,
    'Black' , false,
    'Sugar' , false,


  ];


  void coffeeTypeSelected(int index){
    setState(() {
      coffeeType[index][1] = 1;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 35.0),
              child: Icon(Icons.person),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications')
        ]),
        body: Column(
          //find best coffee for you

          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Text("Find the best coffee for you",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 56,
                    ))),
            const SizedBox(
              height: 25.0,
            ),

            //search bar

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Find your coffee...",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            // horizontal listview of coffee types
            Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal  ,
                itemCount: coffeeType.length,
                itemBuilder: (context,index){
                return CoffeeType(
                coffeeType: coffeeType[index][0],
                isSelected: coffeeType[index][1],
                onTap: (){
                  coffeeTypeSelected(index);  
                },);
              },)
              //color: Colors.red,
            ),

            //horizontal listview of coffee titles
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:[CoffeeTile()],
              ),
            )
          ],
        ));
  }
}
