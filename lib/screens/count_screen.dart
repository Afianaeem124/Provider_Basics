import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/provider/count_provider.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({super.key});

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final caa = Provider.of<CountProvider>(context, listen: false);
    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   caa.setcount();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final caa = Provider.of<CountProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('seekh ja jldi se'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Consumer<CountProvider>(
            builder: (context, value, child) {
              print('only this widget build');
              return Text(value.count.toString(),
                  style: TextStyle(fontSize: 50));
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          caa.setcount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
