import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

class ShowAvailableNetwork extends StatefulWidget {
  const ShowAvailableNetwork({super.key});

  @override
  State<ShowAvailableNetwork> createState() => _ShowAvailableNetworkState();
}

class _ShowAvailableNetworkState extends State<ShowAvailableNetwork> {
  StreamSubscription<List<ConnectivityResult>>? subscription;
  List<ConnectivityResult> accessedDeviceUi = [];

  @override
  void initState() {
    print("initstate");
    // TODO: implement initState
    super.initState();

    checkInitialConnection();

    subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult>? result,){
      print("result is $result");
      if (result!.contains(ConnectivityResult.wifi)) {
        print("📶 WiFi Connected");
      }

      if (result.contains(ConnectivityResult.mobile)) {
        print("📱 Mobile Data Connected");
      }

      if (result.contains(ConnectivityResult.none)) {
        print("❌ No Internet");
      }

      setState(() {
        accessedDeviceUi = result;
      });
    },onError: (e) => print("error $e"),onDone: () => print("best") , );
    
  }

  void checkInitialConnection() async {

  final result = await Connectivity().checkConnectivity();

  if(result.contains(ConnectivityResult.wifi)){
    print("wifi connected");
  }
  else if(result.contains(ConnectivityResult.mobile)){
    print("mobile data connected");
  }
  else if(result.contains(ConnectivityResult.none)){
    print("no device connected");
  }
  
  print("Initial: $result ${result[0].name}");

  setState(() {
    accessedDeviceUi = result;
  });
}

    @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ShowAvailableNetwork"),),
      body: Column(
        children: [
          Container(
            child: Text("hellossss"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: accessedDeviceUi.length,
              itemBuilder: (context,index){
                final accessesDeviceNetwork = accessedDeviceUi[index];
                return ListTile(
                  title: Text(accessesDeviceNetwork.name.isNotEmpty && !accessesDeviceNetwork.name.contains("none") ? accessesDeviceNetwork.name :
                  "no device network or connect to any network"),
                );
              }),
          )
        ],
      ),
    );
  }
}