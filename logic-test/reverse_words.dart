reverseWord(String value) {
  List reverseWordAll = [];
  List listOfWord = value.split(" ");

  for (int i = 0; i < listOfWord.length; i++) {
    String reverseWord = '';
    for (int j = listOfWord[i].length - 1; j >= 0; j--) {
      // reverseWord += listOfWord[i][j];
      if (String.fromCharCode(listOfWord[i][0].codeUnitAt(0)).toUpperCase() ==
          String.fromCharCode(listOfWord[i][0].codeUnitAt(0))) {
            if (j == listOfWord[i].length - 1) {
              reverseWord += String.fromCharCode(listOfWord[i][j].codeUnitAt(0)).toUpperCase();
            }else{
              reverseWord += String.fromCharCode(listOfWord[i][j].codeUnitAt(0)).toLowerCase();
            }
      } else {
        reverseWord += String.fromCharCode(listOfWord[i][j].codeUnitAt(0));
      }
    }
    reverseWordAll.add(reverseWord);
  }
  print(reverseWordAll.join(" "));
}

main() {
  reverseWord("I am A Great human");
}
