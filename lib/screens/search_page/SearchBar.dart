import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String name;
  List snakeDetail = [];

  // late Future<QuerySnapshot<Map<String, dynamic>>> data = FirebaseFirestore.instance
  //       .collection("Snake details and treatments")
  //       .where("Snake Name", isEqualTo: name)
  //       .get();
  //
  //   List<QueryDocumentSnapshot<Map<String, dynamic>>> snakeInfo = data.docs;
  //   if (snakeInfo.isNotEmpty) {
  //     setState(() {
  //       var identifiedDetails = snakeInfo[0].data();
  //       identifiedSnakeDetails = [
  //         SnakeList,
  //         identifiedDetails['Snake Scientific Name'] ?? 'on data',
  //         identifiedDetails['Snake Sinhala Name'] ?? 'on data',
  //         identifiedDetails['Venomous Type'] ?? 'on data',
  //         identifiedDetails['Details'] ?? 'on data',
  //         identifiedDetails['Medical Treatments'] ?? 'on data',
  //         identifiedDetails['img_url'] ??
  //             'https://imageresizer.furnituredealer.net/img/remote/images.furnituredealer.net/img/commonimages%2Fitem-placeholder.jpg?width=480&scale=both&trim.threshold=80&trim.percentpadding=15',
  //       ];
  //     });
  //   }

  @override
  void initState() {
    // TODO: implement initState
    gettingSnakeDetails();
    super.initState();
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
                name = val;
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

                        if (name.isEmpty) {
                          return ListTile(
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
                        if (data['Snake Name'].toString().startsWith(name)) {
                          return ListTile(
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
                        return Container();
                      });
            }));
  }

  Future<void> gettingSnakeDetails() async {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection("Snake details and treatments")
        .where('Snake name', isEqualTo: name)
        .get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> snakes = data.docs;
    if (snakes.isNotEmpty) {
      setState(() {
        var searchedSnake = snakes[0].data();
        snakeDetail = [
          name,
          searchedSnake['image'],
          searchedSnake['Details'] ?? '',
          searchedSnake['scientific Name'] ?? ''
        ];
      });
    }
  }
}
