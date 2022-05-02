import 'package:bytecupertino/screens/dashboard.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const ByteBank());
}

class ByteBank extends StatelessWidget {
  const ByteBank({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Bytebank',
      home: Dashboard(),
    );
  }
}
