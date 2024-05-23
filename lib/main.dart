import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textfield/conditon_controller.dart';
import 'package:textfield/custom_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});

  ConditionController controller = Get.put(ConditionController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Obx(
          ()=> Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.textEditingController,
                decoration: InputDecoration(
                 border: OutlineInputBorder()
                ),
                
              ),
             CustomTile(text: "must be at least 8 charectors", isChecked:controller.haveEightCharacters,),
             CustomTile(text: "must contain one uppercase alphbate",isChecked:controller.upperCaseCharecter,),
             CustomTile(text: "must contain one lowercase alphbate",isChecked: controller.lowerCharecter,),
             CustomTile(text: "must contain one speacial charctor",isChecked: controller.specialCharecter,),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  print("sucess");
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color:controller.haveEightCharacters && controller.specialCharecter && controller.lowerCharecter && controller.upperCaseCharecter ?  Colors.blue : const Color.fromARGB(255, 185, 196, 206),
                    
                  ),
                  child: Center(child: Text("GET STARTED", style: TextStyle(color: Colors.white),),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}