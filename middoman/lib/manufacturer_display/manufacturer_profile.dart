import 'package:flutter/material.dart';
import 'manu_list_container.dart';
import '../utils/flutter_flow_theme.dart';




class ManufacturerProfile extends StatefulWidget {
  const ManufacturerProfile({super.key});
 
  @override
  State<ManufacturerProfile> createState() => _ManufacturerProfileState();
}

class _ManufacturerProfileState extends State<ManufacturerProfile> {

  @override
  void initState() {
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
    
      
        backgroundColor: const Color(0xFFFFF4EE),
        
        body: SingleChildScrollView(
            child: SingleChildScrollView(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Image.network(
                      'https://images.wikidexcdn.net/mwuploads/wikidex/3/3c/latest/20221117203845/Tandemaus.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Text(" Erich Gift",
                    style: FlutterFlowTheme.of(context).title1,),
                    Text("  Minimum Order Quantity: 100 Pins",
                    style: FlutterFlowTheme.of(context).subtitle2,),
                    Text("  Average Turnaround Time: 2.5 Weeks",
                    style: FlutterFlowTheme.of(context).subtitle2,),
                    Text("  Average Price Range: \$100-450",
                    style: FlutterFlowTheme.of(context).subtitle2,),
                    Text("\n  Reviews",
                    style: FlutterFlowTheme.of(context).title1,),
                    Text("  Tess ",
                    style: FlutterFlowTheme.of(context).title2,),
                    Text("   The pin was chewed on???",
                    style: FlutterFlowTheme.of(context).subtitle2,),
                    Text("\n  Michael ",
                    style: FlutterFlowTheme.of(context).title2,),
                    Text("   Not a bad deal for the price!",
                    style: FlutterFlowTheme.of(context).subtitle2,),

                  ])),
        )));
  }
}
