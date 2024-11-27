import 'package:flutter/material.dart';

///{@template ErrorRouteContainer}
/// Custom container for the error route.
///{@endtemplate}
class ErrorRouteContainer extends StatelessWidget {
  ///{@macro ErrorRouteContainer}
  const ErrorRouteContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text(
          'You do not have access to this page',
        ),
      ),
    );
  }
}
