# **PRAKTIKUM BAB 5**

## THINGSPEAK

---

## PENDAHULUAN

Pada praktikum MCS bab 5 akan belajar bagaimana membangun aplikasi yang terhubung
dengan thingspeak melalui Application Programming Interface (API). Thingspeak merupakan
perangkat lunak bersifat terbuka/layanan yang biasa digunakan untuk project Internet Of
Things (IOT) berguna untuk memantau dan mengumnpulkan data atau bahkan perubahan data
dengan koneksi API. Aplikasi mengambil data dari API dalam bentuk JSON. JSON memiliki
berbagai macam bentuk seperti array of objects, object with nested, object with array dan
bentuk lainnya.

<div align="center">
  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/array-with-nested.png"/>
  <br>
  Contoh Array with Nested
  <br><br><br>
  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/objects-with-array.png"/>
  <br>
  Contoh Object with Array
  <br><br><br>
  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/array-of-objects.png"/>
  <br>
  Contoh Array of Object
</div>
</br>
Interaksi dengan JSON memiliki dua metode yaitu encode dan decode. Encode adalah proses mengubah object menjadi format JSON, contohnya adalah ketika aplikasi membaca data dari API. sedangkan decode adalah kebalikannya yaitu mengubah format JSON menjadi object, contohnya adalah ketika mengirim data (biasanya ke database sebelum diproses dengan query).


## PENJELASAN & TAHAP-TAHAP

Tampilan aplikasi yang akan di buat

<div align="center">
  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/tampilan%20awal%20aplikasis%20bab%205.jpeg" width="300" height="600"/> 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/tampilan%20awal%20aplikasis%20bab%206.jpeg"
width="300" height="600" />
</div>

<br><br><br>
Buat terlebih dahulu folder dan file project msc bab 5 dan tambahkan juga package dio dan provider.
<div align="center">
  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/folder%20dan%20file%20project.png" width="250" height="350"/>
</div>

<br><br><br>
Sebelum lanjut menulis code untuk membangun aplikasi, **_buat akun Thingspeak._** <br>
<div align="center">
  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/registrasi%20akun%20thingspeak.png" width="400" height="350"/>
  <br>
  Registrasi Akun
  <br><br>
  
  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/verivikasi%20akun.png" width="400" height="200"/>
  <br>
  Verifikasi Email
  <br><br>
  
  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/menambahkan%20password%20akun%20thingspeak.png" width="400" height="250"/>
  <br>
  Menambahkan Password Akun Thingspeak
  <br><br>

  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/sign%20up%20successful.png" width="400" height="250"/>
  <br>
  Sign up Successful
</div>
</br>

Buka website https://thingspeak.com/ dan _click Get Started For Free_. Isi email address, location dan nama pengguna kemudian _click Continue_. Untuk verifikasi email address Thingspeak akan mengirim instruksi melalui email. Terakhir berikan password untuk akun Thingspeak. <br>
<div align="center">
  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/start%20channel.png" width="400" height="200"/>
  <br>
  Buat Channel Baru
  <br><br>
  
  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/fill%20fields.png" width="400" height="250"/>
  <br>
  Channel Fields
</div>
Sebuah akun dari Thingspeak untuk free member dapat membuat 4 channel dan setiap channel memiliki 8 fields. Setiap 1 field menyimpan 1 data, misalnya suhu ruangan yang dibaca oleh sensor dht dan masuk ke micro controller. 

_Di praktikum ini kita akan membuat 1 channel 3 fields_. 3 fields tersebut akan kita asumsikan sebagai data dari suhu ruangan, kelembaban ruangan dan kelembaban tanah. Berikan nama channel dan deskripsi bebas begitu juga nama dari setiap field namun untuk mempermemudah praktikum dan sebagai tanda maka:

1. **field 1** diberi nama **temperature**
2. **field 2** diberi nama **humidity**
3. **field 3** diberi nama **soil moisture**

