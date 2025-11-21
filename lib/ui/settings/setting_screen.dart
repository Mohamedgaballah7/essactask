
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    _scanDevices();
  }
  Future<void> _scanDevices() async {
// TODO: Implement real Bluetooth scan logic using flutter_blue_plus
// EXAMPLE placeholder devices:
    List<String> bluetoothDevices = [
      'BT Printer A',
      'BT Printer B',
    ];


// TODO: Implement real WiFi scan logic using ping_discover_network
// EXAMPLE placeholder devices:
    List<String> wifiDevices = [
      'WiFi Printer X',
      'WiFi Printer Y',
    ];


    setState(() {
      devices = [...bluetoothDevices, ...wifiDevices];
    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title:  Text('Settings',style: AppStyles.bold20Black,)),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.h),
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


             Text('Network Devices (WiFi / Bluetooth)', style: AppStyles.bold16Black),
             SizedBox(height: 10.h),


            DropdownButtonFormField(
              items: devices
                  .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                  .toList(),
              onChanged: (value) {
                selectedDevice = value;
              },
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),


            const Spacer(),
            CustomElavatedButton(

              onPressed: (){
                // TODO: Save URL + selected device logic
                // TODO: Navigate to WebViewPage
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>WebViewScreen(url: urlController.text,)
                ));
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