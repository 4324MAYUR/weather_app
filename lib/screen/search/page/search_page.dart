import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/screen/home/provider/weather_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late WeatherProvider providerR;
  late WeatherProvider providerW;
  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<WeatherProvider>();
    providerR = context.read<WeatherProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: cityController..text,
              decoration: const InputDecoration(
                hintText: "Enter city",
                hintStyle: TextStyle(),
                labelText: "Enter city",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                providerW.city = value;
              },
            ),
            Row(
              children: [
                Center(
                    child: Text(providerR.bookMark,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                  providerR.bookMark = cityController.text;

                },
                    icon: const Icon(Icons.bookmark)
                ),
           ],
            ),
             const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                providerW.getData();
                cityController.text = providerW.city;
                providerR.bookMark = cityController.text;

              },
              child: const Text("Get Click"),
            ),
          ],
        ),
      ),
    );
  }
}
