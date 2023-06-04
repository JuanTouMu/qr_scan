import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/models/scan_model.dart';
import 'package:qr_scan/providers/scan_list_provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_scan/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: Icon(
          Icons.filter_center_focus,
        ),
        onPressed: () async {
          print('Botó polsat!');
          String barCodeScanRes = 'geo:39.8828119,4.25557';
          //String barCodeScanRes='https://lichess.org/';
          // String barCodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          // '#3D8BEF', 'Cancelar', false, ScanMode.QR);
          print(barCodeScanRes);
          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          ScanModel nouScan = ScanModel(valor: barCodeScanRes);
          scanListProvider.nouScan(barCodeScanRes);
          laun(context, nouScan);
        });
  }
}
