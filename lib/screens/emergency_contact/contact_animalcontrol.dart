import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactAnimalControlScreen extends StatefulWidget {
  const ContactAnimalControlScreen({super.key});

  @override
  State<ContactAnimalControlScreen> createState() =>
      _ContactAnimalControlScreenState();
}

class _ContactAnimalControlScreenState
    extends State<ContactAnimalControlScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Animal Control'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: buildButton(),
      ),
    );
  }

  Widget buildButton() {
    final catcherContact01 = '+947701234567';
    final catcherContact02 = '+947743214567';
    final catcherContact03 = '+947700987654';

    return ListTile(
      title: const Text('Ronath Tharana'),
      subtitle: Text(catcherContact01),
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(''),
      ),
      trailing:
      TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.black,
        ),
        child: const Text(
          'Call',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          launch('tel://$catcherContact01');

          // await FlutterPhoneDirectCaller.callNumber(catcherContact01);
        },
      ),
    );
  }
}
