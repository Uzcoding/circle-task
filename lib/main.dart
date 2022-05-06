import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pixelRatio = window.devicePixelRatio;

    var logicalScreenSize = window.physicalSize / pixelRatio;
    var logicalWidth = logicalScreenSize.width;
    var logicalHeight = logicalScreenSize.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StackTut(
        screenX: logicalWidth,
        screenY: logicalHeight,
      ),
    );
  }
}

class StackTut extends StatefulWidget {
  final double screenX;
  final double screenY;
  const StackTut({
    Key? key,
    required this.screenX,
    required this.screenY,
  }) : super(key: key);

  @override
  State<StackTut> createState() => _StackTutState();
}

class _StackTutState extends State<StackTut> {
  Color circleColor = Colors.red;
  double cirlePosX = 100;
  double circlePosY = 100;
  double circleSize = 300;

  @override
  void initState() {
    super.initState();
    cirlePosX = (widget.screenX - circleSize) / 2;
    circlePosY = (widget.screenY - circleSize) / 2;
  }

  void onTap(double x, double y) {
    moveCirlcToRandomPos(x, y);
    circleColor = generateRandomColor();

    setState(() {});
  }

  void moveCirlcToRandomPos(double x, double y) {
    final maxHorizontal = (widget.screenX - circleSize).toInt();
    final maxVertical = (widget.screenY - circleSize).toInt();
    final newValueX = Random().nextInt(maxHorizontal).toDouble();
    final newValueY = Random().nextInt(maxVertical).toDouble();

    cirlePosX = newValueX;
    circlePosY = newValueY;
  }

  Color generateRandomColor() =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: cirlePosX,
            top: circlePosY,
            child: GestureDetector(
              onTap: () => onTap(size.width, size.height),
              child: Container(
                width: circleSize,
                height: circleSize,
                decoration: BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(const App());
// }

// class App extends StatelessWidget {
//   const App({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String? textInField;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'TextField (foydalanuchidan ma\'lumot olish)',
//           style: TextStyle(fontSize: 16.0),
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               TextField(
//                 // onTap: () {
//                 //   print('dsaasas');
//                 // },
//                 // onChanged: (v) {
//                 //   textInField = v;
//                 //   setState(() {});
//                 // },
//                 onEditingComplete: () {
//                   print('tugadi');
//                   FocusScope.of(context).unfocus();
//                 },
//                 onSubmitted: (text) {
//                   textInField = text;
//                   FocusScope.of(context).unfocus();
//                   setState(() {});
//                 },
//                 decoration: const InputDecoration(
//                   // filled: true,
//                   // fillColor: Colors.red,
//                   labelText: 'Email',
//                   // contentPadding: EdgeInsets.all(0.0),
//                   // isDense: true,
//                   // isCollapsed: true,
//                   // disabledBorder: OutlineInputBorder(),
//                   hintText: 'Ismingizni kiriting',
//                   border: InputBorder.none,
//                   // enabledBorder: OutlineInputBorder(
//                   //   borderRadius: BorderRadius.circular(20),
//                   //   borderSide: const BorderSide(color: Colors.red, width: 4),
//                   // ),
//                   // focusedBorder: InputBorder.none,
//                   // errorBorder: const UnderlineInputBorder(
//                   //   borderSide: BorderSide(color: Colors.yellow),
//                   // ),
//                   // focusedErrorBorder: const OutlineInputBorder(
//                   //   borderSide: const BorderSide(color: Colors.orange),
//                   // ),
//                   counterText: '',
//                   floatingLabelAlignment: FloatingLabelAlignment.center,
//                   // floatingLabelBehavior: FloatingLabelBehavior.auto,
//                   // floatingLabelStyle: TextStyle(fontSize: 30),
//                   prefix: Text('+998'),
//                   suffix: Icon(Icons.call),
//                   // icon: Icon(Icons.abc),

//                   // errorText: 'sassa',
//                 ),
//                 // keyboardType: TextInputType.datetime,
//                 // autofocus: true,
//                 // cursorColor: Colors.red,
//                 // cursorHeight: 20,
//                 // cursorWidth: 20,
//                 // cursorRadius: Radius.circular(100),
//                 // enabled: false,
//                 // expands: false,
//                 // maxLines: 5,
//                 // minLines: 2,
//                 // obscureText: true,
//                 // obscuringCharacter: '',
//                 // inputFormatters: [
//                 //   FilteringTextInputFormatter.allow(RegExp(r'[0-x]')),
//                 // ],
//                 // keyboardAppearance: Brightness.dark,
//                 // maxLength: 5,
//                 // style: TextStyle(fontSize: 30),
//                 // readOnly: true,
//                 // enabled: false,
//                 // showCursor: false,
//                 // textInputAction: TextInputAction.search,
//                 // textAlign: TextAlign.right,
//               ),
//               Text(textInField ?? ''),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
