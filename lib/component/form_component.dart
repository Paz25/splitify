import 'package:flutter/material.dart';
import 'package:splitify/const/colors.dart';

SizedBox inputForm(
  Function(String?) validasi, {
  required TextEditingController controller,
  required String helperTxt,
}) {
  return SizedBox(
    width: double.infinity - (24 * 2),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          helperTxt,
          style: const TextStyle(
            fontSize: 16,
            color: TColors.secondaryColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextFormField(
          validator: (value) => validasi(value),
          autofocus: false,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: TColors.secondaryColor,
          ),
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: TColors.secondaryColor,
                width: 1,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: TColors.secondaryColor),
            ),
          ),
        ),
      ],
    ),
  );
}

SizedBox dropdownInput(
  Function(String?) validasi, {
  required List<String> dropdownMenuItems,
  required String helperTxt,
  required String? selectedValue,
  required ValueChanged<String?> onChanged,
}) {
  return SizedBox(
    width: double.infinity - (24 * 2),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          helperTxt,
          style: const TextStyle(
            fontSize: 16,
            color: TColors.secondaryColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          value: selectedValue,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: TColors.secondaryColor,
                width: 1,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: TColors.secondaryColor),
            ),
          ),
          validator: (value) => validasi(value),
          onChanged: onChanged,
          items: dropdownMenuItems.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: TColors.secondaryColor,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    ),
  );
}

SizedBox dateInput(
  BuildContext context,
  Function(DateTime?) validasi, {
  required DateTime? selectedDate,
  required ValueChanged<DateTime?> onDateSelected,
}) {
  return SizedBox(
    width: double.infinity - (24 * 2),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Date",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: TColors.secondaryColor,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null) {
              onDateSelected(pickedDate);
            }
          },
          validator: (value) => validasi(selectedDate),
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: TColors.secondaryColor,
                width: 1,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: TColors.secondaryColor),
            ),
            hintText: selectedDate != null
                ? "${selectedDate.toLocal()}".split(' ')[0]
                : "",
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: TColors.secondaryColor,
            ),
          ),
        ),
      ],
    ),
  );
}