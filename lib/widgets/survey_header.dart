import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SurveyHeaderWidget extends StatefulWidget {
  const SurveyHeaderWidget({
    Key? key,
    this.quizNumber,
    this.totalQuiz,
  }) : super(key: key);

  final int? quizNumber;
  final int? totalQuiz;

  @override
  _SurveyHeaderWidgetState createState() => _SurveyHeaderWidgetState();
}

class _SurveyHeaderWidgetState extends State<SurveyHeaderWidget> {
  TextStyle useSameTextStyle() {
    return TextStyle(
        fontFamily: 'Poppins',
        color: Theme.of(context).colorScheme.secondary,
        fontSize: 18,
        fontWeight: FontWeight.w500);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Question ', style: useSameTextStyle()),
            Text(widget.quizNumber!.toString(), style: useSameTextStyle()),
            Text('/', style: useSameTextStyle()),
            Text(widget.totalQuiz!.toString(), style: useSameTextStyle()),
          ],
        ),
      ),
    );
  }
}
