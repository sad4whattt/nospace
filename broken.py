#!/usr/bin/env python3

import math
import os

def calculate_average(numbers):
    """Calculate the average of a list of numbers"""
    total = 0
    for num in numbers:
        total += num
    return total / len(numbers)  # Problem: Division by zero if empty list

def divide_numbers(a, b):
    """Divide two numbers"""
    result = a / b  # Problem: No check for division by zero
    return result

def read_file_content(filename):
    """Read content from a file"""
    file = open(filename, 'r')  # Problem: File not closed, no error handling
    content = file.read()
    return content

def process_user_input():
    """Get numbers from user and calculate average"""
    print("Enter numbers separated by commas:")
    user_input = input()
    
    # Convert input to numbers
    numbers = []
    for item in user_input.split(','):
        numbers.append(int(item))  # Problem: No error handling for invalid input
    
    avg = calculate_average(numbers)
    print(f"Average: {avg}")

def factorial(n):
    """Calculate factorial of n"""
    if n = 0:  # Problem: Using assignment operator instead of comparison
        return 1
    else:
        return n * factorial(n - 1)  # Problem: No check for negative numbers

def find_in_list(items, target):
    """Find target in list"""
    for i in range(len(items)):
        if items[i] == target:
            return i
    # Problem: No return statement for when item not found

def main():
    print("Welcome to the buggy calculator!")
    
    # Test division
    result1 = divide_numbers(10, 0)  # Problem: Will cause division by zero error
    print(f"10 / 0 = {result1}")
    
    # Test file reading
    content = read_file_content("nonexistent.txt")  # Problem: File likely doesn't exist
    print(content)
    
    # Test factorial
    fact = factorial(-5)  # Problem: Negative input to factorial
    print(f"Factorial of -5: {fact}")
    
    # Test user input
    process_user_input()
    
    # Test finding in list
    my_list = [1, 2, 3, 4, 5]
    index = find_in_list(my_list, 10)  # Problem: Will return None
    print(f"Index of 10: {index}")
    print(f"Item at index: {my_list[index]}")  # Problem: TypeError when index is None

if __name__ == "__main__":
    main()
