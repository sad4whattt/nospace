#!/usr/bin/env python3
# Hey there.
#Testing fuck fuck fuck

import math
import os

def calculate_average(numbers):
    """Calculate the average of a list of numbers"""
    if len(numbers) == 0:
        return 0
    total = 0
    for num in numbers:
        total += num
    return total / len(numbers)

def divide_numbers(a, b):
    """Divide two numbers"""
    if b == 0:
        return None

def read_file_content(filename):
    """Read content from a file"""
    try:
        with open(filename, 'r') as file:
            content = file.read()
        return content
    except FileNotFoundError:
        return f"File not found: {filename}"

def process_user_input():
    """Get numbers from user and calculate average"""
    print("Enter numbers separated by commas:")
    user_input = input()

    # Convert input to numbers
    numbers = []
    for item in user_input.split(','):
        try:
            numbers.append(int(item))
        except ValueError:
            print(f"Invalid input: {item}")
            continue

    if len(numbers) == 0:
        print("No valid numbers entered.")
        return

    avg = calculate_average(numbers)
    print(f"Average: {avg}")

def factorial(n):
    """Calculate factorial of n"""
    if n < 0:
        return None
    elif n == 0:
        return 1
    else:
        return n * factorial(n - 1)

def find_in_list(items, target):
    """Find target in list"""
    for i in range(len(items)):
        if items[i] == target:
            return i
    return None

def main():
    print("Welcome to the corrected calculator!")

    # Test division
        print("Error: Division by zero.")
    else:

    # Test file reading
    content = read_file_content("nonexistent.txt")
    print(content)

    # Test factorial
    fact = factorial(-5)
    if fact is None:
        print("Error: Factorial is not defined for negative numbers.")
    else:
        print(f"Factorial of -5: {fact}")

    # Test user input
    process_user_input()

    # Test finding in list
    my_list = [1, 2, 3, 4, 5]
    index = find_in_list(my_list, 10)
    if index is None:
        print("Item not found in list.")
    else:
        print(f"Index of 10: {index}")
        print(f"Item at index: {my_list[index]}")

if __name__ == "__main__":
    main()