import 'package:flutter/material.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  var restaurants = [
    {
      "rid": 3,
      "naziv": "Restavracija1",
      "naslov": "Zgornji Duplek 12 2121 Duplek",
      "telefon": "31231123"
    },
    {
      "rid": 4,
      "naziv": "Restavracija2",
      "naslov": "Spodnji Duplek 13 2121 Duplek",
      "telefon": "31132231"
    }
  ];

  var users = [
    {
      "uid": 1,
      "ime": "Erik",
      "priimek": "Pahor",
      "telefon": "342125785",
      "mail": "erko.erka1@gmail.com"
    },
    {
      "uid": 2,
      "ime": "Tomi",
      "priimek": "Rupnik",
      "telefon": "41745362",
      "mail": "cptcac@gmail.com"
    },
    {
      "uid": 3,
      "ime": "Zln",
      "priimek": "Nusdorfer",
      "telefon": "51432897",
      "mail": "zln@gmail.com"
    }
  ];

  var tables = [
    {"mid": 5, "rid": 3, "st_mize": 1, "st_stolov": 4},
    {"mid": 6, "rid": 3, "st_mize": 2, "st_stolov": 4},
    {"mid": 7, "rid": 3, "st_mize": 3, "st_stolov": 4},
    {"mid": 8, "rid": 3, "st_mize": 4, "st_stolov": 2},
    {"mid": 9, "rid": 3, "st_mize": 5, "st_stolov": 2},
    {"mid": 10, "rid": 3, "st_mize": 6, "st_stolov": 6},
    {"mid": 11, "rid": 4, "st_mize": 1, "st_stolov": 4},
    {"mid": 12, "rid": 4, "st_mize": 2, "st_stolov": 4},
    {"mid": 13, "rid": 4, "st_mize": 3, "st_stolov": 2},
    {"mid": 14, "rid": 4, "st_mize": 4, "st_stolov": 2},
    {"mid": 15, "rid": 4, "st_mize": 5, "st_stolov": 2}
  ];

  var reservations = [
    {
      "datum": "2022-01-14T19:00:00.000Z",
      "status": "rezervirano",
      "uid": 1,
      "mid": 5
    },
    {
      "datum": "2022-01-12T12:00:00.000Z",
      "status": "rezervirano",
      "uid": 2,
      "mid": 5
    }
  ];

  DateTime picked = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(title: Text('${data['naziv']}')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () => pickDate(context),
              child: Text(picked.toString().split(' ')[0]),
            ),
            Text('Prosti termini'),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _myWidget())
          ],
        ),
      ),
    );
  }

  List<ElevatedButton> _myWidget() {
    int hourNow = DateTime.now().hour;
    int minuteNow = DateTime.now().minute > 29 ? 30 : 00;
    return List.generate(
      (22 - hourNow) * 2,
      (i) => ElevatedButton(
        onPressed: () {},
        child: Text(
            '${(hourNow + i ~/ 2)}:${i % 2 == 0 ? (minuteNow == 0 ? '00' : minuteNow) : (minuteNow != 0 ? '00' : minuteNow)}'),
      ),
    );
  }

  Future pickDate(context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    setState(() {
      picked = newDate ?? picked;
    });
  }
}
