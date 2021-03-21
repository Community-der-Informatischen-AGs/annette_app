import 'package:annette_app/vertretungsEinheit.dart';

class VertretungsplanCrawler {
  final String htmlCode;
  VertretungsplanCrawler({this.htmlCode});

  List<VertretungsEinheit> getVertretungen() {
    String htmlCodeTemp = htmlCode;
    int tempStart = htmlCodeTemp.indexOf('<table');
    tempStart = htmlCodeTemp.indexOf('<table', tempStart + 5);
    tempStart = htmlCodeTemp.indexOf('<table', tempStart + 5);
    int tempEnd = htmlCodeTemp.lastIndexOf('/table>');
    htmlCodeTemp = htmlCodeTemp.substring(tempStart + 25, tempEnd - 2);

    List<VertretungsEinheit> vertretungen = [];
    String tempRow;
    htmlCodeTemp = htmlCodeTemp.substring(htmlCodeTemp.indexOf('/tr>') + 4);
    while (htmlCodeTemp.indexOf('tr') != -1) {
      tempRow = htmlCodeTemp.substring(
          htmlCodeTemp.indexOf('>', htmlCodeTemp.indexOf('tr')) + 1,
          htmlCodeTemp.indexOf('</tr'));

      String tempColumn = tempRow;
      List<String> result = [];
      for (int i = 0; i < 9; i++) {
        int start;
        if (tempColumn.indexOf('<span') < tempColumn.indexOf('/td>') &&
            tempColumn.indexOf('<span') != -1) {
          start = tempColumn.indexOf('>', tempColumn.indexOf('>') + 2) + 1;
        } else {
          start = tempColumn.indexOf('>') + 1;
        }
        int end = tempColumn.indexOf('<', start + 1);
        String tempValue = tempColumn.substring(start, end);

        if (tempValue == '&nbsp;' || tempValue == '---' || tempValue == '+') {
          result.add(null);
        } else {
          result.add(tempColumn.substring(start, end));
        }

        tempColumn = tempColumn.substring(tempColumn.indexOf('/td>') + 4);
      }

      /*String klasse = '9D';
      if(result[0].contains(klasse.substring(0,1)) && result[0].contains(klasse.substring(1))) {
      */if(true) {
        vertretungen.add(new VertretungsEinheit(
            result[1],
            result[5],
            result[4],
            result[0],
            result[8],
            result[6],
            result[2],
            result[7],
            result[3]));
      }
      print(result);


      htmlCodeTemp = htmlCodeTemp.substring(htmlCodeTemp.indexOf('/tr>') + 4);
    }
    return vertretungen;
  }

  String getCurrentDate() {
    String htmlCodeTemp = htmlCode;
    int tempStart = htmlCodeTemp.indexOf('<div class="mon_title">') + 23;
    int tempEnd = htmlCodeTemp.indexOf("/div", tempStart) - 1;
    String currentDate = htmlCodeTemp.substring(tempStart, tempEnd);
    print('Current date: $currentDate');
    return currentDate;
  }

  String getLastEdited() {
    String htmlCodeTemp = htmlCode;
    int tempStart = htmlCodeTemp.indexOf('Stand: ') + 7;
    int tempEnd = htmlCodeTemp.indexOf("<", tempStart);
    String lastEdited = htmlCodeTemp.substring(tempStart, tempEnd);
    print('lastEdited: $lastEdited');
    return lastEdited;
  }

  String getAffectedClasses() {
    String htmlCodeTemp = htmlCode;
    int tempStart = htmlCodeTemp.indexOf('Betroffene Klassen&nbsp;</td>') + 59;
    int tempEnd = htmlCodeTemp.indexOf("<", tempStart);
    String affectedClasses = htmlCodeTemp.substring(tempStart, tempEnd);
    print('affectedClasses: $affectedClasses');
    return affectedClasses;
  }
}
