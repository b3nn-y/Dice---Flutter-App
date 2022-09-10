import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';

void main() {
  return runApp(Dicee());
}

class Dicee extends StatefulWidget {
  const Dicee({Key? key}) : super(key: key);

  @override
  State<Dicee> createState() => _DiceeState();
}

class _DiceeState extends State<Dicee> {
  int rb = 1;
  int lb = 1;
  int tot = 0;

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    tot = rb + lb;
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Center(
          child: Text(
            'Dice',
            style: TextStyle(
                fontFamily: 'title', fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black45)),
                  onPressed: () {},
                  child: Text(
                    'TOTAL : $tot',
                    style: TextStyle(
                      fontFamily: 'title',
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                      fontSize: 40.0,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              lb = random.nextInt(7);
                            });
                          },
                          child: Image.asset('images/dice$lb.png'),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              rb = random.nextInt(7);
                            });

                            //randomNumber = random.nextInt(7) + 1;
                          },
                          child: Image.asset('images/dice$rb.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.black45),
                ),
                onPressed: () {
                  setState(() {
                    rb = random.nextInt(7);
                    lb = random.nextInt(7);
                  });
                },
                child: Text(
                  'RANDOM',
                  style: TextStyle(
                    fontFamily: 'title',
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                    fontSize: 40.0,
                  ),
                ),
              ),
              SizedBox(
                height: 5 + 5,
              ),
              OutlinedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.black45)),
                onPressed: () {
                  setState(() {
                    rb = 1;
                    lb = 1;
                  });
                },
                child: Text(
                  'RESET',
                  style: TextStyle(
                    fontFamily: 'title',
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                    fontSize: 40.0,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
