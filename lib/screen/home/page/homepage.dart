import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/screen/home/provider/weather_provider.dart';

class Homepage extends StatefulWidget {
    const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final providerW = context.watch<WeatherProvider>();
    final providerR = context.read<WeatherProvider>();
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Weather Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            providerR.weatherData == null
               ?Column(
                 children: [
                   const SizedBox(height: 100),
                   TextField(
                    controller: cityController..text,
                       decoration: const InputDecoration(
                         hintText: "select city",
                         hintStyle: TextStyle(),
                         labelText: "select city",
                         border: OutlineInputBorder(),
                     ),
                         onChanged: (value)
                         {
                                 providerW.city = value;
                          },
                       ),

                   const SizedBox(height: 50),
                   ElevatedButton(
                     onPressed: () async {
                       providerW.getData();
                       cityController.text = providerW.city;
                       providerR.bookMark = cityController.text;
                     },
                     child: const Text("Get Click"),
                   )
                 ],
               )
            :   Container(),
            // weather app data show
            providerW.weatherData == null
                ? const Text("")
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on_sharp,
                      color: Colors.black,
                      ),
                       Text(
                        " ${providerW.weatherData?.sys.country}  ${providerW.weatherData?.name}",
                       ),
                      const Spacer(),
                      IconButton.filled(
                        onPressed: () {
                          Navigator.of(context).pushNamed('search');
                        },
                        style: IconButton.styleFrom(
                           backgroundColor: Colors.white,
                        ),
                        color: Colors.black,
                         icon: const Icon(
                           Icons.search,
                         color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                    height: size.height * 0.30,
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      image:  DecorationImage(
                        image: NetworkImage(
                          providerW.weatherData?.weather.first.main == "Clouds"
                          ? "https://img.freepik.com/premium-vector/vector-isolated-weather-app-icon-with-snow-cloud-interface-elements-flat-design-web_1071100-327.jpg"
                          : "https://cdn.pixabay.com/photo/2014/05/18/00/31/cloud-346709_1280.png",
                         scale: 1,
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(52),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 6,
                          offset: const Offset(5, 5),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child:
                    // hWatch.weatherModel != null
                    Column(
                      children: [
                        const Icon(Icons.bedtime_outlined),
                        const SizedBox(height: 10),
                        Text(
                          "Today,${DateTime.now().day} / ${DateTime.now().month}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          providerW.weatherData?.weather.first.main ?? 'null',
                        ),
                        const Spacer(),
                        Text(
                          "${providerW.weatherData?.main.tempMin.toString()}°C",
                          style:
                          const TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                 ),
                 const SizedBox(height: 20),
                 Container(
                  height: size.height * 0.10,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                                Expanded(
                                child: Text(
                                  "Pressure : ${providerW.weatherData?.main.pressure ?? 'null'}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Row(
                                children: [
                                  const SizedBox(width: 50),
                                  const Icon(Icons.thermostat_rounded,
                                  color: Colors.white,
                                  ),
                                  Text(
                                    "${providerW.weatherData?.main.tempMin}°C",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children:[
                            Expanded(
                              child: Text(
                              "Sky : ${providerW.weatherData?.weather.first.main ?? 'null'}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Expanded(
                              child: Text(
                                "feels_like : ${providerW.weatherData?.main.feelsLike.toString() ?? 'null'}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                         ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: size.height * 0.10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue.withOpacity(0.7),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Wind Speed"),
                             const SizedBox(height: 10),
                             Row(
                              children: [
                                const Icon(
                                  Icons.waves_rounded,
                                  size: 26,
                                ),
                                 const SizedBox(width: 10),
                                 Text(
                                  "${providerW.weatherData?.wind.speed}km/h",
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                     const SizedBox(width: 10),
                     Expanded(
                      child: Container(
                        height: size.height * 0.10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey.shade900,
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Humidity",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.water_drop_outlined,
                                  size: 28,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  "${providerW.weatherData!.main.humidity}%",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Expanded(
                      child: Container(
                        height: size.height * 0.11,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey.shade900,
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Lon & Lat",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            ),
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                 Text(
                                  "Lon : ${providerW.weatherData!.coord.lon}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                 Text(
                                  "Lan : ${providerW.weatherData!.coord.lat}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: size.height * 0.11,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue.withOpacity(0.7),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Temp min & max"),
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                Text(
                                  "Min : ${providerW.weatherData!.main.tempMin}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Max : ${providerW.weatherData!.main.tempMax}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}