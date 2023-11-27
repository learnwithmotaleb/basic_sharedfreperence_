import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var name = TextEditingController();
  var savedvalue;


  @override
  void initState() {

    getData();
    super.initState();
  }


  void getData()async {

    var sharedfres = await SharedPreferences.getInstance();
    var getName = sharedfres.get("NameKey");
    savedvalue = getName ?? "No Value";


  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("SharedPreference")
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: "Name",
                  label: Text("Name"),
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: ()async{


              var sharfs = await SharedPreferences.getInstance();

              sharfs.setString("NameKey", name.text.toString());




            }, child: Text('Save')),
            SizedBox(height: 20,),
            Text(savedvalue)
          ],

        ),
      ),
    );
  }




}
