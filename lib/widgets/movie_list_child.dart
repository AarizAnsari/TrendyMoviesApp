// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:trendy_movies_app/routes/routes_name.dart';

class MovieListChild extends StatelessWidget {
  final String? url;
  final String? title;
  final String? desc;
  final int? id;

  const MovieListChild(
      {Key? key, required this.url, required this.title, required this.desc, required this.id})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RoutesName.details, arguments:id);
        },
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: Colors.black),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(url.toString(), width: 120),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 155,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title.toString(),
                          overflow: TextOverflow.fade,
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: Colors.grey),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    desc.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
