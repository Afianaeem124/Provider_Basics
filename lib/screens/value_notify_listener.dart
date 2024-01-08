import 'package:flutter/material.dart';

class VNLScreen extends StatelessWidget {
  VNLScreen({super.key});

  late ValueNotifier<int> _counter = ValueNotifier<int>(0);
  late ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      suffix: InkWell(
                          onTap: () {
                            toggle.value = !toggle.value;
                          },
                          child: Icon(toggle.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility))),
                );
              }),
          ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(_counter.value.toString(),
                    style: TextStyle(fontSize: 50));
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
