import 'package:flutter/material.dart';

import '../widgets/custom_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScreen(
      displayAppBar: true,
      child: Center(
        child: Text('Search Screen'),
      ),
    );
  }
}