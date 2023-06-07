import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {
List<String> searchTerms = [
      "Nike",
      "Addidas",
      "Jordan",
      "Reebok",
      "Puma",
    ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        query= "";
      }, icon:const Icon(Icons.clear))
    ];
    
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, null);
    }, icon: const Icon(Icons.arrow_back));
 
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String>matchQuery =[];
 for (var item in searchTerms){
  if (item.toLowerCase().contains(query.toLowerCase())){
    matchQuery.add(item);
  }
 } return ListView.builder(
  itemCount: matchQuery.length,
  itemBuilder: (context, index) {
   var result = matchQuery[index];
   return ListTile(title: Text(result),);
 },);

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String>matchQuery =[];
 for (var item in searchTerms){
  if (item.toLowerCase().contains(query.toLowerCase())){
    matchQuery.add(item);
  }
 } return ListView.builder(
  itemCount: matchQuery.length,
  itemBuilder: (context, index) {
   var result = matchQuery[index];
   return ListTile(title: Text(result),);
 },);


  }
}
