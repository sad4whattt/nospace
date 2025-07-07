import math
import os

def calculate_average(numbers):
    if len(numbers) == 0:
        return 0
    total = 0
    for num in numbers:
        total += num
    return total / len(numbers)

def divide_numbers(a, b):
    if b == 0:
        return None

def read_file_content(filename):
    try:
        with open(filename, 'r') as file:
            content = file.read()
        return content
    except FileNotFoundError:
        return f"File not found: {filename}"

def process_user_input():
    print("Enter numbers separated by commas:")
    user_input = input()

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
    if n < 0:
        return None
    elif n == 0:
        return 1
    else:
        return n * factorial(n - 1)

def find_in_list(items, target):
    for i in range(len(items)):
        if items[i] == target:
            return i
    return None

def main():
    print("Welcome to the corrected calculator!")

    content = read_file_content("nonexistent.txt")
    print(content)

    fact = factorial(-5)
    if fact is None:
        print("Error: Factorial is not defined for negative numbers.")
    else:
        print(f"Factorial of -5: {fact}")

    process_user_input()

    my_list = [1, 2, 3, 4, 5]
    index = find_in_list(my_list, 10)
    if index is None:
        print("Item not found in list.")
    else:
        print(f"Index of 10: {index}")
        print(f"Item at index: {my_list[index]}")


if __name__ == "__main__":  # This block runs the main function when the script is executed directly (not imported)
    main()