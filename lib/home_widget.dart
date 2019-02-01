import 'package:flutter/material.dart';
import 'package:events/placeholder_widget.dart';
import 'package:events/list_widget.dart';
import 'package:events/events.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _HomeState();
  }
}


class _HomeState extends State<Home>{

  int _currentIndex = 0;
  final List<Widget> _children = [
    EventsPage(),
    PlaceholderWidget(Colors.deepOrange),
    //SnackBarDemo('You Clicked on'),
    ListWidget(),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.deepOrange),
    //PlaceholderWidget(Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //appBar: AppBar(
      //  title: Text('Events'),
      //  //backgroundColor: ,
      //),
      body: _children[_currentIndex],
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.black,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.lightBlueAccent,
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.lightBlueAccent))),
        child: new BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: _currentIndex,

          items: [
            BottomNavigationBarItem(
                
                
                icon: new Icon(Icons.event_note, size: 28, color: Colors.grey[300],),
                backgroundColor: Colors.teal,
                activeIcon: Icon(Icons.event_note, size:28, color: Colors.redAccent,),
                title: Text(
                  'Events',
                  style: TextStyle(fontWeight: FontWeight.w300, color: Colors.redAccent),
                )
                
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.search, size: 28, color: Colors.grey[300]),
                activeIcon: Icon(Icons.search, size:28, color: Colors.redAccent,),
              backgroundColor: Colors.blueAccent,
                title: Text(
                  'Search',
                  style: TextStyle(fontWeight: FontWeight.w100, color: Colors.redAccent),
                )
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.control_point, size: 28, color: Colors.grey[300]),
                activeIcon: Icon(Icons.control_point, size:28, color: Colors.redAccent,),
                title: Text(
                  'Create',
                  style: TextStyle(fontWeight: FontWeight.w100, color: Colors.redAccent),
                )//title: Container(height: 0.0)
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.favorite, size: 28, color: Colors.grey[300]),
                activeIcon: Icon(Icons.favorite, size:28, color: Colors.redAccent,),
                title: Text(
                  'saved',
                  style: TextStyle(fontWeight: FontWeight.w100, color: Colors.redAccent),
                )
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size:28, color: Colors.grey[300]),
                activeIcon: Icon(Icons.person, size:28, color: Colors.redAccent,),
                title: Text(
                  'Profile',
                  style: TextStyle(fontWeight: FontWeight.w100, color: Colors.redAccent),
                )//title: Container(height: 0.0)
            )

          ],
        ),
      ),
    );

  }



  void onTapTapped(int index) {

    setState(() {
      _currentIndex = index;
    });
  }
}