palindrome(String word){
  String reverseWord = '';

  for(int i = word.length - 1; i >= 0; i--){
    reverseWord += word[i];
  }

  if (reverseWord.toLowerCase() == word.toLowerCase()) {
    print("palindrome");
  } else {
    print("not palindrome");
  }
}

main(List<String> args) {
  palindrome("Radar");
  palindrome("Malam");
  palindrome("Kasur ini rusak");
  palindrome("Ibu Ratna antar ubi");
  palindrome("Malas");
  palindrome("Makan nasi goreng");
  palindrome("Balonku ada lima");
}