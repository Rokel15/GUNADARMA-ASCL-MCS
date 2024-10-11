import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

  void initState() {
    // TODO: implement initState
    Provider.of<CardBridgeProvider>(context, listen: false).getUid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CardBridgeProvider>(
      builder: (context, cardBridgeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Servo & Cards Control', style: TextStyle(color: Colors.white),),
            backgroundColor: Color(0xff0B192C),
          ),
          body: Column(
            children: [
              const SizedBox(height: 50,),

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
                "Servo Status :"
                //  ${servoProvider.datasServo}",
                , style: const TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 40,),

              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    border: Border(top: BorderSide(width: 3,color: Colors.black)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40), topRight: Radius.circular(40),
                    )
                ),
                child: const Column(
                  children: [
                    SizedBox(height: 30,),
                    Text("Card IDs:"),
                  ],
                ),
              ),

              Container(),

              Expanded(
                child: StreamBuilder(
                  stream: cardBridgeProvider.getUid(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: cardBridgeProvider.cardBridgeModel!.result.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(cardBridgeProvider.cardBridgeModel!.result[index].id),
                                GestureDetector(
                                  child: const Icon(Icons.delete),
                                  onTap: () {
                                    cardBridgeProvider.deleteUid(uid: cardBridgeProvider.cardBridgeModel!.result[index].id);
                                    print(cardBridgeProvider.cardBridgeModel!.result[index].id);
                                  },
                                )
                              ],
                            ),
                          );
                        },
                      );
                    } else{
                      return const Center(child: Text("no data to display"));
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}