import 'package:flutter/material.dart';
import 'package:weather_app/Network/network_api.dart';
import 'package:weather_app/model/Weather.dart';
import 'package:weather_app/splash_page.dart';


void main() {
  runApp( const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Weather?> weather;


  @override
  void initState() {
    weather = NetworkApi().getWeather("Toshkent");
    super.initState();
  }
bool search =true;
  TextEditingController txt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:true ,
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        title: search?Text("Select an adress"):TextField(
          controller: txt,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Select an adress",style: TextStyle(color: Colors.white),)
          ),
          onSubmitted: (value){
            setState(() {
              weather=NetworkApi().getWeather(value);
            });
          },
        ),
        backgroundColor: Colors.blue[300],
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  search=!search;
                });
              },
              icon: Icon(
                Icons.place_sharp,
                color: Colors.white,
                size: 30,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Weather?>(
            future: weather,
            builder: (BuildContext context,AsyncSnapshot<Weather?> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: SplashPage());
              }
              return Column(
                children: [
                  SizedBox(height: 50,),
                  Container(
                    width: double.infinity,
                    height: 251,
                    child: Image.asset(
                      "assets/havo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "http:${snapshot.data!.current!.condition!.icon}",
                        color: Colors.white,),
                      SizedBox(width: 20,),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            Text(
                              "NOW",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            SizedBox(width: 20,),
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        snapshot.data!.current!.tempC.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 60),
                      ),
                      SizedBox(width: 40,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 20,),
                      Image.network(
                        "https:${snapshot.data!.forecast!.forecastday![0]
                            .day!.condition!.icon}", color: Colors.white,),
                      SizedBox(width: 20,),
                      Text(snapshot.data!.forecast!.forecastday![0].date
                          .toString(), style: TextStyle(color: Colors.white,
                          fontSize: 25
                      ),
                      ),
                      SizedBox(width: 35,),
                      Expanded(child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                snapshot.data!.forecast!.forecastday![0].day!
                                    .avgtempC.toString(),
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ))

                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      Image.network(
                        "http:${snapshot.data!.forecast!.forecastday![1].day!
                            .condition!.icon}",
                        color: Colors.white,
                      ),
                      SizedBox(width: 20,),
                      Text(snapshot.data!.forecast!.forecastday![1].date
                          .toString(), style:
                      TextStyle(color: Colors.white,
                          fontSize: 25
                      ),),
                      SizedBox(width: 35,),
                      Expanded(child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Padding(
                          padding: EdgeInsets.all(11.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                snapshot.data!.forecast!.forecastday![1].day!
                                    .avgtempC.toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Image.network(
                        "https:${snapshot.data!.forecast!.forecastday![2]
                            .day!.condition!.icon}",
                        color: Colors.white,
                      ),
                      SizedBox(width: 20,),
                      Text(snapshot.data!.forecast!.forecastday![2].date
                          .toString(),
                        style: TextStyle(color: Colors.white,
                            fontSize: 25
                        ),),
                      SizedBox(width: 35,),
                      Expanded(child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                snapshot.data!.forecast!.forecastday![2].day!
                                    .avgtempC.toString(),
                                style: TextStyle(fontSize: 20,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      )
                    ],
                  ),
                ],
              );

            }

   ),
      ),
    );

    }
  }

