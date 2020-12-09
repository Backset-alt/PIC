import 'package:flutter/material.dart';

class DropDownFive extends StatefulWidget {
  DropDownFive() : super();
  final String title = "DropDown Demo";
  @override
  DropDownFiveState createState() => DropDownFiveState();
}

class Training {
  int id;
  String name;

  Training(this.id, this.name);

  static List<Training> getTrainings() {
    return <Training>[
      Training(1, 'Macrociclo'),
      Training(2, 'Mesociclo'),
      Training(3, 'Microciclo'),
    ];
  }
}

class DropDownFiveState extends State<DropDownFive> {
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
      home: new Scaffold(
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
                SizedBox(
                  height: 50.0,
                ),
                Text("Escoja el timepo del ciclo"),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButton(
                  value: _selectedTraining,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Selected: ${_selectedTraining.name}'),
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {},
                  child:
                      const Text('Siguiente', style: TextStyle(fontSize: 20)),
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
}