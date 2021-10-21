fizzBuzz(int value) {
  List<String> result = [];

  for (int i = 1; i <= value; i++) {
    if (i % 3 == 0 && i % 5 != 0) {
      result.add('"Fizz"');
    } else if (i % 5 == 0 && i % 3 != 0) {
      result.add('"Buzz"');
    } else if (i % 5 == 0 && i % 3 == 0) {
      result.add('"FizzBuzz"');
    } else {
      result.add('"$i"');
    }
  }

  print(result);
}

void main(List<String> args) {
  fizzBuzz(3);
  fizzBuzz(5);
  fizzBuzz(15);
}
