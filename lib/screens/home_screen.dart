import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'nobel_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScreen> {
  Future<List<Map<String, dynamic>>> fetchNobelPrizes() async {
    final response =
    await http.get(Uri.parse('https://irfangul92.github.io/index.json'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON data.
      final jsonData = json.decode(response.body);
      return List<Map<String, dynamic>>.from(jsonData["nobelPrizes"]);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load Nobel Prizes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Noble Price"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: fetchNobelPrizes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ));
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final data = snapshot.data;
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      var nobelPrizes = data[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NobelDetail(
                                        data: nobelPrizes,
                                      ),
                                ));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Icon(Icons.star,
                                    color: Colors.blue, size: 30),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${nobelPrizes['awardYear']}" "-" +
                                          " " "${nobelPrizes['category']}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Data Awarded: " +
                                          '${nobelPrizes['dateAwarded']}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "laureates:" " " +
                                          '${nobelPrizes['laureates'][0]['knownName']}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${nobelPrizes['laureates'][0]['motivation']}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
