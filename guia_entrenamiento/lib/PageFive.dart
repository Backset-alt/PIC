import 'package:flutter/material.dart';
import 'package:guia_entrenamiento/PageSix.dart';

class PageFive extends StatefulWidget {
  PageFive() : super();
  final String title = "DropDown Demo";
  @override
  PageFiveState createState() => PageFiveState();
}

class Training {
  int id;
  String name;

  Training(this.id, this.name);

  static List<Training> getTrainings() {
    return <Training>[
      Training(1, 'Fuerza'),
      Training(2, 'Inicial'),
      Training(3, 'AMRAP'),
      Training(4, 'EMOM'),
      Training(5, 'Tabata'),
      Training(6, 'Sin tiempo'),
    ];
  }
}

class PageFiveState extends State<PageFive> {
  //
  List<Training> _trainings = Training.getTrainings();
  List<DropdownMenuItem<Training>> _dropdownMenuItems;
  Training _selectedTraining;

  int _selectedIndex = 0;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_trainings);
    _selectedTraining = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Training>> buildDropdownMenuItems(List trainingies) {
    List<DropdownMenuItem<Training>> items = List();
    for (Training training in trainingies) {
      items.add(
        DropdownMenuItem(
          value: training,
          child: Text(training.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Training selectedTraining) {
    setState(() {
      _selectedTraining = selectedTraining;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          title: new Text(
            "Guía digital de entrenamiento físico",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: Image.asset(
            'assets/images/logo.png',
            height: 25,
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Escoja el tipo de Entrenamiento",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButton(
                  value: _selectedTraining,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.45,
                      right: MediaQuery.of(context).size.width * 0.45),
                  child: FlatButton(
                    color: Colors.transparent,
                    //splashColor: Colors.black26,
                    onPressed: () {
                      _nextPage(context);
                    },
                    child: Text(
                      '" "',
                      style: TextStyle(color: Colors.transparent, fontSize: 5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.navigate_before),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.navigate_next),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  _nextPage(BuildContext context) {
    final route = MaterialPageRoute(builder: (BuildContext context) {
      return PageSix();
    });
    Navigator.of(context).push(route);
  }
}
