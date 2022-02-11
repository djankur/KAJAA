import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kajaa/screens/car_detail.dart';
import 'package:kajaa/services/url_service.dart';

class AllCar extends StatefulWidget {
  const AllCar({Key? key}) : super(key: key);

  @override
  _AllCarState createState() => _AllCarState();
}

class _AllCarState extends State<AllCar> {
  var dio = Dio();

  List allCars = [];

  delete(String car_id) {
    // ignore: avoid_print
    print(car_id);
    //api for delete
  }

  getCars() async {
    var response = await dio.get(UrlService.allCars);
    var responseData = jsonDecode(response.data);
    if (responseData["success"]) {
      allCars = responseData["data"];
      // ignore: avoid_print
      print(responseData["data"]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getCars();
    return ListView.builder(
        itemCount: allCars.length,
        itemBuilder: (context, index) {
          return
              // ListTile(
              //     leading: CircleAvatar(
              //       child: Image.asset(
              //         'assets/images/profile.jpg',
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //     title: Text(allCars[index]["car_name"]),
              //     subtitle: Text(allCars[index]["company"].toString()),
              //     trailing: IconButton(
              //       onPressed: () => delete(allCars[index]["id"]),
              //       icon: const Icon(Icons.delete_forever),
              //     ));
              // FutureBuilder<List<Bikedata>>(
              //     future: fetchBike(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
//             ListView(
//           scrollDirection: Axis.vertical,
//           children: <Widget>[
//             Expanded(
//               child: Column(
//                 children: <Widget>[
//                   Center(
//                     child: Text(
//                       'All Cars',
//                       style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.yellow.shade900),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 500,
//                     child: ListView(
//                       scrollDirection: Axis.vertical,
//                       children: snapshot.data!
//                           .map((data) =>
              Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarDetail(
                            carid: allCars[index]["car_id"](),
                          ),
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Row(children: [
                      Expanded(
                        flex: 3,
                        child: Image.network(
                            'https://app-site-database.000webhostapp.com/'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                allCars[index]["car_name"],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Price: ' + allCars[index]["price"].toString(),
                                style: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ]),
                      ),
                    ]),
                    width: double.maxFinite,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 3.0, // soften the shadow
                          spreadRadius: 1.0, //extend the shadow
                          offset: const Offset(
                            0, // Move to right 10  horizontally
                            0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );

//                   Center(
//                     child: Text(
//                       'Sport',
//                       style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.yellow.shade900),
//                     ),
//                   ),
// //                           Container(
// //                             margin: const EdgeInsets.symmetric(vertical: 20.0),
// //                             height: 230,
// //                             child: ListView(
// //                               scrollDirection: Axis.horizontal,
// //                               children: snapshot.data!
// //                                   .map((data) => Column(
// //                                         children: <Widget>[
// //                                           Padding(
// //                                             padding: const EdgeInsets.all(8.0),
// //                                             child: Container(
// //                                               padding:
// //                                                   const EdgeInsets.symmetric(
// //                                                       vertical: 20,
// //                                                       horizontal: 10),
// //                                               child: Column(children: [
// //                                                 Expanded(
// //                                                   flex: 3,
// //                                                   child: Image.network(
// //                                                       'https://app-site-database.000webhostapp.com/'),
// //                                                 ),
// //                                                 Expanded(
// //                                                   flex: 2,
// //                                                   child: Column(
// //                                                       mainAxisAlignment:
// //                                                           MainAxisAlignment
// //                                                               .center,
// //                                                       crossAxisAlignment:
// //                                                           CrossAxisAlignment
// //                                                               .center,
// //                                                       children: [
// //                                                         Text(
// //                                                           data.name,
// //                                                           style: const TextStyle(
// //                                                               color:
// //                                                                   Colors.black,
// //                                                               fontSize: 16,
// //                                                               fontWeight:
// //                                                                   FontWeight
// //                                                                       .w600),
// //                                                         ),
// //                                                         Text(
// //                                                           'Price (per day): ' +
// //                                                               data.price,
// //                                                           style: TextStyle(
// //                                                               color: Colors.blue
// //                                                                   .shade900,
// //                                                               fontSize: 14,
// //                                                               fontWeight:
// //                                                                   FontWeight
// //                                                                       .w600),
// //                                                         ),
// //                                                       ]),
// //                                                 ),
// //                                               ]),
// //                                               width: 200,
// //                                               height: 200,
// //                                               decoration: BoxDecoration(
// //                                                 borderRadius:
// //                                                     const BorderRadius.all(
// //                                                         Radius.circular(10)),
// //                                                 color: Colors.white,
// //                                                 boxShadow: [
// //                                                   BoxShadow(
// //                                                     color: Colors.grey
// //                                                         .withOpacity(0.3),
// //                                                     blurRadius:
// //                                                         3.0, // soften the shadow
// //                                                     spreadRadius:
// //                                                         1.0, //extend the shadow
// //                                                     offset: const Offset(
// //                                                       0, // Move to right 10  horizontally
// //                                                       0, // Move to bottom 10 Vertically
// //                                                     ),
// //                                                   )
// //                                                 ],
// //                                               ),
// //                                             ),
// //                                           ),
// //                                         ],
// //                                       ))
        });
  }
}
