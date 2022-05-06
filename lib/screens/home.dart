import 'package:digital_alarm_app/screens/clock.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: CustomScrollView(
        reverse: false,
        slivers: <Widget>[
          SliverAppBar(
            bottom: AppBar(
              backgroundColor: Colors.teal,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "07:89 pm",
                style: TextStyle(fontSize: 34),
              ),
            ),
            pinned: true,
            expandedHeight: 500.0,
            backgroundColor: Colors.teal,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              centerTitle: true,
              background: Container(
                child: ClockView(
                  size: 100,
                ),
              ),
            ),
            actions: <Widget>[
              appbarButtons(title: 'Alarm'),
              appbarButtons(title: 'Clock'),
              appbarButtons(title: 'Timer'),
              appbarButtons(title: 'Stopwatch'),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  dense: true,
                  leading: Container(
                    padding: EdgeInsets.all(8),
                    width: 100,
                    child: Row(
                      children: [
                        Text('2:20'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'AM',
                          style: TextStyle(color: Colors.grey),
                        ),
                        VerticalDivider(
                          color: Colors.grey[150],
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Everyday ${index + 1}',
                            textScaleFactor: 0.9,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'Off',
                            textScaleFactor: 0.9,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Switch(value: false, onChanged: null),
                    ],
                  ),
                );
              },
              childCount: 30,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 34,
          color: Colors.grey[50],
        ),
      ),
    );
  }

  Padding appbarButtons({required String title}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: MaterialButton(
        onPressed: () {
          print('clicked');
        },
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
