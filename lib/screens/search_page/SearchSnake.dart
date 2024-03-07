import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vipr_watch_mobile_application/screens/species_details/species_details.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String name = "not searched";
  List snakeDetail = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
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
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Snake details and treatments")
                .snapshots(),
            builder: (context, snapshots) {
              return (snapshots.connectionState == ConnectionState.waiting)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: snapshots.data?.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshots.data!.docs[index].data()
                            as Map<String, dynamic>;

                        if (name == "not searched") {
                          gettingSnakeDetails();
                          return ListView(
                              padding:
                                  const EdgeInsets.only(left: 3.0, right: 3.0),
                              children: [
                                ListTile(
                                  onTap: () async {
                                    name = data['Snake Name'];
                                    gettingSnakeDetails();
                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SnakeSpeciesDetailsScreen(
                                                  identifiedSnakeDetails:
                                                      snakeDetail,
                                                )));
                                  },
                                  title: Text(
                                    data['Snake Name'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    data['Snake Scientific Name'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  leading: CircleAvatar(
                                    radius: 24,
                                    backgroundImage:
                                        NetworkImage(data['img_url']),
                                  ),
                                ),
                              ]);
                        } else {
                          if (data['Snake Name'].toString().startsWith(name) &&
                              name != "not searched") {
                            gettingSnakeDetails();
                            return ListTile(
                              onTap: () async {
                                name = data['Snake Name'];
                                gettingSnakeDetails();

                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SnakeSpeciesDetailsScreen(
                                              identifiedSnakeDetails:
                                                  snakeDetail,
                                            )));
                              },
                              title: Text(
                                data['Snake Name'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                data['Snake Scientific Name'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              leading: CircleAvatar(
                                radius: 24,
                                backgroundImage: NetworkImage(data['img_url']),
                              ),
                            );
                          }
                        }
                        return null;
                      });
            }));
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
}
