
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConditionController extends GetxController {
  TextEditingController textEditingController = TextEditingController();

  final _haveEightCharacters = false.obs;
  bool get haveEightCharacters => _haveEightCharacters.value;
  
  void checkHaveEightCharacters(bool value) {
    _haveEightCharacters.value = value;
  }

  final _upperCaseCharecter = false.obs;
  bool get upperCaseCharecter => _upperCaseCharecter.value;
  
  void checkupperCaseCharecter(bool value) {
    _upperCaseCharecter.value = value;
  }

   final _lowerCharecter = false.obs;
  bool get lowerCharecter => _lowerCharecter.value;
  
  void checkLowerCharecter(bool value) {
    _lowerCharecter.value = value;
  }

  final _specialCharecter = false.obs;
  bool get specialCharecter => _specialCharecter.value;
  
  void checkSpecialCharecter(bool value) {
    _specialCharecter.value = value;
  }

  void checkingCharacters() {
    if (textEditingController.text.length >= 8) {
      checkHaveEightCharacters(true);
    } else {
      checkHaveEightCharacters(false);
    }

    if (textEditingController.text.contains(RegExp(r'[A-Z]'))) {
      _upperCaseCharecter(true);
    } else {
      _upperCaseCharecter(false);
    }

    
    if (textEditingController.text.contains(RegExp(r'[a-z]'))) {
      _lowerCharecter(true);
    } else {
      _lowerCharecter(false);
    }

    if (textEditingController.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      _specialCharecter(true);
    } else {
      _specialCharecter(false);
    }
  }

 

  // void checkupperCaseCharecter()



  @override
  void onInit() {
    super.onInit();
    textEditingController.addListener(checkingCharacters);
  }

  @override
  void onClose() {
    textEditingController.removeListener(checkingCharacters);
    textEditingController.dispose();
    super.onClose();
  }
}
