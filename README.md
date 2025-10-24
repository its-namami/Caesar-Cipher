# Caesar Cipher

A simple Ruby implementation of the Caesar cipher encryption technique.

## Description

This program implements the classic Caesar cipher, which shifts each letter in the input text by a specified number of positions in the alphabet. The cipher preserves:
- Letter case (uppercase/lowercase)
- Non-alphabetic characters (numbers, symbols, spaces)

## Features

- Interactive command-line interface
- Supports positive and negative shift values
- Input validation for shift values
- Wraps around the alphabet (e.g., 'z' with shift +1 becomes 'a')

## Usage

Run the program:

```bash
ruby main.rb
```

The program will prompt you to:
1. Enter the text you want to encrypt/decrypt
2. Enter the shift value (positive or negative integer)

### Example

```
Welcome to Caesar Cipher!
Enter the text
>>> Hello World!
Enter the shift
>>> 3
Result:
Khoor Zruog!
```

## How it Works

The Caesar cipher shifts each letter by the specified number of positions:
- A shift of +3 moves 'A' to 'D', 'B' to 'E', etc.
- A shift of -3 moves 'D' to 'A', 'E' to 'B', etc.
- Letters wrap around (e.g., 'Z' + 1 = 'A')

## Files

- `main.rb` - Main program file containing the Caesar cipher implementation

## Requirements

- Ruby (any recent version)