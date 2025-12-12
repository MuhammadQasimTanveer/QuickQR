import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQRpage extends StatefulWidget {
  const ScanQRpage({super.key});

  @override
  State<ScanQRpage> createState() => _ScanQRpageState();
}

class _ScanQRpageState extends State<ScanQRpage> {
  MobileScannerController cameracontroller = MobileScannerController();
  bool isScanning = false;
  String? scannedData;

  @override
  void dispose() {
    cameracontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isScanning)
            Container(
              height: 400,
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.lightBlue, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: MobileScanner(
                  controller: cameracontroller,
                  onDetect: (detect) {
                    List<Barcode> barcodes = detect.barcodes;
                    if (scannedData == null && barcodes.isNotEmpty) {
                      setState(() {
                        scannedData = barcodes.first.rawValue;
                        isScanning = false;
                      });
                    }
                  },
                ),
              ),
            )
          else ...[
            Container(
              width: double.infinity,
              height: 240,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code_scanner,
                    size: 80,
                    color: Colors.grey[500],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Press the button to start scanning',
                    style: TextStyle(fontSize: 14, color: Colors.brown),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isScanning = true;
                    scannedData = null;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Start Scanning',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
          const SizedBox(height: 32),
          if (scannedData != null)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: Colors.greenAccent[100],
                border: Border.all(color: Colors.greenAccent, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    'Scanned Result:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 11),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          scannedData!,
                          style: const TextStyle(fontSize: 15),
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: scannedData!),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Copied to clipboard!'),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.copy,
                          size: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}