import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/provider/fav_provider.dart';

class MyFavScreen extends StatefulWidget {
  const MyFavScreen({super.key});

  @override
  State<MyFavScreen> createState() => _MyFavScreenState();
}

class _MyFavScreenState extends State<MyFavScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text(' My Favourite Items'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: provider.favlist.length,
                itemBuilder: (context, index) {
                  return Card(child: Consumer<FavouriteProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                        onTap: () {},
                        title: Text(
                            'Item' + " " + provider.favlist[index].toString()),
                        trailing: Icon(Icons.favorite));
                  }));
                }),
          )
        ],
      ),
    );
  }
}
