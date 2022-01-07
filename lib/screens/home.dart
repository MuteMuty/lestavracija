import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:convert/convert.dart' as convert;
import 'dart:convert';

import 'package:lestavracija/screens/restaurant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //Navigator.pushNamed(context, '/restaurant');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RestaurantScreen(),
                  // Pass the arguments as part of the RouteSettings. The
                  // DetailScreen reads the arguments from these settings.
                  settings: RouteSettings(
                    arguments: restaurants[index],
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              shadowColor: Colors.blueGrey[700],
              elevation: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Image.asset('assets/images/slika.jpg'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${restaurants[index]['naziv']}',
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        Text('${restaurants[index]['naslov']}'),
                        Text('Tel.: ${restaurants[index]['telefon']}'),
                        const SizedBox(
                          width: 80,
                          height: 30,
                          child: Card(
                            color: Colors.green,
                            child: Center(child: Text('Prosto')),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // je treba popravit CORS ne dela
  getRestaurants() async {
    /*
    var response = await http.get(
        Uri.parse('https://aqueous-coast-11883.herokuapp.com/restaurants'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  */
  }
}
