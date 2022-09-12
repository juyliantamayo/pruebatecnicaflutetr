import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Detalle extends StatefulWidget {
  final Map detalleData;
  const Detalle({Key? key, required this.detalleData}) : super(key: key);

  @override
  State<Detalle> createState() => _DetalleState();
}

class _DetalleState extends State<Detalle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: const Color.fromRGBO(25, 30, 56, 1),
          title: const Text(
            'alfred®',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
        body: Center(
            child: Card(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(children: [
               SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: const FittedBox(
                  child: Text(
                    "Detalle",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Image.network(widget.detalleData["image"]),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: FittedBox(
                  child: Text(
                    widget.detalleData['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: FittedBox(
                    child: Text(
                      "Gender: "+widget.detalleData['gender'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: FittedBox(
                    child: Text(
                      "origin: "+widget.detalleData['origin']['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: FittedBox(
                    child: Text(
                      "location: "+widget.detalleData['location']['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))
                  ,SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: FittedBox(
                    child: Text(
                      "number of episodes: "+widget.detalleData['episode'].length.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))
            ]),
          ),
        )));
  }
}
