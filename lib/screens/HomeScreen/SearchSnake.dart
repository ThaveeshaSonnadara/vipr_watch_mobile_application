import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vipr_watch_mobile_application/screens/species_details/species_details.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String name;
  List snakeDetail = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> gettingSnakeDetails() async {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection("Snake details and treatments")
        .where('Snake Name', isEqualTo: name)
        .get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> snakes = data.docs;
    if (snakes.isNotEmpty) {
      setState(() {
        var searchedSnake = snakes[0].data();
        snakeDetail = [
          name,
          searchedSnake['Snake Scientific Name'] ?? 'on data',
          searchedSnake['Snake Sinhala Name'] ?? 'on data',
          searchedSnake['Venomous Type'] ?? 'on data',
          searchedSnake['Details'] ?? 'on data',
          searchedSnake['Medical Treatments'] ?? 'on data',
          searchedSnake['img_url'] ??
              'https://imageresizer.furnituredealer.net/img/remote/images.furnituredealer.net/img/commonimages%2Fitem-placeholder.jpg?width=480&scale=both&trim.threshold=80&trim.percentpadding=15',
        ];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Card(
          child: TextField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: "search..."),
            onChanged: (val) {
              setState(() {
                name = val.toLowerCase();
              });
            },
          ),
        )),
        body: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.only(left: 3.0, right: 3.0),
          // children: [
          //   if (nearbyPlacesResponse.results != null)
          //     for (int i = 0; i < nearbyPlacesResponse.results!.length; i++)
          //       nearbyPlacesWidget(nearbyPlacesResponse.results![i]),
          //   if (snakeDetail.results == null)
          //     // const Padding(
          //     //   padding: EdgeInsets.all(8.0),
          //     //   child: Center(
          //     //     child: Text("No nearby places found"),
          //     //   ),
          //     // )
          //
          //     for (int i = 0; i < 4; i++)
          //       Card(
          //         color: Colors.black54,
          //         child: ListTile(
          //           title: const Text(
          //             "Hospital Name",
          //             style: TextStyle(color: Colors.white),
          //           ),
          //           subtitle: const Text(
          //             "Address",
          //             style: TextStyle(color: Colors.white70),
          //           ),
          //           trailing: IconButton(
          //             highlightColor: Colors.white54,
          //             icon: const Icon(
          //               color: Colors.white70,
          //               Icons.chevron_right,
          //               size: 30,
          //             ),
          //             onPressed: () {},
          //           ),
          //           leading: const Icon(
          //             Icons.image_outlined,
          //             size: 30,
          //             color: Colors.white70,
          //           ),
          //           onTap: () {},
          //         ),
          //       )
          // ],
        ));
}