Jika sudah selesai dibuat akan muncul informasi channel. <br>
<div align="center">
  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/informasi%20channel.png" width="400" height="180"/>
  <br>
  Informasi Channel
  <br>
</div>

Beralih ke menu Api keys dan perhatikan api requestnya <br><br>
<div align="center">
  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/menu%20api%20keys.png" width="600" height="400"/>
  <br>
  Menu API Keys
  <br>
</div>
Write api keys dan Read api keys adalah kunci yang berbentuk susunan angka dan huruf untuk digabungkan ke endpoint. Write api keys dan Read api keys digenerasikan dari channel yang dibuat pemilik akun. 

<br><br>
<div align="center">
  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/api%20key%20write%20and%20write.png" width="600" height="400"/>
  <br>
  API Request
</div>

Untuk **mengubah nilai suatu field** menggunakan **endpoint Write metode GET** dengan memasukan nilai baru ke dalam paramater di akhir url. Jika ingin mengubah nilai dari suatu field misalnya field pertama maka bentuk endpoint di akhir url adalah `&filed1=<value>`, jika field kedua maka bentuk endpoint di akhir url adalah `&filed2=<value>`.
<br><br>
Isikan 3 field yang sudah dibuat menggunakan endpoint Write

1. **field pertama** diberi nilai **23**
2. **field kedua** diberi nilai **52**
3. **field ketiga** diberi nilai **39**

`https://api.thingspeak.com/update?api_key=<Write API Key> &field<nomor field>=<value>`

Endpoint write ini tidak akan ada di dalam aplikasi dan hanya dijalankan untuk inisialisasi nilai field. _Menjalankan endpoint ini bisa menggunakan web browser ataupun menggunakan aplikasi postman._

Endpoint read akan ada di dalam aplikasi. Endpoint read pada umumnya memiliki url bentuk :

`https://api.thingspeak.com/channels/(Channel id)/fields/<nomor field>.json?api_key=Read API Keys&results=2`

dan akan sedikit dirubah menjadi

`https://api.thingspeak.com/channels/(Channel id)/fields/<nomor field>/last.json?api_key=Read API Keys`

Sebelum dimasukkann dan dijalankan di dalam aplikasi jalankan terlebih dahulu di web browser ataupun postman untuk mengambil response dari setiap field.
<br><br>
Copy response yang didapatkan, buka link website https://app.quicktype.io/ atur nama model, bahasa yang dipilih bahasa pemrograman Dart gunakan Null Safety dan paste ke dalamnya.

<div align="center">
  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/response%20from%20API.png" width="700" height="400"/>
  <br>
  API Response from Postman
  <br><br>
  
  <img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/quicktype.png" width="700" height="360"/>
  <br>
  API Response from Quicktype
  
</div>
<br><br><br>

Lakukan konversi untuk semua field kemudian letakkan hasil dari conversi JSON ke dalam file yang berada di folder models, di dalam folder models terdapat 3 file .dart, masing-masing file .dart berisi hasil konversi JSON dari field yang berbeda.
<br><br>
Isi dari **_file field1_model.dart_**

```dart
// To parse this JSON data, do
//
//     final field1Model = field1ModelFromJson(jsonString);

import 'dart:convert';

Field1Model field1ModelFromJson(String str) => Field1Model.fromJson(json.decode(str));

String field1ModelToJson(Field1Model data) => json.encode(data.toJson());

class Field1Model {
  DateTime createdAt;
  int entryId;
  String field1;

  Field1Model({
    required this.createdAt,
    required this.entryId,
    required this.field1,
  });

  factory Field1Model.fromJson(Map<String, dynamic> json) => Field1Model(
    createdAt: DateTime.parse(json["created_at"]),
    entryId: json["entry_id"],
    field1: json["field1"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt.toIso8601String(),
    "entry_id": entryId,
    "field1": field1,
  };
}
```

