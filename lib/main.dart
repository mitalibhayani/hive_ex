import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_ex/adapter.dart';
import 'package:hive_ex/view_data.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);
  Hive.registerAdapter(adapterAdapter());
  var box = await Hive.openBox('cdmi');

    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    home: first(),
  )
  );
}class first extends StatefulWidget {
  // const first(adapter c, {super.key});
  adapter ?c;
  first([this.c]);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.c!=null)
      {
          t1.text=widget.c!.name;
          t2.text=widget.c!.contact;
          t3.text=widget.c!.city;
      }
  }
  Box box = Hive.box('cdmi');

  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hive Database"),),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(hintText: "Enter Name"),
            controller: t1,
          ),
          TextField(decoration: InputDecoration(hintText: "Enter Contact"),
            controller: t2,
          ),
          TextField(decoration: InputDecoration(hintText: "Enter City"),
            controller: t3,
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () {
            String name=t1.text;
            String contact=t2.text;
            String city=t3.text;
            if(widget.c!=null)
              {
                widget.c!.name=name;
               widget.c!.contact=contact;
               widget.c!.city=city;
               widget.c!.save();

              }
            else
              {
                adapter d=adapter(name, contact, city);
                box.add(d);
                print("${name}\n${contact}\n${city}");
              }

          }, child: Text("Add")),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return view_data();
              },));
          }, child: Text("View")),
        ],

      ),
    );
  }
}
