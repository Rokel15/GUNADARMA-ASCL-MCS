import 'package:flutter/material.dart';
import 'package:mcs_bab_8/models/card_bridge_model.dart';
import 'package:mcs_bab_8/providers/card_bridge_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   // Fetch data from API saat initState
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Provider.of<CardBridgeProvider>(context, listen: false).fetchCardData();
  //   });
  // }
  //
  // // Fungsi untuk me-refresh data
  // Future<void> _refreshData() async {
  //   await Provider.of<ServoProvider>(context, listen: false).fetchCardData();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<CardBridgeProvider>(
      builder: (context, cardBridgeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Servo & Cards Control', style: TextStyle(color: Colors.white),),
            backgroundColor: Color(0xff0B192C),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh, color: Colors.white,),
                onPressed: (){}, // Memanggil refresh secara manual lewat tombol
              ),
            ],
          ),
          body: Column(
            children: [
              const SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // servoProvider.putData(1); // Set servo to 1
                    },
                    child: const Text(
                      "Set Servo to 1",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      backgroundColor: Color(0xffFF6500),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // servoProvider.putData(0); // Set servo to 0
                    },
                    child: const Text("Set Servo to 0",
                      style: TextStyle(
                          color: Colors.white
                      ),),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        backgroundColor: Color(0xff1E3E62),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30,),

              Text(
                "Servo Status:"
                //  ${servoProvider.datasServo}",
                , style: const TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 30,),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: Colors.black,
                    border: Border(top: BorderSide(width: 3,color: Colors.black)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40), topRight: Radius.circular(40),
                    )
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    const SizedBox(height: 30,),
                    const SizedBox(height: 30,),
                    const SizedBox(height: 30,),
                    const SizedBox(height: 30,),

                  ],
                ),
              ),

              const SizedBox(height: 40),

              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: cardBridgeProvider.cardBridgeModel?.result.length,
              //   itemBuilder: (context, index) {
              //     if (cardBridgeProvider.cardBridgeModel != null) {
              //       return Text("${cardBridgeProvider.cardBridgeModel!.result}");
              //     } else{
              //       return Text("ss");
              //     }
              //   },
              // ),

              const SizedBox(height: 40),
              // const Text("Card IDs:"),
              // Expanded(
                // Menambahkan RefreshIndicator agar bisa melakukan pull-to-refresh
                // child: RefreshIndicator(
                //   onRefresh: _refreshData, // Menyegarkan data saat pull-to-refresh
                //   child: Container(
                //     height: 200, // Tentukan tinggi area scroll
                //     decoration: BoxDecoration(
                //       border: Border.all(color: Colors.grey), // Memberikan batas di sekitar field
                //     ),
                //     child: ListView.builder(
                //       itemCount: servoProvider.cardIds.length,
                //       itemBuilder: (context, index) {
                //         return ListTile(
                //           title: Text(servoProvider.cardIds[index]), // Menampilkan setiap id yang difetch
                //         );
                //       },
                //     ),
                //   ),
                // ),
              // ),
            ],
          ),
        );
      },
    );
  }
}