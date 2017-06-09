/**
 * class
 *
 */

class ATypeName { /* Class body goes here */ }
ATypeName a = new ATypeName();


/**
 * fields
 *
 */

class DataOnly {
    int i;
    double d;
    boolean b;
}

DataOnly data = new DataOnly();
data.i = 47;
data.d = 1.1;
data.b = false;


/**
 * primitive
 *
 */

// boolean    false
// char       ‘\u0000’ (null)
// byte       (byte)0
// short      (short)0
// int        0
// long       0L
// float      0.0f
// double     0.0d


/**
 * methods
 *
 */

ReturnType methodName( /* Argument list */ ) {
  /* Method body */
}

// objectName.methodName(arg1, arg2, arg3);
// int x = a.f();  object called a for which f() can be called and return a value of type int


/**
 * argument
 *
 */

int storage(String s) {
  return s.length() * 2;
}

// method return void
boolean flag() { return true; }
double naturalLogBase() { return 2.718; }
void nothing() { return; }
void nothing2() {}
