import 'package:cv/pdf_viewer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'dart:io';

void main() {
  runApp(pdf());
}

class pdf extends StatelessWidget {
  late final String path;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 20,
            child: ElevatedButton(
              onPressed: () async {
                await main(context);
              },
              child: Text("Generate"),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> main(context) async {
    final pdf = pw.Document();
    final deviceSize = MediaQuery.of(context).size;

    final image = pw.MemoryImage(
      (await rootBundle.load('images/demo.png')).buffer.asUint8List(),
    );

    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) {
        return pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                  width: PdfPageFormat.a4.width / 2,
                  child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Container(
                            width: PdfPageFormat.a4.width / 2.5,
                            height: 40,
                            decoration: pw.BoxDecoration(
                              color: PdfColor.fromHex("#A6CECD"),
                              borderRadius: pw.BorderRadius.only(
                                  bottomRight: pw.Radius.circular(25)),
                            )),
                        pw.Container(
                            width: double.infinity,
                            margin: pw.EdgeInsets.fromLTRB(10, 40, 20, 0),
                            padding: pw.EdgeInsets.fromLTRB(3, 3, 40, 3),
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.purple,width: 2),
                            ),
                            child: pw.Text(
                              "NEIL TRAN",
                              style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontSize: 30,
                                  fontWeight: pw.FontWeight.bold),
                            )),
                        pw.SizedBox(height: 10),
                        pw.Container(
                          width: PdfPageFormat.a4.width / 2.7,
                          height: 40,
                          decoration: pw.BoxDecoration(
                            color: PdfColor.fromHex("#A6CECD"),
                            borderRadius: pw.BorderRadius.only(
                                bottomRight: pw.Radius.circular(20),
                                topRight: pw.Radius.circular(20)),
                          ),
                          child: pw.Align(
                              alignment: pw.Alignment.centerLeft,
                              child: pw.Padding(
                                  padding: pw.EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: pw.Text("DIGITAL MARKETING",
                                      style: pw.TextStyle(
                                        fontSize: 16,
                                      )))),
                        ),
                        pw.Container(
                            padding: pw.EdgeInsets.only(
                                left: 30, right: 13, top: 15, bottom: 15),
                            width: PdfPageFormat.a4.width / 2,
                            child: pw.Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy.",
                                textAlign: pw.TextAlign.justify,
                                style: pw.TextStyle(
                                  fontSize: 16,
                                ))),
                        pw.Container(
                          height: 40,
                          width: PdfPageFormat.a4.width / 2.8,
                          decoration: pw.BoxDecoration(
                            color: PdfColor.fromHex("#A6CECD"),
                            borderRadius: pw.BorderRadius.only(
                                bottomRight: pw.Radius.circular(20),
                                topRight: pw.Radius.circular(20)),
                          ),
                          child: pw.Align(
                              alignment: pw.Alignment.centerLeft,
                              child: pw.Padding(
                                  padding: pw.EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: pw.Text("CONTACT",
                                      style: pw.TextStyle(
                                        fontSize: 16,
                                      )))),
                        ),
                        pw.Container(
                            padding: pw.EdgeInsets.fromLTRB(30, 30, 0, 0),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text("ADDRESS:",
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold,
                                          fontSize: 18)),
                                  pw.SizedBox(height: 8),
                                  pw.Text("Subham heights",
                                      style: pw.TextStyle(fontSize: 16)),
                                  pw.SizedBox(height: 12),
                                  pw.Text("Email:",
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold,
                                          fontSize: 18)),
                                  pw.SizedBox(height: 8),
                                  pw.Text("demo@gmail.com",
                                      style: pw.TextStyle(fontSize: 16)),
                                  pw.SizedBox(height: 12),
                                  pw.Text("WEBSITE:",
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold,
                                          fontSize: 18)),
                                  pw.SizedBox(height: 8),
                                  pw.Text("www.demo.com",
                                      style: pw.TextStyle(fontSize: 16)),
                                  pw.SizedBox(height: 12),
                                  pw.Text("Phone No.:",
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold,
                                          fontSize: 18)),
                                  pw.SizedBox(height: 8),
                                  pw.Text("1239939993",
                                      style: pw.TextStyle(fontSize: 16)),
                                ])),
                        pw.SizedBox(height: 20),
                        pw.Container(
                          height: 40,
                          width: PdfPageFormat.a4.width / 2.8,
                          decoration: pw.BoxDecoration(
                            color: PdfColor.fromHex("#A6CECD"),
                            borderRadius: pw.BorderRadius.only(
                                bottomRight: pw.Radius.circular(20),
                                topRight: pw.Radius.circular(20)),
                          ),
                          child: pw.Align(
                              alignment: pw.Alignment.centerLeft,
                              child: pw.Padding(
                                  padding: pw.EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: pw.Text("SKILL",
                                      style: pw.TextStyle(
                                        fontSize: 16,
                                      )))),
                        ),
                        pw.Container(
                            padding: pw.EdgeInsets.fromLTRB(30, 30, 20, 0),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Row(crossAxisAlignment:pw.CrossAxisAlignment.start,mainAxisAlignment:pw.MainAxisAlignment.spaceBetween,children: [pw.Text("Digital Marketing",
                                      style: pw.TextStyle(fontSize: 16)),
                                    pw.SizedBox(width: 20),
                                    pw.Container(width:100,child: pw.LinearProgressIndicator(value: 0.7,valueColor: PdfColors.cyan,minHeight: 8))
                                  ]),
                                  pw.SizedBox(height: 12),
                                  pw.Row(crossAxisAlignment:pw.CrossAxisAlignment.start,mainAxisAlignment:pw.MainAxisAlignment.spaceBetween,children: [pw.Text("Social Media Ads",
                                      style: pw.TextStyle(fontSize: 16)),
                                    pw.SizedBox(width: 20),
                                    pw.Container(width:100,child: pw.LinearProgressIndicator(value: 0.7,valueColor: PdfColors.cyan,minHeight: 8))
                                  ]),
                                  pw.SizedBox(height: 12),
                                  pw.Row(crossAxisAlignment:pw.CrossAxisAlignment.start,mainAxisAlignment:pw.MainAxisAlignment.spaceBetween,children: [pw.Text("Email Marketing",
                                      style: pw.TextStyle(fontSize: 16)),
                                    pw.SizedBox(width: 20),
                                    pw.Container(width:100,child: pw.LinearProgressIndicator(value: 0.7,valueColor: PdfColors.cyan,minHeight: 8))
                                  ]),
                                  pw.SizedBox(height: 12),
                                  pw.Row(crossAxisAlignment:pw.CrossAxisAlignment.start,mainAxisAlignment:pw.MainAxisAlignment.spaceBetween,children: [pw.Text("Google Analytics",
                                      style: pw.TextStyle(fontSize: 16)),
                                    pw.SizedBox(width: 20),
                                    pw.Container(width:100,child: pw.LinearProgressIndicator(value: 0.7,valueColor: PdfColors.cyan,minHeight: 8))
                                  ]),
                                  pw.SizedBox(height: 12),
                                  pw.Row(crossAxisAlignment:pw.CrossAxisAlignment.start,mainAxisAlignment:pw.MainAxisAlignment.spaceBetween,children: [pw.Text("Google Ads",
                                      style: pw.TextStyle(fontSize: 16)),
                                    pw.SizedBox(width: 20),
                                    pw.Container(width:100,child: pw.LinearProgressIndicator(value: 0.7,valueColor: PdfColors.cyan,minHeight: 8))
                                  ])

                                ])),

                      ])),
              pw.Container(
                  width: PdfPageFormat.a4.width / 2,
                  child: pw.Column(children: [
                    pw.SizedBox(height: 40),
                    pw.Container(
                      alignment: pw.Alignment.center,
                      width: 240,
                      height: 240,
                      decoration: pw.BoxDecoration(
                        shape: pw.BoxShape.circle,
                        image: pw.DecorationImage(
                            image: image, fit: pw.BoxFit.cover),
                      ),
                    ),
                    pw.SizedBox(height: 30),
                    pw.Container(
                      width: PdfPageFormat.a4.width / 2,
                      decoration: pw.BoxDecoration(
                        color: PdfColor.fromHex("#A6CECD"),
                        borderRadius: pw.BorderRadius.only(
                            bottomLeft: pw.Radius.circular(20),
                            topLeft: pw.Radius.circular(20)),
                      ),
                      child: pw.Padding(
                        padding: const pw.EdgeInsets.all(20.0),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                          pw.Text("EDUCATION",
                              style: pw.TextStyle(
                                fontSize: 20,
                                fontWeight: pw.FontWeight.bold,
                              )),
                              pw.SizedBox(height: 16),
                              pw.Text("2005-2010",
                                  style: pw.TextStyle(
                                    fontSize: 18,
                                    fontWeight: pw.FontWeight.bold,
                                  )),
                              pw.SizedBox(height: 10),
                              pw.Text("Bachelor of Arts",
                                  style: pw.TextStyle(
                                    fontSize: 18,
                                    fontWeight: pw.FontWeight.bold,
                                  )),
                              pw.Text("Graduated with",
                                  style: pw.TextStyle(
                                    fontSize: 16,
                                  )),
                              pw.SizedBox(height: 16),
                              pw.Text("20010-2012",
                                  style: pw.TextStyle(
                                    fontSize: 18,
                                    fontWeight: pw.FontWeight.bold,
                                  )),
                              pw.SizedBox(height: 10),
                              pw.Text("Master of Arts",
                                  style: pw.TextStyle(
                                    fontSize: 18,
                                    fontWeight: pw.FontWeight.bold,
                                  )),
                              pw.Text("Graduated with honor",
                                  style: pw.TextStyle(
                                    fontSize: 16,
                                  )),
                              pw.SizedBox(height: 16),
                              pw.Text("EXPERIENCE WORK",
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                    fontWeight: pw.FontWeight.bold,
                                  )),
                              pw.SizedBox(height: 16),
                              pw.Text("20010-2012",
                                  style: pw.TextStyle(
                                    fontSize: 18,
                                    fontWeight: pw.FontWeight.bold,
                                  )),
                              pw.SizedBox(height: 10),
                              pw.Text("Developer",
                                  style: pw.TextStyle(
                                    fontSize: 18,
                                    fontWeight: pw.FontWeight.bold,
                                  )),
                              pw.Text("Graduated with honor jndcnjknkjcjkkj jkkjncknkdjn jkfkjnjfbbjfjbvjj nkjfvjkbb nknfnjknj",textAlign: pw.TextAlign.justify,
                                  style: pw.TextStyle(
                                    fontSize: 16,
                                  )),
                              pw.SizedBox(height: 16),
                              pw.Text("2000-2012",
                                  style: pw.TextStyle(
                                    fontSize: 18,
                                    fontWeight: pw.FontWeight.bold,
                                  )),
                              pw.SizedBox(height: 10),
                              pw.Text("UI Designer",
                                  style: pw.TextStyle(
                                    fontSize: 18,
                                    fontWeight: pw.FontWeight.bold,
                                  )),
                              pw.Text("Graduated with honor jndcnjknkjcjkkj jkkjncknkdjn jkfkjnjfbbjfjbvjj nkjfvjkbb nknfnjknj",textAlign: pw.TextAlign.justify,
                                  style: pw.TextStyle(
                                    fontSize: 16,
                                  )),
                        ]),
                      )
                    ),
                  ]))
            ]);
      },
    ));

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/form.pdf';
    final File file = File(path);
    await file.writeAsBytes(await pdf.save());
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PDFViewerPage(),
        settings: RouteSettings(arguments: [path, 'Result']),
      ),
    );
  }
}
