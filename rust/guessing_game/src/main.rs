extern crate rand;                         // external dependency

use std::io;                               // library
use std::cmp::Ordering;                    // type
use rand::Rng;                             // trait

fn main() {                                // main
    println!("Guess the number!");         // println!

    let secret_number = rand::thread_rng().gen_range(1, 101); // number geneerator

    println!("The secret number is: {}", secret_number);

    println!("Please input your guess.");

    let mut guess = String::new();         // variables

    io::stdin().read_line(&mut guess)
        .expect("Failed to read line");    // result type

    let guess: u32 = guess.trim().parse()  // mismatch error
        .expect("Please type a number!");

    println!("You guessed: {}", guess);    // placeholders

    match guess.cmp(&secret_number) {      // compare
        Ordering::Less    => println!("Too small!"),
        Ordering::Greater => println!("Too big!"),
        Ordering::Equal   => println!("You win!"),
    }
}
