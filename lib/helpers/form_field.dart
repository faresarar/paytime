import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormField extends StatefulWidget {
  final IconData? icon;
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final Color focusIndicatorColor;
  final TextInputType keyBoard;
  final bool readOnly;

  const CustomFormField(
      {super.key,
      this.icon,
      required this.labelText,
      required this.controller,
      this.obscureText = false,
      this.onChanged,
      this.validator,
      this.focusIndicatorColor = Colors.teal,
      this.keyBoard = TextInputType.text,
      this.readOnly = false,
      FocusNode? focusNode});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late FocusNode _focusNode;
  bool _obscureText = false;

  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var formFieldDecoration = InputDecoration(
      labelStyle: GoogleFonts.montaga(
        color: Colors.teal,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.teal,
          width: 2,
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.teal, width: 2),
      ),
    );

    return Focus(
      focusNode: _focusNode,
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: formFieldDecoration.copyWith(
          labelText: widget.labelText,
          prefixIcon: Icon(
            widget.icon,
            color: Colors.teal,
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                    // Toggle password visibility
                    widget.onChanged?.call(widget.controller.text);
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.teal,
                  ),
                )
              : null,
        ),
        keyboardType: widget.keyBoard,
        textInputAction: TextInputAction.done,
        cursorColor: Colors.teal,
        onChanged: widget.onChanged,
        validator: widget.validator,
        readOnly: widget.readOnly,
      ),
    );
  }
}

void newScreenReplaceMent(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void snackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      '$message',
      style: GoogleFonts.montaga(fontSize: 15, fontWeight: FontWeight.w400),
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 4),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
      textColor: Colors.white,
    ),
  ));
}

class AppColors {
  static const tealColor = Colors.teal;
  static var amberColor = Colors.amber[100];
  static const blueColor = Colors.blue;
}

class AppTextStyles {
  static TextStyle title = GoogleFonts.montaga(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: Colors.teal,
      letterSpacing: 1.2);

  static TextStyle subtitle = GoogleFonts.montaga(
      fontSize: 25, fontWeight: FontWeight.bold, color: Colors.amber[100]);

  static TextStyle stream =
      GoogleFonts.montaga(fontSize: 20, color: Colors.grey[900]);

  static TextStyle body = GoogleFonts.montaga(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal);

  static TextStyle cancel = GoogleFonts.montaga(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red);

  static TextStyle textButtonSelec = GoogleFonts.montaga(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber[100]);
  static TextStyle textButtonUnselect = GoogleFonts.montaga(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.5);

  static TextStyle page = GoogleFonts.montaga(
      fontSize: 15, fontWeight: FontWeight.bold, color: Colors.teal);
  static TextStyle card = GoogleFonts.montaga(
      fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle appBarStyle = GoogleFonts.montaga(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.amber[100],
      letterSpacing: 1.5);

  static TextStyle userName = GoogleFonts.montaga(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800]);
}
