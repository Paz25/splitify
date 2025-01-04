import 'package:flutter/material.dart';
import 'package:splitify/component/button_component.dart';
import 'package:splitify/component/form_component.dart';
import 'package:splitify/const/colors.dart';
import 'package:splitify/routes/routes.dart';
import 'package:splitify/view/add_people.dart';

class AddBillsView extends StatefulWidget {
  const AddBillsView({super.key});

  @override
  State<AddBillsView> createState() => _AddBillsViewState();
}

class _AddBillsViewState extends State<AddBillsView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController locationController;
  String? selectedCategoryValue;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    locationController = TextEditingController();
  }

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
          'Add New Bills',
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    inputForm(
                      (value) {
                        if (value == null || value.isEmpty) {
                          return "Please input the location of the bill";
                        }
                        return null;
                      },
                      controller: locationController,
                      helperTxt: "Location",
                    ),
                    const SizedBox(height: 24),
                    dropdownInput(
                      (value) {
                        if (value == null) {
                          return "Please select the category of bill";
                        }
                        return null;
                      },
                      dropdownMenuItems: [
                        'Food',
                        'Grocery',
                        'Entertainment',
                        'Other'
                      ],
                      helperTxt: "Category",
                      selectedValue: selectedCategoryValue,
                      onChanged: (value) {
                        setState(() {
                          selectedCategoryValue = value;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    dateInput(
                      context,
                      (date) {
                        if (date == null) {
                          return "Please select the date of the bill";
                        }
                        return null;
                      },
                      selectedDate: selectedDate,
                      onDateSelected: (date) {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                buttonPrimary(
                  context: context,
                  text: "Add People",
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      print("Selected Value: $selectedCategoryValue");
                      print("Selected Date: $selectedDate");
                      Navigator.of(context)
                          .push(createSlideRoute(const AddPeopleView()));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
