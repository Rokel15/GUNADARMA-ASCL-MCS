import 'package:flutter/material.dart';
import 'package:mcs_bab_8/providers/app_provider.dart';
import 'package:mcs_bab_8/widgets/servo_button.dart';
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
    Provider.of<AppProvider>(context, listen: false).getUid();
    Provider.of<AppProvider>(context, listen: false).getServoStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Servo & Cards Control', style: TextStyle(color: Colors.white),),
            backgroundColor: Color(0xff0B192C),
          ),
          body: Column(
            children: [
              const SizedBox(height: 50,),

              ServoButton(
                textLeftButton: appProvider.textLeftButton,
                textRightButton: appProvider.textRightButton,
                colorLeftButton: appProvider.colorLeftButton,
                colorRightButton: appProvider.colorRightButton,
                onTapLeftButton: () => appProvider.changeServoStatus(status: "0"),
                onTapRightButton: () => appProvider.changeServoStatus(status: "1"),
              ),

              const SizedBox(height: 30,),

              StreamBuilder(
                stream: appProvider.getServoStatus(),
                builder: (context, snapshot) {
                  if (snapshot.hasData){
                    appProvider.servoStatus = appProvider.servoStatusModel!.result[0].srvStatus.toString();
                    return Container();
                  } else{
                    return Container();
                  }
                },
              ),

              Text(
                "Servo Status : ${appProvider.servoStatus}"
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

              Expanded(
                child: StreamBuilder(
                  stream: appProvider.getUid(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: appProvider.cardBridgeModel!.result.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(appProvider.cardBridgeModel!.result[index].id),
                                GestureDetector(
                                  child: const Icon(Icons.delete),
                                  onTap: () {
                                    appProvider.deleteUid(uid: appProvider.cardBridgeModel!.result[index].id);
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