nearest_fibonacci(List<int> value) {
  int total = 0;
  for (int i = 0; i < value.length; i++) {
    total += value[i];
  }

  if (total == 0) return (total);

  int first = 0;
  int second = 1;
  int third = first + second;

  while (third <= total) {
    first = second;
    second = third;
    third = first + second;
  }

  int result = (third - total).abs() >= (second - total).abs() ? second : third;

  print(result);
}

main() {
  nearest_fibonacci([15, 1, 3]);
}
