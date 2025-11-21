
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:task2/ui/web_view/web_view_screen.dart';
import 'package:task2/ui/widgets/custom_elavated_button.dart';
import 'package:task2/ui/widgets/custom_text_form_field.dart';
import 'package:task2/utils/app_colors.dart';
import 'package:task2/utils/app_styles.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController urlController = TextEditingController();

  String? selectedDevice;
  List<String> devices = [];

  @override
  void initState() {
    super.initState();
    _initBluetooth();
  }

  Future<void> _initBluetooth() async {
    // 1. Ask for permissions
    await _requestPermissions();

    // 2. Turn bluetooth on
    await FlutterBluePlus.turnOn();

    // 3. Start scan
    _scanBluetoothDevices();
  }

  Future<void> _requestPermissions() async {
    await Permission.bluetoothScan.request();
    await Permission.bluetoothConnect.request();
    await Permission.location.request();
  }

  Future<void> _scanBluetoothDevices() async {
    devices.clear();

    FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));

    FlutterBluePlus.scanResults.listen((results) {
      List<String> foundDevices = [];

      for (var r in results) {
        final name = r.device.name.isNotEmpty
            ? r.device.name
            : r.device.remoteId.toString();

        if (!foundDevices.contains(name)) {
          foundDevices.add(name);
        }
      }

      setState(() {
        devices = foundDevices;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings', style: AppStyles.bold20Black)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Website URL', style: AppStyles.bold16Black),
            SizedBox(height: 10.h),

            CustomTextFormField(
              hintName: 'Enter website URL',
              borderColor: AppColors.blackColor,
              controller: urlController,
            ),

            SizedBox(height: 20.h),

            Text('Bluetooth Devices', style: AppStyles.bold16Black),
            SizedBox(height: 10.h),

            DropdownButtonFormField(
              items: devices
                  .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedDevice = value;
                });
              },
              decoration: const InputDecoration(border: OutlineInputBorder()),
              hint: const Text("Select a Bluetooth Device"),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _scanBluetoothDevices,
                child: Text(
                  "Scan Again",
                  style: AppStyles.bold16Black.copyWith(
                    color: AppColors.redColor,
                  ),
                ),
              ),
            ),

            const Spacer(),

            CustomElavatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WebViewScreen(url: urlController.text),
                  ),
                );
              },
              textName: 'Save & Open WebView',
              backgroundColor: AppColors.blackColor,
              borderColor: AppColors.transparentColor,
            ),
          ],
        ),
      ),
    );
  }
}
