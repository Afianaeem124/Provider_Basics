import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/provider/slider_provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(builder: (context, val, child) {
            print('build1');
            return Slider(
                min: 0,
                max: 1,
                value: val.opacityy,
                onChanged: (value) {
                  val.setopacity(value);
                });
          }),
          Consumer<SliderProvider>(builder: (context, val, child) {
            print('build2');
            return Row(children: [
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.red.withOpacity(val.opacityy),
                  child: const Center(child: Text('Container 1 ')),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.green.withOpacity(val.opacityy),
                  child: const Center(child: Text('Container 2')),
                ),
              ),
            ]);
          })
        ],
      ),
    );
  }
}
