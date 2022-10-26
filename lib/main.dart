import 'package:flutter/material.dart';
import 'constants/theme_constants.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      body: LendingButtonPage(),
    ),
  ));
}

// Instant Credit Button State
bool icButtonActive = true;

double chosenOption = -1.0;

// Green Bar Positioning
void updateColour(bool buttonState) {
  if (icButtonActive == true) {
    chosenOption = -1.0;
  } else {
    chosenOption = 1.0;
  }
}

class LendingButtonPage extends StatefulWidget {
  const LendingButtonPage({Key? key}) : super(key: key);

  @override
  State<LendingButtonPage> createState() => _LendingButtonPageState();
}

class _LendingButtonPageState extends State<LendingButtonPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            'FlexiCredit',
            key: Key('heading'),
            style: StyleConstants.primaryButtonTextStyle(),
          ),
          Row(
            key: Key('content'),
            children: <Widget>[
              Expanded(
                key: Key('button'),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      icButtonActive = true;
                      updateColour(icButtonActive);
                    });
                  },
                  child: LendingButtonCard(
                    image: 'assets/images/lending_icon_1.png',
                    type: 'Instant Credit',
                    description:
                        'Withdraw as little as Rs 10000 or up to your  entire limit',
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      icButtonActive = false;
                      updateColour(icButtonActive);
                    });
                  },
                  child: LendingButtonCard(
                    image: 'assets/images/lending_icon_2.png',
                    type: 'Easy Repayments',
                    description:
                        'Pay interest only on the portion of the loan you use, when you use it, and for the duration you use it',
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: OptionBar(
              chosenOption: chosenOption,
            ),
          ),
        ],
      ),
    );
  }
}

// image = button icon, type = button name, description = button description
class LendingButtonCard extends StatelessWidget {
  LendingButtonCard({
    Key? key,
    required this.image,
    required this.type,
    required this.description,
  }) : super(key: key);

  final String image;
  final String type;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.asset(image),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              type,
              style: StyleConstants.secondaryButtonTextStyle(),
            ),
          ),
          Container(
            width: 130,
            child: Text(
              description,
              style: StyleConstants.heading4(),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionBar extends StatelessWidget {

  final double chosenOption;

  const OptionBar({
    Key? key,
    required this.chosenOption
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3,
      width: 335,
      child: Stack(
        children: [
          Container(
            color: Color(0xF979797),
          ),
          Align(
            alignment: Alignment(chosenOption, 0),
            child: Container(
              width: 143,
              height: 3,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