Isi dari **_file field2_model.dart_**

```dart
// To parse this JSON data, do
//
//     final field2Model = field2ModelFromJson(jsonString);

import 'dart:convert';

Field2Model field2ModelFromJson(String str) => Field2Model.fromJson(json.decode(str));

String field2ModelToJson(Field2Model data) => json.encode(data.toJson());

class Field2Model {
  DateTime createdAt;
  int entryId;
  String field2;

  Field2Model({
    required this.createdAt,
    required this.entryId,
    required this.field2,
  });

  factory Field2Model.fromJson(Map<String, dynamic> json) => Field2Model(
    createdAt: DateTime.parse(json["created_at"]),
    entryId: json["entry_id"],
    field2: json["field2"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt.toIso8601String(),
    "entry_id": entryId,
    "field2": field2,
  };
}
```

Isi dari **_file field3_model.dart_**

```dart
// To parse this JSON data, do
//
//     final field3Model = field3ModelFromJson(jsonString);

import 'dart:convert';

Field3Model field3ModelFromJson(String str) => Field3Model.fromJson(json.decode(str));

String field3ModelToJson(Field3Model data) => json.encode(data.toJson());

class Field3Model {
  DateTime createdAt;
  int entryId;
  String field3;

  Field3Model({
    required this.createdAt,
    required this.entryId,
    required this.field3,
  });

  factory Field3Model.fromJson(Map<String, dynamic> json) => Field3Model(
    createdAt: DateTime.parse(json["created_at"]),
    entryId: json["entry_id"],
    field3: json["field3"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt.toIso8601String(),
    "entry_id": entryId,
    "field3": field3,
  };
}
```

Dengan adanya model ini dapat membantu aplikasi membaca data saat berkomunikasi dengan API.

<br><br>

Kemudian buka **_file api_service.dart_** dan isi dengan kode berikut :

```dart
import 'package:dio/dio.dart';
import 'package:mcs_bab_5/models/field1_model.dart';
import '../models/field2_model.dart';
import '../models/field3_model.dart';

class ApiService{
  Dio dio = Dio();

  String readKey = "ILT5CI93S5SHTTF1";

  String field1Url = "https://api.thingspeak.com/channels/2656478/fields/1/last.json?api_key=";
  String field2Url = "https://api.thingspeak.com/channels/2656478/fields/2/last.json?api_key=";
  String field3Url = "https://api.thingspeak.com/channels/2656478/fields/3/last.json?api_key=";

  Future<Field1Model> getField1() async{
      try{
        final response = await dio.get("$field1Url$readKey");
        return Field1Model.fromJson(response.data);
      } catch(e){
        rethrow;
      }
  }

  Future<Field2Model> getField2() async{
    try{
      final response = await dio.get("$field2Url$readKey");
      return Field2Model.fromJson(response.data);
    } catch(e){
      rethrow;
    }
  }

  Future<Field3Model> getField3() async{
    try{
      final response = await dio.get("$field3Url$readKey");
      return Field3Model.fromJson(response.data);
    } catch(e){
      rethrow;
    }
  }
}

```

Kita menggunakan Dio untuk berkomunikasi dengan API dan mendapatkan responsenya di dalam function getField1() getField2() getField3(). Masing-masing method berguna untuk mendapatkan response dari url yang memiliki data field berbeda-beda. Response yang berbeda-beda ditangkap oleh property dari 3 class model yang sudah dibuat. Karena data yang berasal dari endpoint tersebut berbentuk JSON sehingga untuk dapat membacanya harus melalui proses konversi menggunakan property yang ada di class model yaitu fromJson.

<br>

Aplikasi pada praktikum ini diperlukan memasukkan gambar, **cara untuk menambahkan gambar ke aplikasi** yaitu dengan:

1. membuat folder images pada root project
2. letakkan gambar yang dibutuhkan ke dalam folder tersebut
<img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/folder%20berisi%20gambar.png" />
   
