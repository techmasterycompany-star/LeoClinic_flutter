import 'package:flutter/material.dart';
import 'package:leoclinic_flutter/core/widgets/button.dart';

class ActionsForCards extends StatelessWidget {
  final bool showiconLightbutton;
  final bool showiconDarkbutton;
  final String labelOfBlueAction , labelOflightblueAction;
  final void Function() onPressedOfBlueAcion;
  final void Function() onPressedOfLightBlueAcion;
  final Color blueBackground;
  final Color lightBlueBackground;
  final Color foregroundForblueBackground;
    final Color foregroundForLightblueBackground;

  const ActionsForCards({super.key, 
   required this.labelOfBlueAction, required this.labelOflightblueAction,
    required this.onPressedOfBlueAcion, required this.onPressedOfLightBlueAcion,
     required this.blueBackground, required this.lightBlueBackground,
      required this.foregroundForblueBackground, 
      required this.foregroundForLightblueBackground, required this.showiconLightbutton, required this.showiconDarkbutton});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Button(label: labelOfBlueAction, onPressed: onPressedOfBlueAcion,
           backgroundcolor: blueBackground, foregroundcolor: foregroundForblueBackground,showicon: showiconDarkbutton,)
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child:Button(label: labelOflightblueAction, onPressed: onPressedOfLightBlueAcion,
           backgroundcolor: lightBlueBackground, foregroundcolor: foregroundForLightblueBackground,
            showicon: showiconLightbutton)
          ),
       ] );
  }
}