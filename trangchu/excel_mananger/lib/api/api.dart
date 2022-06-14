import 'package:gsheets/gsheets.dart';

class ApiClient {
  ApiClient instance() {
    return ApiClient();
  }

  static const spreadId = '1Wx84Q2fK1U6WQBoUZrcYxJb45GGRoL_9PFUInjIqD0I';

  static const credential = r'''{
  "type": "service_account",
  "project_id": "sheet-337817",
  "private_key_id": "e8a502eb263cb903ce26ab41a33bbf7316ea522b",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCkgwPgv7rqt9Uy\nwA4X1M9dI5DAoU3jfx9GdRMzOtQX4J/rjNZ7IsCnz1VPMQ8aUWe8iWG7f+Dsi5Zb\n9tfLJokWcuFJnQvCBogg+Sp+2xSeBX4qR7HiKNIMh6XM5+tScNKdTcFlq70rp0In\nCml7lDiCcrc7dx4joewbnwfvgoiMwVJ1+235Dq9YPoPe29fQ4GzrKA+aGdQnKYoK\ntQTq5tNCOCEHmRwwdBrI+A7wXFCLK1rr2SiMwdDlfxcxjeRyPp2QjLefwtfMwoIy\n87auqp+3Fvbuqu3juO8BMHmLSDMmllLoBDmNOX66M+BvxPGAKe4PlzXXvxudTRKM\nUtEJlJLrAgMBAAECggEADTd4tnPg30jr8sWq5to820rnWbp700pGvSExwjIN5mna\n9JBzjh/8Ignjsiw1qOkfsEN0m8eJzqc7lLbaSQ1sV7vcrU6Af9LeLpFQtdwBpjJj\nG6Ail+dXUhS3ICUFFbH6ZxM0oDzxwpHk8YBXeiCt1jkYzx5iSFLoG6NP/ruEyeiq\n95+AqdcTLk41h/HzBxsPC8Z6yY6CXENBddrc/43B8fYSU2UmRDriINZ6sE3W7ltF\ngDxRZssR/j9fNrAo81w7Tb9qEOBPcAJyrsYJEJII4R2I9lkNYX7N8Ev2HPKhfDJJ\ncjaRJvVi1kZqEfAwHHWFJMf+MNR5FX9ooFh4GODrpQKBgQDmGbIWzOpRVDx3vvP3\ndVWh5XYAkwhvTRwBaK8Fpcw10vr6dWDmBgFD2aGJ3616yApYhwSFwr+tJwQwufVy\nzakYkA8OnnsVlFfSVVOsg3eozgj9363uQwgWq9VtZ+xkvNRfOq0Z1Wp5yAui8vFH\nAccQWJ2JqOskO9m7EPp7FdKcRwKBgQC3B2UY+Ax+O7FolkaPU8hnvs3iIc2tKbak\n+1+4DTm5gsisEjFCS2xACzFdFaYpLdGgJVLXpsJZvz2CbPYt53ZL7fB01AL8DmWt\nfy8AstkbPU/FJxqS1bxjQ6d6AsMldkXECURB2Vj1zwg9FNyT2FylSHO88yENPMhA\nx4nPk/j6PQKBgC3F3Mx2VQJ6vFCh1sxaNf+vssqodRwW/cQ1++MmuTnXz391TCJV\n/Xhu2Zigu1TaaFx192tYc2LRiR7cTzxYNxQgzC3/TsLbMKExwiRmPq6A1f8SuPnV\nsc04v4s1Cix79889z+N8teKl7dKre13Bt8TDrAsPZD9f/I8e8IT9sVjPAoGAf4O0\naJfwREYcTKxdzl9lwPnLAJ/iZqEoMXs8bcMxE1DNtCwci352lYv2wU5i7E+Su0sl\nkz8IKnS1StfVD5gx76Z/HzXSOn9hUWXJfmgcIAEwQUAEIIaucE3jMXsZMFFdO73l\nAyeE9gReTgfpwUs9CJ4YnGya+1j8fz1Fgwwpq1UCgYEA3vbAynFxLYxVnaeHK6yO\nzMvNkQ8lV6ndIgm7RzH/yY+ui1OICl9W2jeBEQ1YrTSFaCYrVJdkigf3cNkCOwfK\nrYGAh0AkC+RWd1Nv8gNeCURV3XKiGqPl+XTkn87f4m/V2/jO3kSzXzr0sOJFx2aX\nZac0rANm5IW2xZSiRKZXk5A=\n-----END PRIVATE KEY-----\n",
  "client_email": "sheet-250@sheet-337817.iam.gserviceaccount.com",
  "client_id": "112440402016324497338",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/sheet-250%40sheet-337817.iam.gserviceaccount.com"
}''';
  String get getCredential {
    return credential;
  }

  static var gsheets = GSheets(credential);

  static Future<Spreadsheet> readFromSpreadId() async {
    return await gsheets.spreadsheet(spreadId);
  }

  static Future<Worksheet?> getWorksheetByTitle(String title) async {
    Spreadsheet? ss;
    Worksheet? sheet;
    try {
      ss = await gsheets.spreadsheet(spreadId);
      sheet = ss.worksheetByTitle(title);
    } catch (e) {
      print(e);
    }
    return sheet;
  }
}
