import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pruebatecnicaflutetr/Pages/detalle.page.dart';
import 'package:pruebatecnicaflutetr/Services/characters.service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data = [];
  String? next = null;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    obtenerInformacion();
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = 200.0; // or something else..
      if (maxScroll - currentScroll <= delta) {
        // whatever you determine here
        obtenerInformacion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(25, 30, 56, 1),
          title: const Text(
            'alfred®',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
        body: SingleChildScrollView(
            controller: _scrollController,
            child: data.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: data.map((element) {
                      return Center(
                          child: Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height / 35),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          children: [
                            Image.network(element["image"],
                                width:
                                    (MediaQuery.of(context).size.width * 0.9) /
                                        2.1),
                            Card(
                              child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width: (MediaQuery.of(context).size.width *
                                          0.9) /
                                      2,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9) /
                                              2.3,
                                          child: Text(
                                            element['name'],
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                      SizedBox(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9) /
                                              2.3,
                                          child: Text(element['status'],
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ))),
                                      SizedBox(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9) /
                                              2.3,
                                          child: Text(element['species'],
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ))),
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                10,
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                    0.9) /
                                                2.3,
                                        child: TextButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    const Color.fromRGBO(
                                                        221, 251, 47, 1)),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Detalle(
                                                        detalleData: element,
                                                      )),
                                            );
                                          },
                                          child: const Text(
                                            'Detalle',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ));
                    }).toList(),
                  )));
  }

  obtenerInformacion() {
    CharactersService.getCharacter(next)
        .then((value) => {
              setState(() {
                next = json.decode(value.body)['info']['next'];
                data.addAll(json.decode(value.body)['results']);
              })
            })
        .onError((error, stackTrace) => {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(error.toString()),
              ))
            });
  }
}
