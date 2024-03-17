import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vipr_watch_mobile_application/screens/species_details/species_details.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Card(
          child: TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Search...",
            ),
            onChanged: (val) {
              setState(() {
                name = val.toLowerCase();
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Snake details and treatments")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final snakes = snapshot.data!.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();

          List<Map<String, dynamic>> filteredSnakes = [];
          if (name.isEmpty) {
            filteredSnakes = List.from(snakes);
          } else {
            filteredSnakes = snakes
                .where((snake) =>
                snake['Snake Name'].toString().toLowerCase().contains(name))
                .toList();
          }

          return ListView.builder(
            itemCount: filteredSnakes.length,
            itemBuilder: (context, index) {
              final snake = filteredSnakes[index];

              return ListTile(
                onTap: () async {
                  await getIdentifiedSnakeDetails(snake);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SnakeSpeciesDetailsScreen(
                        identifiedSnakeDetails: snakeDetail,
                      ),
                    ),
                  );
                },
                title: Text(
                  snake['Snake Name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  snake['Snake Scientific Name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(snake['img_url']),
                ),
              );
            },
          );
        },
      ),
    );
  }

  List<String> snakeDetail = [];

  Future<void> getIdentifiedSnakeDetails(Map<String, dynamic> snake) async {
    QuerySnapshot<Map<String, dynamic>> snap = await FirebaseFirestore.instance
        .collection('Snake details and treatments')
        .where('Snake Name', isEqualTo: snake['Snake Name'])
        .get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> snakeInfo = snap.docs;
    if (snakeInfo.isNotEmpty) {
      setState(() {
        var identifiedDetails = snakeInfo[0].data();
        snakeDetail = [
          identifiedDetails['Snake Name'] ?? 'on data',
          identifiedDetails['Snake Scientific Name'] ?? 'on data',
          identifiedDetails['Snake Sinhala Name'] ?? 'on data',
          identifiedDetails['Venomous Type'] ?? 'on data',
          identifiedDetails['Details'] ?? 'on data',
          identifiedDetails['Medical Treatments'] ?? 'on data',
          identifiedDetails['img_url'] ??
              'https://imageresizer.furnituredealer.net/img/remote/images.furnituredealer.net/img/commonimages%2Fitem-placeholder.jpg?width=480&scale=both&trim.threshold=80&trim.percentpadding=15',
        ];
      });
    }
  }
}
