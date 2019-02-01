import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  Event({this.title, this.imagePath, this.child});

  final String title;
  final String imagePath;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new Card(
      margin: EdgeInsets.all(12.0),
      elevation: 8.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new DefaultTextStyle(
              style: Theme.of(context).textTheme.subhead,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: new Text(
                  title,
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final TextEditingController _nameDialogTextController =
      new TextEditingController();

  @override
  void dispose() {
    _nameDialogTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = new List<Widget>();
    for (var i = 1; i >= 10; i++) {
      Event event = new Event(
        title: "event " + i.toString(),
      );
      widgets.add(event);
    }
    final list = [1, 2, 3, 4, 5, 6];
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.yellow, Colors.pink],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new CustomScrollView(
            slivers: <Widget>[
              new SliverAppBar(
                backgroundColor: Colors.transparent,
                title: new Text('Info'),
              ),
              new SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                    return Event(title: 'Event '+index.toString(),);
                  }, childCount: 10)
              )
            ],
          ),
        ),
      ),
    );
  }
}
