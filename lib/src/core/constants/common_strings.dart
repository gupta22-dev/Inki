class CommonStrings {
  static final RegExp mobileRegEx = RegExp(r'(^(?:[+0]9)?[0-9]{10,11}$)');
  static final RegExp emailRegEx = RegExp(
      "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$");

  static const appName = "InKi";
  static const imageTag = "tag";
  static const parentIndex = "ParentIndex";
  static const childIndex = "childIndex";
  static const productsHive = "productsHive";
}
