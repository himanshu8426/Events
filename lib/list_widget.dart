import 'package:flutter/material.dart';


import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:events/user_data.dart';
import 'package:events/loader.dart';

class ListWidget extends StatefulWidget{

  //ListWidget({Key key, this.title}): super(key:key);

  final String title ='listiew';


  @override
  _ListWidget createState() => new _ListWidget();

}

class _ListWidget extends State<ListWidget>{

  Future<List<User>> _getUsers() async {

    var data = await http.get('https://next.json-generator.com/api/json/get/NyydNQ_m8');

    var jsonData = json.decode(data.body);

    List<User> users = [];

    for(var u in jsonData){
      User user = User(u["index"], u["picture"], u["name"], u["company"], u["website"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    appBar: new AppBar(
      title: new Text(widget.title),
    ),
    body: Container(
      child: FutureBuilder(
        future: _getUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.data == null)
            {
              return Scaffold(
                body: new Center(
                  child: ColorLoader5(),
                ),
              );
            }
            else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      snapshot.data[index].picture
                    ),
                  ),
                  title: Text(snapshot.data[index].name),
                  subtitle: Text(snapshot.data[index].website),
                  onTap: (){
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context)=> DetailsPage(snapshot.data[index]))
                    );
                  },
                );
              },
            );
          }
        }
      ),

    ),
    );
  }



}

class DetailsPage extends StatelessWidget {

  final User user;

  DetailsPage(this.user);

  @override
  Widget build(BuildContext context) {
    //print(user);
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
    );
  }
}
