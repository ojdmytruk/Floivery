import 'package:flutter/material.dart';

class SearchItemScreen extends StatelessWidget {
  const SearchItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cities search"), actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            })
      ]),
      drawer: Drawer(),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final items = ["Aster", "Dahlia", "Peony", "Tulip"];
  final recentItems = ["Aster", "Tulip"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Card(
      color: Colors.green,
      shape: StadiumBorder(),
      child: Center(
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentItems
        : items.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            showResults(context);
          },
          leading: Icon(Icons.location_city),
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )),
      itemCount: suggestionList.length,
    );
  }
}
