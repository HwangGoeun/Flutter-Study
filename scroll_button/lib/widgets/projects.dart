import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 500,
          decoration: const BoxDecoration(color: Colors.black),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(color: Colors.amber),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
