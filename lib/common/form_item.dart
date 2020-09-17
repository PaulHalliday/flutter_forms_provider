class FormItem {
  String value;
  Function(String) validator;

  FormItem({
    this.value,
    this.validator,
  });

  factory FormItem.notEmpty({String value}) => FormItem(
      value: value,
      validator: (String value) {
        if (value.isEmpty) {
          return "This field cannot be empty!";
        }

        return null;
      });

  factory FormItem.phoneNumber({String value}) => FormItem(
      value: value,
      validator: (String value) {
        if (value.isEmpty) {
          return "This field cannot be empty!";
        } else if (value.length < 7) {
          return "A phone number cannot be less than 7 digits";
        }

        return null;
      });

  factory FormItem.cannotBeLessThanXDigit(
          {int digit, String value, String fieldName}) =>
      FormItem(
          value: value,
          validator: (String value) {
            if (value.isEmpty) {
              return "$fieldName cannot be empty!";
            } else if (value.length < digit) {
              return "$fieldName cannot be less than $digit digits";
            }

            return null;
          });

  @override
  String toString() {
    return value;
  }
}
