class Precondition {
  const Precondition._();

  static bool checkNotNull<T>(T? t){
    return t != null;
  }


}