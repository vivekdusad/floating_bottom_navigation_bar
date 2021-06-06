import 'package:flutter/material.dart';


class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red,child: Center(child: Text("Page 1",style: TextStyle(fontSize: 30),),),);
  }
}
class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green,child: Center(child: Text("Page 2",style: TextStyle(fontSize: 30),),),);
  }
}
class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.purple,child: Center(child: Text("Page 3",style: TextStyle(fontSize: 30),),),);
  }
}
class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.yellow,child: Center(child: Text("Page 4",style: TextStyle(fontSize: 30),),),);
  }
}