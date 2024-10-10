class AppStrings {
  /// General
  /// Add any strings that will be shown to users here ...

  //Exceptions
  ///  Add your error messages here...
  static const String undefinedError = "Undefined Network Error";
  static const String noInternetError = "No Internet Connection";
  static const String errorLabel = "ERROR";
}

class CodeStrings {
  ///  Add your API configs here ...
  static const String baseApi = 'http://54.209.72.235:9595';
  static const String registerApi = baseApi + '/register';
  static const String uploadPersonalPhotoApi =
      baseApi + '/upload-personal-photo';
  static const String tokenKey = '';
  static const String tokenValue = '';
  static const String errorMessage = 'برجاء ملىء الحقول بطريقه صحيحه';
  static const String welcomeText =
      'أهلاً بكم في تطبيق حلقة برجاء تسجيل الدخول ';
  static const String loginButtonText = 'تسجيل الدخول';
  static const String codeError = 'الرجاء ادخال الكود الصحيح';
  static const String birthDateError = 'الرجاء ادخال تاريخ ميلاد الطالب الصحيح';
  static const String birthDateLabel = ' ادخل تاريخ ميلاد الطالب ';
  static const String codeLabel = 'ادخل كود الطالب';
}
