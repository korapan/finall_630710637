import 'dart:convert';


import 'package:coppoppulation/models/poplation_model.dart';
import 'package:coppoppulation/population_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PopulationPage extends StatefulWidget {
  const PopulationPage({Key? key}) : super(key: key);

  @override
  State<PopulationPage> createState() => _PopulationPageState();
}

class _PopulationPageState extends State<PopulationPage> {
  List<Population> _populaton = [];
  var _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchPop();
  }

  void _fetchPop() async {
    setState(() {
      _isLoading = true;
    });
    var data = await http.get(Uri.parse(
        "http://103.74.252.66:8888/"));
    var jsonBody = json.decode(data.body)['data'];
    //var jsonData

    for (int j = 0; j < jsonBody.length; j++) {
      _populaton.add(Population(
          year: int.parse(jsonBody[j]['Year']),
          nation: jsonBody[j]['Nation'],
          population: jsonBody[j]['Population']));
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset('assets/images/logo.jpg',width: 100,height: 50)),
      ),
      body: Stack(

        children: [
          if (_isLoading) const Center(child: CircularProgressIndicator()),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return PopulationCard(population: _populaton[index]);
                    },
                    itemCount: _populaton.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
