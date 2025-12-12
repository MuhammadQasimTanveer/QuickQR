import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart'; //capture the widget as an image
import 'package:gallery_saver_plus/gallery_saver.dart';//save an image (bytes) to gallery.
import 'dart:ui' as ui; //converting widget to an actual image.
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_downloader_web/image_downloader_web.dart';

class GenerateQRpage extends StatefulWidget {
  const GenerateQRpage({super.key});

  @override
  State<GenerateQRpage> createState() => _GenerateQRpageState();
}

class _GenerateQRpageState extends State<GenerateQRpage> {
  TextEditingController textcontroller = TextEditingController();

  bool _isHover = false;

  String data = "";
  final _qrKey = GlobalKey(); //unique identifier to widget

  @override
  void dispose() {
    textcontroller.dispose();
    super.dispose(); //When screen (widget) is closed, dispose() runs.
  }

  //this is async function
  _downloadQRCode() async {
    try {
      //get widget using key and capture it as image
      final boundary =
      _qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      //Converts that widget into actual image in memory
      final image = await boundary.toImage(pixelRatio: 3.0);

      //Converts image into bytes (in PNG format)
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      //Turns bytes into usableFormat (Uint8List)
      final pngBytes = byteData!.buffer.asUint8List();

      if (kIsWeb) {
        await WebImageDownloader.downloadImageFromUInt8List( uInt8List: pngBytes,
          name: 'qr_code_${DateTime.now().millisecondsSinceEpoch}',
        );
      }
      else {
        final tempPath = '${(await getTemporaryDirectory()).path}/qr_${DateTime
            .now().millisecondsSinceEpoch}.png';
        await File(tempPath).writeAsBytes(pngBytes);
        await GallerySaver.saveImage(tempPath);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 12),
              Text('QR Code downloaded!'),
            ],
          ),
          backgroundColor: const Color(0xFF66BB6A),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.white),
              const SizedBox(width: 12),
              Text('Error: $e'),
            ],
          ),
          backgroundColor: const Color(0xFFEF5350),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(31.0),
      child: Column(children: [
        Text(
          'Generate QR Code',
          style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white70
                  : Colors.deepPurple,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 35),
        TextField(
          controller: textcontroller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: "Enter Text or URL",
          ),
        ),
        const SizedBox(height: 20),

        MouseRegion(
          onEnter: (_) => setState(() => _isHover = true),
          onExit: (_) => setState(() => _isHover = false),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: _isHover ? 0.86 : 1,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    data = textcontroller.text;
                  });
                },
                icon: const Icon(Icons.qr_code, color: Colors.white, size: 22),
                label: const Text(
                  'Generate QR',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        if (data.isNotEmpty) ...[
          Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(children: [
                //It lets capture a widget as an image
                RepaintBoundary(
                  key: _qrKey,
                  // version means library picks smallest version that fits
                  child: QrImageView(
                    data: data,
                    size: 150,
                    backgroundColor: Colors.white,
                    version: QrVersions.auto,
                  ),
                ),
              ])),
          const SizedBox(height: 16),
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: _downloadQRCode,
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                'Download QR',
                style: TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500, fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ]),
    );
  }
}