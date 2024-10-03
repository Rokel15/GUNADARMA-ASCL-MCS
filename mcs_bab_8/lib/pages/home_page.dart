import 'package:flutter/material.dart';
import 'package:mcs_bab_8/providers/card_bridge_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Fetch data from API saat initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CardBridgeProvider>(context, listen: false).fetchCardData();
    });
  }

  // Fungsi untuk me-refresh data
  Future<void> _refreshData() async {
    await Provider.of<ServoProvider>(context, listen: false).fetchCardData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Flutter Servo & Cards Control')),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshData, // Memanggil refresh secara manual lewat tombol
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ServoProvider>(
          builder: (context, servoProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        servoProvider.putData(1); // Set servo to 1
                      },
                      child: const Text(
                        "Set Servo to 1",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        backgroundColor: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        servoProvider.putData(0); // Set servo to 0
                      },
                      child: const Text("Set Servo to 0",
                        style: TextStyle(
                            color: Colors.white
                        ),),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          backgroundColor: Colors.green
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Text(
                  "Servo Status: ${servoProvider.datasServo}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 40),
                const Text("Card IDs:"),
                Expanded(
                  // Menambahkan RefreshIndicator agar bisa melakukan pull-to-refresh
                  child: RefreshIndicator(
                    onRefresh: _refreshData, // Menyegarkan data saat pull-to-refresh
                    child: Container(
                      height: 200, // Tentukan tinggi area scroll
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey), // Memberikan batas di sekitar field
                      ),
                      child: ListView.builder(
                        itemCount: servoProvider.cardIds.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(servoProvider.cardIds[index]), // Menampilkan setiap id yang difetch
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
