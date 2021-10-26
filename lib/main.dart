import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController maleController = TextEditingController();
  TextEditingController feMaleController = TextEditingController();
  String maleName = "";
  String femaleName = "";
  String love = "";
  String finalResult = "";
  String sumNumber = "";
  String numText = "";
  int finalSum = 0;
  int l = 0, o = 0, v = 0, e = 0, s = 0;
  List<String> result = [
    "Hai người không quá hòa hợp với nhau. Hãy cố gắng tìm cơ hội để thấu hiểu đối phương.",
    "Hai người sinh ra là để dành cho nhau. Mối tình rất bền chặt và sẽ kéo dài đến suốt đời.",
    "Sự phù hợp giữa hai người ở mức tương đối. Chuyện tình cảm có thể tiến triển xa hơn nữa."
  ];

  @override
  void initState() {
    super.initState();
    maleController = TextEditingController();
    feMaleController = TextEditingController();
    maleName = "";
    femaleName = "";
    love = "LOVES";
    finalResult = "";
    sumNumber = "";
    numText = "";
    l = 0;
    o = 0;
    v = 0;
    e = 0;
    s = 0;
    finalSum = 0;
  }

  @override
  void dispose() {
    super.dispose();
    maleController.dispose();
    feMaleController.dispose();
  }

  void checkNum() {
    sumNumber = "";
    finalSum = 0;
    l = 0;
    o = 0;
    v = 0;
    e = 0;
    s = 0;
    finalSum = 0;
    setState(() {
      numText = maleName + love + femaleName;
      List<String> charNumText = numText.split("");
      for (int i = 0; i < charNumText.length; i++) {
        if (numText[i] == "L") {
          l = l + 1;
        }
        if (numText[i] == "O") {
          o = o + 1;
        }
        if (numText[i] == "V") {
          v = v + 1;
        }
        if (numText[i] == "E") {
          e = e + 1;
        }
        if (numText[i] == "S") {
          s = s + 1;
        }
      }
      sumNumber = l.toString() +
          o.toString() +
          v.toString() +
          e.toString() +
          s.toString();
      while (int.parse(sumNumber) > 100) {
        for (int i = 0; i < sumNumber.length; i++) {
          finalSum =
              finalSum + (int.parse(sumNumber[0]) + int.parse(sumNumber[1]));
        }
        sumNumber = finalSum.toString();
        finalSum = 0;
      }
      if (int.parse(sumNumber) < 50) {
        finalResult = result[0];
      } else if (int.parse(sumNumber) > 80) {
        finalResult = result[1];
      } else {
        finalResult = result[2];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.teal[300],
          title: const Center(
            child: Text("Bói Tình Yêu"),
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              TextFormField(
                controller: maleController,
                onChanged: (value) {
                  setState(() {
                    maleController.value = TextEditingValue(
                        text: value.toUpperCase(),
                        selection: maleController.selection);
                    maleName = maleController.text;
                  });
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.male),
                  labelText: "Name",
                  hintText: "Male Name",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2.0),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              TextFormField(
                controller: feMaleController,
                onChanged: (value) {
                  setState(() {
                    feMaleController.value = TextEditingValue(
                        text: value.toUpperCase(),
                        selection: feMaleController.selection);
                    femaleName = feMaleController.text;
                  });
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.female),
                  labelText: "Name",
                  hintText: "Female Name",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2.0),
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        maleName,
                        style: const TextStyle(fontSize: 20.0),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        love,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        femaleName,
                        style: const TextStyle(fontSize: 20.0),
                      )
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  minimumSize: const Size(double.infinity, 0),
                  primary: Colors.teal[300],
                ),
                child: const Text(
                  "Xem Kết Quả",
                  style: TextStyle(fontSize: 18.0),
                ),
                onPressed: checkNum,
              ),
              Text(
                finalResult,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
