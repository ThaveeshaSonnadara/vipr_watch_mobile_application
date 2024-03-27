import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact {
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber});
}

class SnakeCatchers extends StatelessWidget {

  final List<Contact> contacts = [
    Contact(name: 'Ranidu Thushara\nFrom Colombo', phoneNumber: '0719523132'),
    Contact(name: 'Ramin Randinu\nFrom Matara', phoneNumber: '0710986217'),
    Contact(name: 'Tharusha perera\nFrom Jaffna', phoneNumber: '0710741680'),
    Contact(name: 'Lochana Silva\nFrom trinco ', phoneNumber: '0770806862'),
    Contact(name: 'Lahiru perera\nFrom Kandy', phoneNumber: '0703534142'),
  ];

  SnakeCatchers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.green),
        backgroundColor: Colors.black,
        title: const Text(
          'Snake Catchers Contacts',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return buildButton(context, contacts[index]);
        },
      ),
    );
  }

  Widget buildButton(BuildContext context, Contact contact) {
    return ListTile(
      leading: const Icon(Icons.person, color: Colors.green),
      title: Text(contact.name, style: const TextStyle(color: Colors.white),),
      subtitle: Text(contact.phoneNumber),
      subtitleTextStyle: const TextStyle(color: Colors.green),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.green),borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        child: const Text('Call'),
        onPressed: () async {
          launch('tel:${contact.phoneNumber}');
        },
      ),
    );
  }
}
