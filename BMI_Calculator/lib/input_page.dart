import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

int height = 180;
int weight = 5;
int minAge = 10;
int maxAge =120;
int age = 10;

var containerColorValue = kInactiveColorValue;
var maleCardColor = kInactiveColorValue;
var femaleCardColor = kInactiveColorValue;

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: GenderCard(
                      colour: selectedGender == Gender.male
                          ? kActiveColorValue
                          : kInactiveColorValue,
                      fontAwesomeIcon: FontAwesomeIcons.mars,
                      gender: "MALE",
                    ),
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: GenderCard(
                        colour: selectedGender == Gender.female
                            ? kActiveColorValue
                            : kInactiveColorValue,
                        fontAwesomeIcon: FontAwesomeIcons.venus,
                        gender: "FEMALE"),
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: containerColorValue,
                    cardChild: Column(
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              height.toString(),
                              style: kInputTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 24.0,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 10.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 16.0),
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x1fEB1555),
                              activeTrackColor: Colors.white,
                              disabledActiveTrackColor: Color(0xFF8D8E98),
                            ),
                            child: Slider(
                                min: 60.0,
                                max: 260.0,
                                value: height.toDouble(),
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.toInt();
                                  });
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: containerColorValue,
                    cardChild: Column(
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kInputTextStyle,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 44.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              RoundedIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },

                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: containerColorValue,
                    cardChild: Column(
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kInputTextStyle,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 44.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              RoundedIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },

                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calcBrain = CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(bmiValue: calcBrain.calcBMI(),comment: calcBrain.getResult(),interpretation: calcBrain.getInterpretation(),)));
            },
            child: Container(
              width: double.infinity,
              height: kBottomContainerHeight,
              color: const Color(0xFFEB1555),
              child: Center(child: Text('CALCULATE',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))),
            ),
          )
        ],
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  IconData icon;

  var onPressed;
  var onLongPress;
  RoundedIconButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: Icon(icon),
      elevation: 16.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: const BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
    );
  }
}

// ignore: must_be_immutable
