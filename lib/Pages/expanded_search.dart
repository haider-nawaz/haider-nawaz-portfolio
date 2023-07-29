//demo expanded search using the animations package
// when a user clicks on a search icon, the search bar expands and the icons changes to a close icon
// when a user clicks on the search icon again, the search bar collapses and the icons changes to a search icon
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class ExpandedSearch extends StatefulWidget {
  const ExpandedSearch({Key? key}) : super(key: key);

  @override
  _ExpandedSearchState createState() => _ExpandedSearchState();
}

class _ExpandedSearchState extends State<ExpandedSearch> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded Search'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Expanded Search Demo'),
            const SizedBox(height: 20),
            OpenContainer(
              transitionDuration: const Duration(milliseconds: 500),
              transitionType: ContainerTransitionType.fadeThrough,
              openBuilder: (context, _) {
                return const Text("");
              },
              closedBuilder: (context, openContainer) {
                return IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: openContainer,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
