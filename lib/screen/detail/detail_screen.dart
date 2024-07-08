import 'package:demo_application/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../model/freez/freez.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.person});

  final Person person;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: widget.person.id.toString(),
            child: CircularImage(imageUrl: widget.person.profile),
          ),
          ListTile(
            title: const Text('Name'),
            subtitle: Text('${widget.person.firstname} ${widget.person.lastname}'),
            leading: const Icon(Icons.person_3),
          ),
          ListTile(
            title: const Text('Email Id'),
            subtitle: Text(widget.person.email),
            leading: const Icon(Icons.email),
          ),
        ],
      ),
    );
  }
}
