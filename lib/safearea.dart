import 'package:flutter/material.dart';

class SafeAreaTrial extends StatelessWidget {
  const SafeAreaTrial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('SafeArea'),
      // ),
      body: SafeArea(
        // top: false,
        minimum: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.blueAccent,
              padding: const EdgeInsets.all(16),
              child: const Text(
                "This container is safely placed without overlapping notches.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SafeArea(
              top: true,
              bottom: false,
              left: false,
              right: false,
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  "SafeArea applied only to the top.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SafeArea(
              top: false,
              bottom: true,
              left: false,
              right: false,
              child: Container(
                color: Colors.red,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  "SafeArea applied only to the bottom.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SafeArea(
              left: true,
              right: true,
              top: false, 
              bottom: false, 
              child: Container(
                color: Colors.orange,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  "SafeArea applied to left and right only.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: Colors.purple,
                    child: const Text(
                      "This text is under the safe area.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SafeArea(
                  child: Positioned.fill(
                    child: Container(
                      color: Colors.purple,
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        "SafeArea applied inside Stack.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
