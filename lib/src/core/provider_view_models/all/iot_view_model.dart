import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:inki/src/core/api_data_models/main_categories_data_model.dart';
import 'package:inki/src/core/constants/route_path.dart';
import 'package:inki/src/core/provider_view_models/base/base_change_notifier_model.dart';
import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';

class IOTViewModel extends BaseChangeNotifierModel {
  BuildContext context;

  IOTViewModel({this.context});

  UsbPort port;
  String status = "Idle";
  List<Widget> ports = [];
  List<Widget> serialData = [];
  StreamSubscription<String> subscription;
  Transaction<String> transaction;
  int deviceId;
  TextEditingController textController = TextEditingController();

  Future<bool> connectTo(device, mContext) async {
    serialData.clear();

    if (subscription != null) {
      subscription.cancel();
      subscription = null;
    }

    if (transaction != null) {
      transaction.dispose();
      transaction = null;
    }

    if (port != null) {
      port.close();
      port = null;
    }

    if (device == null) {
      deviceId = null;
      status = "Disconnected";
      notifyListeners();

      return true;
    }

    port = await device.create();
    if (!await port.open()) {
      status = "Failed to open port";
      notifyListeners();
      return false;
    }

    deviceId = device.deviceId;
    await port.setDTR(true);
    await port.setRTS(true);
    await port.setPortParameters(
        115200, UsbPort.DATABITS_8, UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);

    transaction = Transaction.stringTerminated(
        port.inputStream, Uint8List.fromList([13, 10]));

    subscription = transaction.stream.listen((String line) {

      if (line == "z" || line == "Z") {
        Navigator.pushNamed(mContext, refreshAnimationHome,
            arguments: UsbPortModel(portValue: port, isFromHome: true));
      } else {
      }

      serialData.add(Text(line));
      if (serialData.length > 20) {
        serialData.removeAt(0);
      }
      notifyListeners();
    });

    status = "Connected";
    notifyListeners();
    return true;
  }

  void getPorts(BuildContext mContext) async { // get list of connected port
    ports = [];
    List<UsbDevice> devices = await UsbSerial.listDevices();
    print(devices);

    devices.forEach((device) {
      ports.add(ListTile(
          leading: Icon(Icons.usb),
          title: Text(device.productName),
          subtitle: Text(device.manufacturerName),
          trailing: RaisedButton(
            child: Text(deviceId == device.deviceId ? "Disconnect" : "Connect"),
            onPressed: () {
              connectTo(deviceId == device.deviceId ? null : device, mContext)
                  .then((res) {
                getPorts(mContext);
                print(devices);
              });
            },
          )));
    });

    notifyListeners();
  }

  listenPorts(BuildContext mContext) {
    UsbSerial.usbEventStream.listen((UsbEvent event) {
      getPorts(mContext);
      // Fluttertoast.showToast(
      //     msg: "Step1 initState",
      //     toastLength: Toast.LENGTH_LONG,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    });
    getPorts(mContext);
  }

  @override
  void dispose() {
    // connectTo(null, context);
    super.dispose();
  }
}
