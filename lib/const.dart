import 'dart:math';

const List<String> urlList = [
  'https://tsmedu.org',
  'https://tsmedu.net',
  'https://tsmsys.net',
];

Random random = Random();
int randomIndex = random.nextInt(urlList.length);
String randomUrl = urlList[randomIndex];

// Now you can use the randomUrl as needed, for example:
 String teacherLink = '$randomUrl/default.aspx?person=teacher';
 String studentLink = '$randomUrl/default.aspx?person=student';
 String parentLink = '$randomUrl/default.aspx?person=parent';

