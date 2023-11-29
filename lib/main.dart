import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text('Search With Animations')
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),

        // 1- Create a TextField for search box
        //1- قم بعمل مربع البحث باستخدام التيكست فيلد
        child: TextField(
          decoration: const InputDecoration(
            fillColor: Colors.transparent,
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 14),
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
            hintText: "Search Product",
          ),
          // 2- Add onTap event on TextField when user clicks on it it goes to SearchDelegate
          //2- عند الضغط علي التيكست فيلد قم بفتح السيرش ديليجيت
          onTap: () {
            showSearch(context: context, delegate: CustomSearch());
          },
        ),
      ),
    );
  }
}


// 3- Create a SearchDelegate class
//3- إنشاء كلاس البحث
class CustomSearch extends SearchDelegate {


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [Icon(Icons.close)];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Prodact");
  }

  // 4- In the buildSuggestions method we will display the animation as shown
  //4- في الميثود الخاص بالاقتراحات سوف تعرض الأنميشن كما يظهر
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: FittedBox(
          fit: BoxFit.contain,
          //5- Add the Lottie animation package to the pubspec.yaml file
          //5- اضف الباكدج الخاص ب لوتي داخل ثم قم بتمرير ملف الانيميشن pubspec.yaml
          child:Lottie.asset("assets/animations/Animation - 1701232569753.json")
      ),
    );
  }
}

