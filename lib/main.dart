import 'package:flutter/material.dart';
import 'package:job_listing_app/Home/home_ui.dart';

void main() => runApp(JobListingApp());

class JobListingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}