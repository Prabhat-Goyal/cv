import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';


class PDFViewerPage extends StatefulWidget{
  static const routeName = '/pdf_viewer';

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  var pdfController = null;
  int _actualPageNumber = 1, _allPagesCount = 0;
  @override
  void initState() {
    super.initState();
    // future that allows us to access context. function is called inside the future
    // otherwise it would be skipped and args would return null
    Future.delayed(Duration.zero, () {
      final args = ModalRoute.of(context)?.settings.arguments as List;
      setState(() {
        pdfController = PdfController(
          document: args[1] != 'Result' ? PdfDocument.openAsset(args[0]) : PdfDocument.openFile(args[0]),
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)?.settings.arguments as List;
    print(args);

    return Container(
      decoration: BoxDecoration(
          // gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     //colors: [kBackgroundGradient1, kBackgroundGradient2]
          // )
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          // title: Text( args[1] != 'Result' ? args[1] + ' Insight' : args[1], style: appbartitle),
          actions: args[1] == 'Result' ?  [
            // IconButton(onPressed: (){
            //   Share.shareFiles([args[0]]);
            // }, icon: Icon(Icons.share)),
          ] : [],
          // centerTitle: true,
        ),
        body: pdfController != null ? Column(
          children: [
            Container(
              height: deviceSize.height * 0.8,
              child: PdfView(
                controller: pdfController,
                onDocumentLoaded: (document) {
                  print("LOAD" + document.pagesCount.toString());
                  setState(() {
                    _allPagesCount = document.pagesCount;
                  });
                },
                onPageChanged: (page) {
                  setState(() {
                    _actualPageNumber = page;
                  });
                },
              ),
            ),
            Text('$_actualPageNumber of $_allPagesCount'),
          ],
        ) : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}