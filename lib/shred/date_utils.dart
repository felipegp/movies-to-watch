class DateUtils {
  static String toDateMonthYearFormat(String date) {
    if (date?.isEmpty ?? true) {
      return '';
    }

    List<String> dateSplit = date.split('-');
    
    if (dateSplit.length < 3) {
      return '';
    }

    return dateSplit[2] + '/' + dateSplit[1] + '/' + dateSplit[0];
  }
}