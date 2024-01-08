import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/provider/fav_provider.dart';
import 'package:provider_basic/screens/favourites/myfav.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text('Favourite apni khd ki bano shabash'),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => MyFavScreen())));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 30,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Card(child: Consumer<FavouriteProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.favlist.contains(index)) {
                          value.removevalue(index);
                        } else {
                          value.addvalue(index);
                        }
                      },
                      title: Text('Item' + " " + index.toString()),
                      trailing: value.favlist.contains(index)
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_outline_sharp),
                    );
                  }));
                }),
          )
        ],
      ),
    );
  }
}
