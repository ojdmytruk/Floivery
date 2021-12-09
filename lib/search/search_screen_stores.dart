import 'package:flutter/material.dart';

class SearchStoresScreen extends StatelessWidget {
  const SearchStoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stores search"), actions: <Widget>[
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
  final Stores = [
    Store("Flowers 29", 5.0),
    Store("Flowerista", 4.3),
    Store("Flowery", 4.7),
    Store("Donpion", 3.0),
    Store("Camellia", 1.0)
  ];
  final recentStores = [
    Store("Flowers 29", 5.0),
    Store("Flowerista", 4.5),
  ];

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
        ? recentStores
        : Stores.where(
                (p) => p.name.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            showResults(context);
          },
          leading: Icon(Icons.store),
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: suggestionList[index].name.substring(query.length),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
              text: suggestionList[index].name.substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: RichText(
            text: TextSpan(
                text: "Shop's rating: " +
                    suggestionList[index].rating.toString() +
                    " stars",
                style: TextStyle(color: Colors.grey)),
          ),
          trailing:
              suggestionList[index].rating > 4.5 ? Icon(Icons.star) : null),
      itemCount: suggestionList.length,
    );
  }
}

class Store {
  String name;
  double rating;
  Store(this.name, this.rating);
}
