class DateHelper {
  static List<String> _months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static String getMonth(int month) {
    return _months[month - 1];
  }

  static String getFullDate(String dateString) {
    final dateSplit = dateString.replaceAll(" ","").split("/");

    final day = int.parse(dateSplit.first);
    final month = int.parse(dateSplit[1]);
    final year = int.parse(dateSplit.last);

    final date = DateTime(year, month, day);

    return "${getMonth(date.month)} ${date.day} ${date.year}";
  }
}
