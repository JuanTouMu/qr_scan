import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/scan_model.dart';

void laun(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  if (scan.tipus == 'http') {
    // ignore: deprecated_member_use
    if (!await launch(url)) throw ('Could not launch $url');
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
