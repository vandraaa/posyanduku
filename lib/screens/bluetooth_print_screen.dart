import 'package:flutter/material.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class BluetoothPrintScreen extends StatefulWidget {
  const BluetoothPrintScreen({super.key});

  @override
  _BluetoothPrintScreenState createState() => _BluetoothPrintScreenState();
}

class _BluetoothPrintScreenState extends State<BluetoothPrintScreen> {
  bool isBluetoothEnabled = false;
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    checkBluetoothStatus();
  }

  Future<void> checkBluetoothStatus() async {
    try {
      final bool bluetoothStatus = await PrintBluetoothThermal.bluetoothEnabled;
      setState(() {
        isBluetoothEnabled = bluetoothStatus;
      });
    } catch (e) {
      print("Error checking Bluetooth status: $e");
      setState(() {
        isBluetoothEnabled = false;
      });
    }
  }

  Future<void> connectToPrinter() async {
    try {
      // String macAddress = "66:02:BD:06:18:7B";
      String macAddress = "86:67:7A:40:D8:D5";
      final bool result = await PrintBluetoothThermal.connect(macPrinterAddress: macAddress);
      setState(() {
        isConnected = result;
      });

      if (result) {
        print("Printer connected successfully");
      } else {
        print("Failed to connect to printer");
      }
    } catch (e) {
      print("Error connecting to printer: $e");
    }
  }

  Future<void> printTestText() async {
    try {
      if (isConnected) {
        String testText = "Hello, this is a test print\n";
        await PrintBluetoothThermal.writeBytes(testText.codeUnits);
        print("Print successful");
      } else {
        print("Printer is not connected");
      }
    } catch (e) {
      print("Error while printing: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Print Button"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: isBluetoothEnabled
              ? () async {
                  await connectToPrinter();
                  await printTestText();
                }
              : null,
          child: Text(
            "Print",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
