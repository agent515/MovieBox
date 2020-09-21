class Helper {

  // Coverts date Number format (2019-02-18) to Char Format (2019 FEB 18)
  static Map<String, String> dateIntToChar(String date) {
    var temp = date.split('-');
    String year = temp[0];
    String month;
    String day = temp[2];

    switch(temp[1]) {
      case '01' : month = "JAN";
                  break;
      case '02' : month = "FEB";
                  break;
      case '03' : month = "MAR";
                  break;
      case '04' : month = "APR";
                  break;
      case '05' : month = "MAY";
                  break;
      case '06' : month = "JUN";
                  break;
      case '07' : month = "JUL";
                  break;
      case '08' : month = "AUG";
                  break;
      case '09' : month = "SEP";
                  break;
      case '10' : month = "OCT";
                  break;
      case '11' : month = "NOV";
                  break;
      case '12' : month = "DEC";
                  break;
    }
    return {
      "year" : year,
      "month" : month,
      "day" : day,
    };
  }

  static Map<String, String> revenueIntToChar(int revenue) {
    Map<String, String> result = {"scale" : "", "amount" : revenue.toString()};

    if (revenue / 100000000 >= 1) {
      // Million
      result["scale"] = "BIL";
      result["amount"] = (revenue ~/ 100000000).toString();
      print(result);

    }
    else if (revenue / 1000000 >= 1) {
      // Million
      result["scale"] = "MIL";
      result["amount"] = (revenue ~/ 1000000).toString();
    }
    else if (revenue / 1000 >= 1) {
      // Thousand
      result["scale"] = "K";
      result["amount"] = (revenue ~/ 1000).toString();
    }
    return result;
  }

}