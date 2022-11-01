import 'package:coppoppulation/models/poplation_model.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  PageTwo({Key? key, required this.population}) : super(key: key);
  final Population population;

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                      "http://103.74.252.66:8888/",
                      scale: 8),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(
                              'YEAR : ${widget.population.year}',
                              style: TextStyle(fontSize: 32),
                            )),
                        Text(
                          'Nation : ${widget.population.nation}',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 64.0),
              child: Text(
                'Population : ${widget.population.population}',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push();
        },
      ),
    );
  }
}
