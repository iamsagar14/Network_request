import 'package:flutter/material.dart';
import 'package:flutter_network_request/services/person_network_service.dart';

import '../model/person_model.dart';

class HomeScreen extends StatelessWidget {
  final PersonNetworkService personService = PersonNetworkService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'User information ',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1352&q=80"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: FutureBuilder(
            future: personService.fetchPersons(100),
            builder: (BuildContext context,
                AsyncSnapshot<List<PersonModel>> snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Card(
                          color: Colors.black.withOpacity(0.5),
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              var currentPerson = snapshot.data![index];

                              return ListTile(
                                title: Text(currentPerson.name!.toString()),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      currentPerson.picture!.thumbnail),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Phone: ${currentPerson.phone}"),
                                    Text("Email: ${currentPerson.email}"),
                                  ],
                                ),
                                trailing: Column(
                                  children: [
                                    const Icon(
                                      Icons.account_circle,
                                    ),
                                    Text(
                                      "Gender:${currentPerson.gender}",
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }

              if (snapshot.hasError) {
                return const Center(
                    child: Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 82.0,
                ));
              }

              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Loading at the moment, please hold the line.")
                ],
              ));
            },
          ),
        ),
      ),
    );
  }
}
