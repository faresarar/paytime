import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../helpers/banks.dart';
import '../helpers/elevatedbutton.dart';
import '../helpers/form_field.dart';

class TransferMoneyPage extends StatefulWidget {
  const TransferMoneyPage({
    super.key,
  });

  @override
  State<TransferMoneyPage> createState() => _TransferMoneyPageState();
}

class _TransferMoneyPageState extends State<TransferMoneyPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  String? selected;

  @override
  Widget build(BuildContext context) {
    BankList bankList = BankList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        backgroundColor: AppColors.tealColor,
        title: Text(
          'Send Money',
          style: AppTextStyles.appBarStyle,
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.green),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton2(
                        isDense: true,
                        hint: Text('Select Bank', style: AppTextStyles.body),
                        value: selected,
                        onChanged: (value) {
                          setState(() {
                            selected = value.toString();
                          });
                        },
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.search,
                            color: AppColors.tealColor,
                          ),
                        ),
                        items: bankList.myBankList
                            .where((item) =>
                                item['name'].toLowerCase().contains(
                                    searchController.text.toLowerCase()) ||
                                searchController.text.isEmpty)
                            .map((item) {
                          return DropdownMenuItem(
                            value: item['name'].toString(),
                            child: Row(
                              children: [
                                Image.asset(
                                  item['image'].toString(),
                                  width: 25,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(item['name'].toString()),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        dropdownSearchData: DropdownSearchData(
                          searchController: searchController,
                          searchInnerWidgetHeight: 55,
                          searchInnerWidget: Container(
                            height: 60,
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 4,
                              right: 8,
                              left: 8,
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {});
                              },
                              expands: true,
                              maxLines: null,
                              controller: searchController,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                  Icons.search,
                                  color: AppColors.tealColor,
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                hintText: 'Search For Bank Name',
                                hintStyle: AppTextStyles.page,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          searchMatchFn: (item, searchValue) {
                            return item.value
                                .toString()
                                .toLowerCase()
                                .contains(searchValue.toLowerCase());
                          },
                        ),
                        onMenuStateChange: (isOpen) {
                          if (!isOpen) {
                            searchController.clear();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: '      Account Number',
                    labelStyle: AppTextStyles.body,
                    suffixIcon: GestureDetector(
                      child: const Icon(
                        Icons.format_list_numbered_outlined,
                        color: AppColors.tealColor,
                      ),
                      onTap: () {},
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {});
                  },
                  validator: (val) {
                    if (val!.isNotEmpty) {
                      return null;
                    } else {
                      return "Field cannot be empty";
                    }
                  },
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: '     Amount',
                    labelStyle: AppTextStyles.body,
                    suffixIcon: GestureDetector(
                      child: const Icon(
                        Icons.money,
                        color: AppColors.tealColor,
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: '     Narration',
                    labelStyle: AppTextStyles.body,
                  ),
                  onChanged: (val) {
                    setState(() {});
                  },
                  validator: (val) {
                    if (val!.isNotEmpty) {
                      return null;
                    } else {
                      return "Field cannot be empty";
                    }
                  },
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButtonPage(
                text: 'Send',
                onPressed: () {
                  // Show alert dialog for PIN input
                  _showPinInputDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPinInputDialog(BuildContext context) {
    final FocusNode pinFocus = FocusNode();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Input PIN',
                  style: AppTextStyles.stream,
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  labelText: 'Input pin to pay',
                  controller: pinController,
                  keyBoard: TextInputType.number,
                  focusNode: pinFocus,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Add logic to process the PIN and send money
                  },
                  child: Text(
                    'Pay Now',
                    style: AppTextStyles.body,
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: AppTextStyles.cancel,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
