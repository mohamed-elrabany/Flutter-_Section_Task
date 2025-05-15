import 'package:flutter/material.dart';
import 'package:flutter_taskone/qoute/quote.dart';
import 'package:flutter_taskone/qoute/service.dart';

class QouteScreen extends StatefulWidget {
  const QouteScreen({super.key});

  @override
  State<QouteScreen> createState() => _QouteScreenState();
}

class _QouteScreenState extends State<QouteScreen> {
  late Future<List<Quote>> future;

  @override
  void initState() {
    future = fetchQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<List<Quote>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 200,),
                      Text(snapshot.data![index].quote ?? "No quote available"),
                      Text(snapshot.data![index].author ?? "No author available"),
                      Text(snapshot.data![index].category ?? "No category available"),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(child: Icon(Icons.wifi_off_rounded, color: Colors.green, size: 200,));
            }
            return const Center(child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator()));
          },
        ),
      ),
    );
  }
}
