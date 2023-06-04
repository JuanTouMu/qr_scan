import 'package:flutter/material.dart';
import 'package:qr_scan/providers/db_provider.dart';
import 'package:flutter/cupertino.dart';
import '../models/scan_model.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipusSeleccionat = 'http';
  int idSel = 1;
  Future<ScanModel> nouScan(String valor) async {
    final nouScan = ScanModel(valor: valor);
    final id = await DBProvider.db.InsertScan(nouScan);
    nouScan.id = id;
    if (nouScan.tipus == tipusSeleccionat) {
      scans.add(nouScan);
      notifyListeners();
    }
    return nouScan;
  }

  carregaScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  carregaScansPerTipus(String tipus) async {
    final scans = await DBProvider.db.getScansByTipus(tipus);
    this.scans = scans;
    tipusSeleccionat = tipus;
    notifyListeners();
  }

  esborraTots() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  esborraPerId(int id) async {
    await DBProvider.db.deleteScanById(id);
    scans.removeWhere((scan) => scan.id == id);
    notifyListeners();
  }
}
