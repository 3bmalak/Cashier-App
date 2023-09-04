import 'package:gsheets/gsheets.dart';

class GoogleSheet
{
  final credentials=r'''
    {
  "type": "service_account",
  "project_id": "cashiersheet",
  "private_key_id": "3cbf62a76bdb563d8951255abcc9c32dbb375c4a",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCeFr7ehgduOSIK\nWFjiwHQbqm3oB5BXvu4YOOaPWxHFbaOsBhRHC2UbAmCMN6CodLX9jizqxi0pHfEQ\ndfEjHr9OcrhHKKbG7P76LQYXNgV7qX9jeBc0Ujdm+i3hxiIc6ZgIHanaBtRBZuuZ\nxVpBaaRIkrBiaZNyBNmkfyGAMiUIXUDVdUGG36SiXPKmvNcPMFl8g2XlsETHYNl/\nJVyJHJS9iFjzOUoX+Ao2TuOfsWmjNW4YFsbfa6gd+493WpHN74qgdwDxCD4sNZqN\ngoZA+duUd43zxxz8cqzQI6l9qqJifhpHQ0isknKhFlAkyRqFGUD7rysSaVQvbXVo\nm4VS6+bxAgMBAAECggEARiswYxK4f5sKWe8m3NaxcoouKFwbHGdZxRSUebLha3Ej\nwbodC/+py9g9RF94huzuznFpzHdUGjj5A+ZltsHyBf7zfloz1H3jGuYbGvhWbLIq\nIdtu6UFI6ANJlDnecFjaq1eHSYfYdIMbNfCcBAbA7Zl2guf7kxNGCzaGhyE6wL/4\nWH1yu4owv+gJhojJXmffBx6lAmcNP3aoVYq/mqB2O0d+emv1EUWe8a+Upctasse9\n2GzJejHeabe20D+YtaSYXmUgs4ih712fz0tK+GFyNnHg24V3TEkOWuraUC69LvuU\nQbsJgOGEsOXmdWL5FehlXke8FK3QrcQdZCB6XTac9QKBgQDaGh9IJoQBM4qVOxXy\nEaKF0ncNCWDQH/O3TbREI/CiQrdcWMQOvmaboEHBkm3lyeqZPuTKPXn/u+v4RtpJ\n7rwp1wf13pvjTwaLFbwbDe9kZ0pVXuYjf+qBmUy2m5FnQXYmKwVbM6TgD7B17nKz\nvAA5oTuWGNADy0vohdouymv8CwKBgQC5jwtaIUswBXIML6fYhvJO2JRrpj91lRPz\nRob45QagDAl/U+9hKffwb5sTGKkUAocnZXiM/RaoqNWCykCb443mlQWeyupmx63Z\nSs/ghdMCA+1zCk+U8SmwYEDaVoweidSXXfrJNLbsuekXnsLokZaaC1DXxstH0rQN\nWr5S6zvKcwKBgQClHxvJ0ycjhbMI8lfWEhXafRIW85+xUk+A2rp80Dzxi9MofifJ\nBcvHTRgbhlHfo/QSG3S5zLtdqxemu3WufalFgAAN3IBnIsBQcp8cWHuCp1S2t4dD\nHygbAEX9BmCaLQxXL0D54GqWHCq7zlBW1SHSf8gOBjEOfk609wnNXQFOKwKBgGKl\nulpDIu63pmb2GtxQ+ZaTK2yDaG9BPubxUqYVU81YOOBZJgTYw/gtzRp83L5HjcSS\n/GCv2BD4GPI8RdbaRcEU7nT52V2kwDapwBPT8Va78ctb6uz6vLgIo9GvezRs//ks\nvDula640M8gb3fC4HYFtjJ/6Dm3zhUcoO9BnQFUjAoGBAMYHMOaQZXzS3bDQw8dQ\nUHJNyoqS4yuPrphbaYsTS91e9+mtw3AtPH7u3Ecv7eZm8dz9RY4KTmLWRYcHhr/f\newzAQ8J7Sq7feSV76NhNb0/RGY/MRQjGNdy4vjLeTDIQZfautZLmOUxMHGWXZ8Tq\nm8aKTbIj7koGVvTchbgb84e9\n-----END PRIVATE KEY-----\n",
  "client_email": "db-195@cashiersheet.iam.gserviceaccount.com",
  "client_id": "111876573450658680609",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/db-195%40cashiersheet.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
    ''';

final sheetID='1sfgycOw0LOc7diIJl-GjsX6U4eqb-qFEi2qGXsFgZn4';


  Future<void> Intialization() async {


  }
  Future<void> sendEmailPassword(email,password) async {

    final gsheet=GSheets(credentials);
    final ss =await gsheet.spreadsheet(sheetID);
    final sheet=ss.worksheetByTitle("DB");
    int row =2;
    for(int i =1;i<1000;i++) {
      final s=await sheet!.values.value(column: 11, row: i);
      print(s);
      if( s==''){
        row=i;
        break;
      }
    }
   await sheet!.values.insertValue(
      email.toString(),
      column: 11,
      row: row,
    ).then((value) {
      print("Email inserted successfully.");

    });
      await sheet!.values.insertValue(
      password.toString(),
      column: 12,
      row: row,
    ).then((value) {
      print("Password inserted successfully.");

    });

  }
}