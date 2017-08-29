// robust

// java puts a lot of emphasis on eaarly checking for possible problems
//   later dynamic (runtime) checking
//   and eliminating situations that are error-prone
// the single biggest difference between java and c/c++ is that
//   java has a pointer model
//     that eliminates the possibility of overwriting memory and corruting data

// secure

// java was designed to make certain kinds of attacks impossible
//   overrunning the runtime stack
//     a common attack of worms and viruses
//   corrupting memory outside its own process space
//   reading or writing files without permission
// not long after the first version of the java development kit was shipped
//   a group of security experts at princeton university
//     found subtle bugs that allowed untrusted code to attack the host system
// initially, security bugs were fixed quickly
//   unfortunately, over time
//   hackers got quite good at spotting subtle flaws
//     in the implementation of the security architecture
//   after a number of high-profile attacks
//     browser vendors and oracle became increasingly cautious
//   java browser plug-in no longer trust remote code
//     unless it is digirally signed and users have agreed to its execution

// architecture-neutral

// the compiler generates an architecture-neutral object file format
//   the compiled code is executable on many processors
//   given the presence of the java runtime system
//   the java compiler does this by generating bytecode instructions
//     which have nothing to do with a particular computer architecture
//     rather, they are designed to be
//       both easy to interpret on any machine
//       and easily translated into native machine code on

// portable

// unlike c and c++
//   the sizes of the primitive data types are specified
//     as is the behavior of arithmetic on them
// for example, an int in java is always a 32-bit integer
//   in c/c++, int can mean a 16-bit integer, a 32-bit integer
//     or any other size that the compiler vendor likes
// binary data is stored and transmitted in a fixed format
//   eliminating confusion about byte ordering
// strings are saved in a standard unicode format
// the libraries that are a part of the system define portable interfaces
//   for example, there is an abstract window class and implementations of it
//     for unix, windows, and the mac
// the java libraries do a great job of
//   letting you work in a platform-independent manner
//   you can work with files, regular expressions, xml and so on
//     without worrying about the underlying operating system

// interpreted

// the java interpreter can execute java bytecodes directly on any machine
//   to which the interpreter has been ported
// anyone who has used lisp, python, R
//   knows what "rapid and exploratory" development process is
//   you try out something, and you instantly see the result
//   java development environments are not focused on that experience

// high-performance

// while the performance of interpreted bytecodes is usually more than adequate
//   there are situations where higher performance is required
//   the bytecodes can be translated on the fly (at runtime)
//     into machine code for the particular cpu the application is running on
// today, however, the just-in-time compilers have become so good that
//   they are competitive with traditional compilers
//   and in some case, even outperform them
//     because they have more information available
//   for example, a just-in-time compiler can monitor
//     which code is executed frequently and optimize just that code for speed
//     a more sophisticated optimization is
//       the elimination (or "inlining") of function calls
//       the just-in-time compilers knows which classes have been loaded
//       it can use inlining when
//         based upon the currently loaded collection of classes
//         a particular function is never overridden
//         and it can undo that optimization later if neces

// multithreaded

// benefits of multithreading are
//   better interactive responsiveness and real-time behavior
// nowadays, we care about concurrency because Moore's law is comming to an end
//   instead of faster processors, we just get more of them
//     and we have to keep them busy
//   yet when you look at most programming languages
//     they show a shocking disregard for this problem
//   java was well ahead of its time
//     it was the first mainstream language to support concurrent programing
//     at the time, multicore processors were exotic
//     but web programming had just started
//     and processors spent a lot of time waiting for a response from the server
//     concurrent programming was needed to make sure the user interface didn't fr

// dynamic

// in a number of ways, java is a more dynamic language than c or c++
// it was designed to adapt to an evolving environment
//   libraries can freely add new methods and instance variables
//     without any effect on their clients
//   in java, finding out runtime type information is straightforward
// this is important feature in the situations
//   where code needs to be added to a running program
//   a prime example is code that is downloaded from the internet to run in a browser
//     in c or c++, this is indeed a major challenge
//     but the java designers were well aware of dynamic languages
//       that made it easy to evolve a running pro

// applets and the internet

// users will download java bytecodes from the internet
//   and run them on their own machines
//   java programs that work on web pages are called _applets_
//   to use an applet, you only need a java-enabled web browser
//     which will execute the bytecodes for you
//   thanks to the security of the virtual machine
//     you never need to worry about attacks from hostile code
// inserting an applet into a web page works much like embedding an image
//   the applet becomes a part of the page
//     and the text flows around the space used for the applet
//   the point is, this image is alive
//     it reacts to user commands, changes its appearance
//     and exchanges data between the computer presenting the applet
//     and the computer serving it
// a good example of the Jmol applet [En 36]
// NOTE
// various versions of the netscape and internet explorer browsers
//   ran different versions of java
//   some of which were seriousely outdated
//   this sorry situation made it increasingly diccicult to develop applets
//     that took advantage of the most current java version
//   instead, adobe's flash technology became popular
//     for acheving dynamic effects in the browser
//   later, when java was dogged by serious security issues
//     browsers and the java browser plug-in became increasingly restrictive
//   nowadays, it requires skill and dedication to get applets to work in you brwoser
//     for example, if you visit the Jmol web site
//     you will likely encounter a message exhorting you to configure your browser
//       for allowing applets to run

// common misconceptions about java

// ! java is interpreted, so it is too slow for serious applications
//   in the early days of java, the language was interpreted
//   nowadays, the java virtual machine uses a just-in-time compiler
//     the "hot spots" of your code will run just as fast in java as they would in c++
//       and in some cases even faster
// ! java programs are a major security risk
//   some system administrators have even deactivated java in company browsers
//     while continuing to permit their users to downloaded
//       executable files and word documents which pose a far greater risk
//   even 20 years after its creation
//     java is far safer than any other commonly available execution platform
// ! with java, I can replace my desktop computer with a cheap "internet appliance
//   nowadays, of course, the world has changed
//     and for a large majority of end users
//     the platform that matters is a mobile phone or tablet
//   the majority of these devices are controlled by the android platform
//     which is a derivative of java
//     learning java programming will help you with android programming as well
