import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:registration/resources/constants/colors.dart';

class DateTextField extends StatefulWidget {
  const DateTextField({Key? key}) : super(key: key);

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  TextEditingController dateInput = TextEditingController();
  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.h,
      width: 328.w,
      child: TextField(
        controller: dateInput,
        decoration: InputDecoration(
          label: const Text(
            "Date",
            style: TextStyle(
              color: Color.fromRGBO(27, 27, 27, 0.5),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 23),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorClass.purple),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              builder: ((context, child) {
                return Theme(
                  data: ThemeData.dark().copyWith(
                      colorScheme: const ColorScheme.dark(
                        primary: ColorClass.purple,
                        onPrimary: Color.fromARGB(85, 27, 27, 27),
                        surface: Color.fromARGB(255, 97, 69, 113),
                        onSurface: Color.fromARGB(255, 224, 177, 251),
                      ),
                      dialogBackgroundColor: ColorClass.purple,
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          primary: Colors.white, // button text color
                        ),
                      )),
                  child: child!,
                );
              }),
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101));

          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

            setState(() {
              dateInput.text = formattedDate;
            });
          } else {
            print("Date is not selected");
          }
          ;
        },
      ),
    );
  }
}