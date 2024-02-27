import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense_page extends StatefulWidget {
  const AddExpense_page({super.key});

  @override
  State<AddExpense_page> createState() => _AddExpense_pageState();
}

class _AddExpense_pageState extends State<AddExpense_page> {

  TextEditingController expenseController=TextEditingController();
  TextEditingController categoryController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  DateTime selectedDate=DateTime.now();

  String iconSelected='';
  late Color colorSelected;

  FocusNode _focusNode = FocusNode();

  List<String> myExpenseIcon=[
    'entertainment',
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel'
  ];

  @override
  void initState() {
    dateController.text=DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Add Expense",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.7,
                child: TextFormField(
                  controller: expenseController,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(FontAwesomeIcons.indianRupeeSign,size: 20,),
                      hintText: "Enter the Amount",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      )
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              TextFormField(
                controller: categoryController,
                style: TextStyle(
                    fontSize: 16
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Category",
                  prefixIcon: Icon(Icons.list),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon :IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx){
                          Color colorSelected=Colors.white;
                          bool isExpanded=false;
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return AlertDialog(
                                title: Text("Create a Category"),
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextFormField(
                                        decoration: InputDecoration(
                                            isDense: true,
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintText: "Name",
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(12),
                                            )
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      TextFormField(
                                        focusNode: _focusNode,
                                        onTap: () {
                                          setState(() {
                                            isExpanded= !isExpanded;
                                          },);
                                          _focusNode.unfocus();
                                        },
                                        decoration: InputDecoration(
                                            isDense: true,
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintText: "Icon",
                                            suffixIcon: Icon(Icons.arrow_drop_down),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(12),
                                              ),
                                            )
                                        ),
                                      ),
                                      isExpanded?Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(12),
                                          ),
                                        ),
                                        child: GridView.builder(
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisSpacing: 5,
                                            crossAxisSpacing: 5,
                                          ),
                                          itemCount: myExpenseIcon.length,
                                          itemBuilder: (context, int i) {
                                            return Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    iconSelected = myExpenseIcon[i];
                                                  },);
                                                },
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  //padding: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 3,
                                                        color: myExpenseIcon[i]==iconSelected
                                                            ?Colors.cyan
                                                            :Colors.grey
                                                    ),
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  padding: EdgeInsets.all(10), // Add padding here
                                                  child: Image.asset(
                                                    'lib/assets/${myExpenseIcon[i]}.png',
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                          :Container(),
                                      const SizedBox(height: 10,),
                                      TextFormField(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (ctx2) {
                                              return AlertDialog(
                                                content: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    ColorPicker(
                                                      pickerColor: colorSelected,
                                                      onColorChanged: (value) {
                                                        setState(() {
                                                          colorSelected=value;
                                                        },
                                                        );
                                                      },
                                                    ),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      height: 50,
                                                      child:  TextButton(
                                                        onPressed:() {
                                                          Navigator.pop(ctx2);
                                                        },
                                                        style: TextButton.styleFrom(
                                                          backgroundColor: Colors.black,
                                                          foregroundColor: Colors.white,
                                                        ),
                                                        child: Text(
                                                          "Save",
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        textAlignVertical: TextAlignVertical.center,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            filled: true,
                                            fillColor: colorSelected,
                                            hintText: "Color",
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(12),
                                            )
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      SizedBox(
                                        width: double.infinity,
                                        height: kToolbarHeight,
                                        child: TextButton(
                                          onPressed:() {
                                            Navigator.pop(context);
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            foregroundColor: Colors.white,
                                          ),
                                          child: Text(
                                            "Save",
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },

                      );
                    },
                    icon: Icon(Icons.add),
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              TextFormField(
                controller: dateController ,
                onTap:() async {
                  DateTime? newDate=await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                  );
                  if(newDate!=null){
                    dateController.text=DateFormat('dd/MM/yyyy').format(newDate);
                    selectedDate=newDate;
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.date_range),
                  hintText: "Date",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              SizedBox(
                width: double.infinity,
                height: kToolbarHeight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: TextButton(
                    onPressed:() {

                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      "Save",
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}