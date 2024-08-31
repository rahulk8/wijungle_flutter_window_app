import 'package:flutter/material.dart';
import 'package:flutter_window_wijungle/services/cpp_service.dart';

class AnalyticsScreen extends StatefulWidget {
  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  double _cpuUsage = 0.0;
  double _ramUsage = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchUsageData();
  }

  void _fetchUsageData() {
    CppService.getUsageData().then((data) {
      setState(() {
        _cpuUsage = data['cpu']!;
        _ramUsage = data['ram']!;
      });
    });
    Future.delayed(Duration(seconds: 5), _fetchUsageData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Analytics')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('CPU Usage: $_cpuUsage%'),
            SizedBox(height: 10),
            Text('RAM Usage: $_ramUsage%'),
          ],
        ),
      ),
    );
  }
}
