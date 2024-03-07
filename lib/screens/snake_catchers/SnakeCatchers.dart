import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact {
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber});
}

class SnakeCatchers extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'Lebron james from Colombo', phoneNumber: '0719523132'),
    Contact(name: 'Anthony Davis from Matara', phoneNumber: '0710986217'),
    Contact(name: 'Kyrie irving from Jaffna', phoneNumber: '0710741680'),
    Contact(name: 'kobe brayant from Trinco ', phoneNumber: '0770806862'),
    Contact(name: 'Stehen Curry from Kandy', phoneNumber: '0703534142'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.green),
        backgroundColor: Colors.black,
        title: Text(
          'Snake Catchers Contact Details',
          style: TextStyle(color: Colors.green),
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
      title: Text(contact.name, style: TextStyle(color: Colors.white),),
      subtitle: Text(contact.phoneNumber),
      subtitleTextStyle: TextStyle(color: Colors.green),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.green),
          ),
        ),
        child: Text('Call'),
        onPressed: () async {
          launch('tel:${contact.phoneNumber}');
        },
      ),
    );
  }
}
