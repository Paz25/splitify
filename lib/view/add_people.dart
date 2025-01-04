import 'package:flutter/material.dart';
import 'package:splitify/const/colors.dart';

class AddPeopleView extends StatefulWidget {
  const AddPeopleView({super.key});

  @override
  State<AddPeopleView> createState() => _AddPeopleViewState();
}

class _AddPeopleViewState extends State<AddPeopleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: TColors.tertiaryColor,
          ),
        ),
        title: const Text(
          'Add People',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: TColors.tertiaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: TColors.secondaryColor,
      ),
    );
  }
}
