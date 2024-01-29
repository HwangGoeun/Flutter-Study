import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class mlScan extends StatefulWidget {
  const mlScan({super.key});

  @override
  State<mlScan> createState() => _mlScanState();
}

class _mlScanState extends State<mlScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void cancelButton() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(cutOutSize: 200),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 150),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  "Scan QR Code",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 30,
                  ),
                ),
                Text(
                  "예약한 회의실의\nQR코드를 스캔해주세요!",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 50),
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                cancelButton();
              },
              child: const Text(
                "X",
              ),
            ),
          )
        ],
      ),
    );
  }
}
