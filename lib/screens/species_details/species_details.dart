import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vipr_watch_mobile_application/screens/species_details/snake_details.dart';
import '../../widgets/emergency_menu.dart';
import '../../widgets/navigation_menu.dart';
import 'firstaid_details.dart';

class SnakeSpeciesDetailsScreen extends StatefulWidget {
  const SnakeSpeciesDetailsScreen(
      {super.key, required this.identifiedSnakeDetails});

  final List identifiedSnakeDetails;

  @override
  State<SnakeSpeciesDetailsScreen> createState() =>
      _SnakeSpeciesDetailsScreenState();
}

class _SnakeSpeciesDetailsScreenState extends State<SnakeSpeciesDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, animationDuration: const Duration(milliseconds: 700), vsync: this,);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: const EmergencyMenu(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            print(widget.identifiedSnakeDetails);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const NavigationMenu())); // Implement the back button functionality
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.green.shade100,
                        ),
                        controller: tabController,
                        tabs: const [
                          Tab(
                            text: 'Snake Details',
                          ),
                          Tab(
                            text: 'First Aid',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    SnakeDetailsTab(identifiedSnakeDetails: widget.identifiedSnakeDetails,),
                    FirstAidDetailsTab(identifiedSnakeDetails: widget.identifiedSnakeDetails,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
