import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/flutter_flow_icon_button.dart';
import '../utils/flutter_flow_theme.dart';
import "manufacturer_profile.dart";

class ManuList extends StatefulWidget {
  const ManuList({Key? key}) : super(key: key);
  
  @override
  State<ManuList> createState() => _ManuListState();
}

Future<List<Manu>> fetchManu() async {
  final response = await http
      .get(Uri.parse('http://my-first-app-249520.uk.r.appspot.com/manufacturers'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List jresp = jsonDecode(response.body);
    return jresp.map((data) => new Manu.fromJson(data)).toList();
  } 

   else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load manufacturer');
  }
}


class Manu {
  final String manu_id;
  final String manu_email;
  final double manu_avg_turnaround;
  final double manu_min_price;
  final double manu_max_price;
  final double manu_min_quantity;

  const Manu({
    required this.manu_id,
    required this.manu_email,
    required this.manu_avg_turnaround,
    required this.manu_min_price,
    required this.manu_max_price,
    required this.manu_min_quantity,
  });

  factory Manu.fromJson(Map<String, dynamic> json) {
    return Manu(
      manu_id: json['manu_id'],
      manu_email: json['manu_email'],
      manu_avg_turnaround: json['manu_avg_turnaround'],
      manu_min_price: json['manu_min_price'],
      manu_max_price: json['manu_max_price'],
      manu_min_quantity: json['manu_min_quantity'],

    );
  }
}




class _ManuListState extends State<ManuList> {
    late Future<List<Manu>> futureManu;

  @override
  void initState() {
    super.initState();
    futureManu = fetchManu();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://images.wikidexcdn.net/mwuploads/wikidex/3/3c/latest/20221117203845/Tandemaus.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'Erich Gift',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: const Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Color(0xFF030000),
                        size: 30,
                      ),
                      onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ManufacturerProfile()));
                        }
                      
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://images.wikidexcdn.net/mwuploads/wikidex/3/3c/latest/20221117203845/Tandemaus.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'YourStuffMade',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: const Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Color(0xFF030000),
                        size: 30,

                        
                      ),
                      onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ManufacturerProfile()));
                        }
                      
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://images.wikidexcdn.net/mwuploads/wikidex/3/3c/latest/20221117203845/Tandemaus.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'Muyue Gifts',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: const Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Color(0xFF030000),
                        size: 30,
                      ),
                      onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ManufacturerProfile()));
                        }
                      
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://images.wikidexcdn.net/mwuploads/wikidex/3/3c/latest/20221117203845/Tandemaus.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'Wizard Pins',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: const Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Color(0xFF030000),
                        size: 30,
                      ),
                        onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ManufacturerProfile()));
                        }
                      
                      
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://images.wikidexcdn.net/mwuploads/wikidex/3/3c/latest/20221117203845/Tandemaus.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'GS-JJ',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: const Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Color(0xFF030000),
                        size: 30,
                      ),
                      onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ManufacturerProfile()));
                        }
                      
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://images.wikidexcdn.net/mwuploads/wikidex/3/3c/latest/20221117203845/Tandemaus.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'Vivi Pins',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: const Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Color(0xFF030000),
                        size: 30,
                      ),
                      onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ManufacturerProfile()));
                        }
                      
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
