import 'dart:convert';
import 'package:flutter_network_request/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_network_request/model/person.dar.dart';

const String randomPersonURl = "https://randomuser.me/api/";

class PersonNetworkService {
  Future<List<Person>> fetchPersons(int amount) async {
    http.Response response =
        await http.get(Uri.parse("$randomPersonURl?results=$amount"));
    if (response.statusCode == 200) {
      Map peopleData = jsonDecode(response.body);
      List<dynamic> peoples = peopleData["results"];
      return peoples.map((json) => Person.fromJson(json)).toList();
    } else {
      throw Exception("something went wrong ,${response.statusCode}");
    }
  }
}
