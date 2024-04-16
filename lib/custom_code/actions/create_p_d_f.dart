// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:html' as html;
import 'dart:convert';

Future createPDF(
  String? applicantName,
  double? totalAmount,
  String? currency,
) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      margin: pw.EdgeInsets.all(32),
      build: (pw.Context context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Header(level: 1, text: 'Cash Advance Declaration'),
          pw.Text('Requested By: $applicantName'),
          pw.Text('Requested Date: ${DateTime.now()}'),
          pw.Text('Total Amount: $totalAmount $currency'),
          pw.Padding(padding: const pw.EdgeInsets.all(20)),
          pw.Paragraph(
              text:
                  'By submitting this request, I attest that I have read, understood, and have been oriented with the Policy on Cash Advance and Expense Reports, which states, among others, the following:'),
          pw.Paragraph(
              text:
                  '\u2022 Cash advances shall be requested and issued for official business purposes only.'),
          pw.Paragraph(
              text:
                  '\u2022 All receipts attached in my liquidation and/or reimbursement reports are true, authentic, genuine and free from any alteration.'),
          pw.Paragraph(
              text:
                  '\u2022 Should I fail to submit my liquidation within 5 working days from the end of the activity for which cash advance was requested, the full amount of the cash advance shall be deducted from my payroll.'),
          pw.Padding(padding: const pw.EdgeInsets.all(10)),
          pw.Paragraph(
              text:
                  'I hereby agree that I will comply with and abide by the Policy on Cash Advance and Expense Reports. In the event that I fail to liquidate and/or return excess cash by the liquidation due date, I authorize the Company to deduct in full any unliquidated cash advance from my immediately succeeding salaries, subject to existing policies on deductions.'),
        ],
      ),
    ),
  );

  var savedFile = await pdf.save();
  List<int> fileInts = List.from(savedFile);
  html.AnchorElement(
      href:
          "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
    ..setAttribute("download", "${DateTime.now().millisecondsSinceEpoch}.pdf")
    ..click();
}
