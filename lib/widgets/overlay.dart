import 'package:flutter/material.dart';

class overlay extends StatelessWidget {
  const overlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    OverlayEntry? entry;

    showOverlay(){
      entry = OverlayEntry(builder: (context) => Positioned(
        left: 20,
        top: 40,
        child: ElevatedButton.icon(
          icon: Icon(Icons.stop_circle_rounded),
          label: Text('Record'),
          onPressed: (){},
        ),
      ));

      final overlay = Overlay.of(context)!;
      overlay.insert(entry!);
    }
    
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton.icon(onPressed: showOverlay, icon: Icon(Icons.visibility), label: Text('Show Floating Widget')),
        ),
      ),
    );
    
  }
}
