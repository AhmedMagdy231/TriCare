import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerScreen extends StatefulWidget {
  late final String pdfPath;

  PDFViewerScreen({required this.pdfPath});
  @override
  _PDFViewerScreenState createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
       // title: Text(widget.name),
      ),
      body: SfPdfViewer.asset(
          widget.pdfPath,
      ),
    );
  }
}

/*
PDFView(
        filePath: widget.pdfPath,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageSnap: true,
        defaultPage: 0,
        fitPolicy: FitPolicy.BOTH,
        preventLinkNavigation: false,
        onRender: (pages) {
          print('PDF rendered with $pages pages.');
        },
        onError: (error) {
          print('Error occurred while rendering PDF: $error');
        },
        onPageError: (page, error) {
          print('Error occurred on page $page: $error');
        },
        onViewCreated: (PDFViewController controller) {
          // You can interact with the PDF using the controller
          // For example, to jump to a specific page:
          //controller.jumpToPage(2);
        },
        onPageChanged: (int? page, int? total) {
          print('Page $page of $total');
        },
      )
 */