# String Calculator TDD Kata

## Overview
This project implements a **String Calculator** using the Test-Driven Development (TDD) approach in **Ruby**. The calculator can sum numbers from a string input with support for different delimiters and error handling.

## Features
- Add numbers from a comma-separated string.
- Handle new lines (`\n`) as delimiters.
- Support custom delimiters.
- Raise an exception for negative numbers, listing all negatives found.
- Numbers bigger than 1000 should be ignored, so adding 2 + 1001 = 2
- Handle multi length delimiters
- Allow multiple delimiters
- Handle multiple delimiters with length longer than one char

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/at9596/TDD_ASSESMENT.git
   cd TDD_ASSESMENT

2. Also install one gem:

   `` gem install minitest``

3. run test file as:
 ``` sh
 ruby test_string_calculator.rb