3. atur dibagian **pubspec.yaml** dengan menghilangkan comment pada bagian assets.
<img src="https://github.com/Rokel15/GUNADARMA-ASCL-MCS/blob/dev-aini/images/gambar-gambar%20bab%205/config%20image%20in%20pubspec.png" />

<br>

Kemudian buka **_file app_provider.dart_** dan isi dengan code berikut :

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcs_bab_5/models/field1_model.dart';
import 'package:mcs_bab_5/screens/main_screen.dart';
import 'package:mcs_bab_5/services/api_service.dart';
import '../models/field2_model.dart';
import '../models/field3_model.dart';

class AppProvider extends ChangeNotifier {
  TextStyle roboto14Italic = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400,);
  TextStyle roboto14 = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500,);
  TextStyle roboto14SemiBold = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w600,);
  TextStyle roboto14Bold = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w700,);
  TextStyle roboto16Italic = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400,);
  TextStyle roboto16 = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500,);
  TextStyle roboto16SemiBold = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600,);
  TextStyle roboto16Bold = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w700,);

  TextStyle whiteRoboto14Bold = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white);

  Color mainColor = const Color(0xff36725D);
  String loremIpsum =
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  String thermoMeterImage = "images/thermometer.png";
  String humiditySensorImage = "images/humidity-sensor.png";
  String soilAnalysisImage = "images/soil-analysis.png";
  Field1Model? field1model;
  Field2Model? field2model;
  Field3Model? field3model;

  gotoMainScreen({required BuildContext context}){
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => const MainScreen(),),
    );
    notifyListeners();
  }

  Future getTemperature() async{
    notifyListeners();
    return field1model = await ApiService().getField1();
  }

  Future getHumidity() async{
    notifyListeners();
    return field2model = await ApiService().getField2();
  }

  Future getSoilMoisture() async{
    notifyListeners();
    return field3model = await ApiService().getField3();
  }
}
```

Dapat dilihat di dalam provider mendeklarasikan beberapa variabel dan juga function. Variabel dengan tipe String yang bernama thermoMeterImage dan humiditySensorImage, soilAnalysisImage adalah variabel untuk menyimpan path dimana gambar disimpan. Variabel dengan nama field1model, field2model, field3model adalah variabel yang nantinya menampung return saat function yang berada di class ApiService() bernama getField1(), getField2() dan getField3() dipanggil. getField1(), getField2() dan getField3() berjalan saat getTemperature(), getHumidty() dan getSoilMoisture() dipanggil.

<br>

Kemudian buka **_file main.dart_** dan isi dengan kode berikut :

```dart
import 'package:flutter/material.dart';
import 'package:mcs_bab_5/providers/app_provider.dart';
import 'package:mcs_bab_5/screens/opening_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(
          create: (context) => AppProvider()
            ..getTemperature()
            ..getHumidity()
            ..getSoilMoisture(),
        )
      ],
      child: MaterialApp(
        title: 'Mcs Bab 5',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const OpeningScreen()
      ),
    );
  }
}
```

Dapat dilihat ada code ..getTemperature, ..getHumidty() dan ..getSoilMoisture(). Bentuk penulisan tersebut memiliki tujuan agar tiga function tersebut langsug berjalan saat aplikasi dibuka.

<br>

Kemudian buka **_file opening_screen.dart_** dan isi dengan code berikut :

```dart
import 'package:flutter/material.dart';
import 'package:mcs_bab_5/providers/app_provider.dart';
import 'package:provider/provider.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({super.key});

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {

  @override
  void initState() {
    Provider.of<AppProvider>(context, listen: false,).getTemperature();
    Provider.of<AppProvider>(context, listen: false,).getHumidity();
    Provider.of<AppProvider>(context, listen: false,).getSoilMoisture();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) {
        return Scaffold(
          appBar: AppBar(
          title: Text("Agro Tech" , style: appProvider.whiteRoboto14Bold,),
            centerTitle: true,
            backgroundColor: appProvider.mainColor,
          ),
          body: Center(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Text(
                    appProvider.loremIpsum,
                    style: appProvider.roboto14Bold,
                    textAlign: TextAlign.justify,),
                ),

                const SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: appProvider.mainColor,
                        ),
                        child: Text("Continue", style: appProvider.whiteRoboto14Bold,),
                      ),
                      onTap: () {
                        appProvider.gotoMainScreen(context: context);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
```

Di bagian initState() function getTemperature(), getHumidty() dan getSoilMoisture() dipanggil lagi karena walaupun saat inisialisasi provider tiga function tersebut sudah dipanggil, hal tersebut tidak dapat menjadi jaminan bahwa function yang dipanggil dapat berjalan.

<br>

Kemudian buka **_file read_field.dart_** dan isi dengan code berikut :

```dart
import 'package:flutter/material.dart';

class ReadField extends StatelessWidget {
  String result;
  Color color;
  String image;

  ReadField({
    super.key,
    required this.result,
    required this.color,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color, width: 4),
      ),
      child:
      Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            height: MediaQuery.of(context).size.width / 5,
            child: Image.asset(image, fit: BoxFit.fill,),
          ),
          const SizedBox(height: 14,),
          Center(child: Text(result),),
        ],
      ),
    );
  }
}
```

Di class ReafField() adalah widget yang nantinya akan digunakan di halaman aplikasi saat membaca field dari channel thingspeak. Dengan adanya class ReadField() ketika ingin menggunakan widget hanya perlu memanggil class ReafField() saja, nanti constructor yang ada di class ReafField() hanya perlu diisi saat dipanggil. Terdapat 3 bagian di dalam constructor yang harus diisi, result adalah untuk menampilkan data dari field channel thingspeak, color adalah warna untuk border widget yang dibangun dan image untuk menampilkan gambar pada widget tersebut.

<br>

Kemudian buka **_file main_screen.dart_** dan isi dengan code berikut :

```dart
import 'package:flutter/material.dart';
import 'package:mcs_bab_5/providers/app_provider.dart';
import 'package:mcs_bab_5/widgets/read_field.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Agro Tech" , style: appProvider.whiteRoboto14Bold,),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: appProvider.mainColor,
          ),
          body: Center(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // temperature
                ReadField(
                  result: appProvider.field1model!.field1,
                  color: appProvider.mainColor,
                  image: appProvider.thermoMeterImage,
                ),

                const SizedBox(height: 20,),

                //humidity
                ReadField(
                  result: appProvider.field2model!.field2,
                  color: appProvider.mainColor,
                  image: appProvider.humiditySensorImage,
                ),

                const SizedBox(height: 20,),

                //soil moisture
                ReadField(
                  result: appProvider.field3model!.field3,
                  color: appProvider.mainColor,
                  image: appProvider.soilAnalysisImage,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
```

Dari class ini dibuat suatu halaman untuk menampilkan data yang ada di Thingspeak melalui JSON. Widget yang digunakan adalah ReadField dan penggunaannya hanya perlu memanggil classnya saja. Ketika class ReadField() dipanggil, class ReadField() memiliki constructor yang di dalamnya terdapat 3 bagian yang harus diisi, result diisi dengan nilai field yang didapat dari channel Thingspeak, color diisi dengan warna, image diisi dengan gambar yang sudah disiapkan.

---

## LAPORAN PENDAHULUAN (LP)

1. Berikan penjelasan apa itu Thingspeak!
2. Berikan penjelasan apa itu JSON!
3. Berikan penjelasan apa itu serialisasi dan deserialisasi pada JSON!
4. Berikan macam-macam cara consume API dan berikan penjelasannya!

## LAPORAN AKHIR (LA)

1. Berikan kesimpulan pada Bab 5!
