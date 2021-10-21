leapYear(int start, int end){
  String result = '';

  for (int i = start; i <= end; i++) {
    if (i%4 == 0 && i%100 != 0 || i%400 ==0) {
      result += i.toString() + ', ';
    }
  }

  print(result);
}

main(){
  leapYear(1900, 2020);
}