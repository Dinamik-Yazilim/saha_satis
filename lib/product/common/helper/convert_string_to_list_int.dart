List<int> convertStringToListInt(String? str) {
  if (str == null || str.isEmpty) {
    return [];
  }

  // Remove any spaces and the square brackets
  str = str.replaceAll(' ', '').replaceAll('[', '').replaceAll(']', '');

  // Split the string by comma to get individual string numbers
  List<String> stringNumbers = str.split(',');

  // Convert each string number to an integer and return the list
  List<int> intList = stringNumbers.map(int.parse).toList();

  return intList;
}
