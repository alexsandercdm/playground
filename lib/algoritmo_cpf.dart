void main() {
  String cpf = '111444777';

  var digiOne = checkDigitOne(cpf);

  print('$cpf${digiOne!.elementAt(0)}${digiOne.elementAt(1)}');
}

List<int>? checkDigitOne(String cpf) {
  List<int> cpfList = [];
  cpf.split('').forEach((element) {
    cpfList.add(int.parse(element));
  });

  List cpfCalc = [];
  int digOne = 0;
  int digTwo = 0;

  for (var i = 0; i < cpfList.length; i++) {
    var calc = 2 + i;
    var result = cpfList.reversed.elementAt(i) * calc;
    cpfCalc.add(result);
    digOne += result;
  }

  int restDigi = digOne % 11;
  int? returnDigi;
  int? returnDigi2;

  if (restDigi < 2) {
    returnDigi = 0;
  } else if (restDigi >= 2) {
    returnDigi = 11 - restDigi;
  }

  cpfCalc = [];
  cpfList.add(returnDigi!);

  for (var i = 0; i < cpfList.length; i++) {
    var calc = 2 + i;
    var result = cpfList.reversed.elementAt(i) * calc;
    cpfCalc.add(result);
    digTwo += result;
  }

  int restDigi2 = digTwo % 11;

  if (restDigi2 < 2) {
    returnDigi2 = 0;
  } else if (restDigi2 >= 2) {
    returnDigi2 = 11 - restDigi2;
  }

  return [returnDigi, returnDigi2!];
}
