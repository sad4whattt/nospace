def add(x, y):
    # This function takes two numbers x and y, and returns their sum.
    return x + y

def subtract(x, y):
    # This function takes two numbers x and y, and returns their difference.
    return x - y

def multiply(x, y):
    # This function takes two numbers x and y, and returns their product.
    return x * y

def divide(x, y):
    # This function takes two numbers x and y, and returns their quotient.
    # It includes error handling for division by zero by returning an error message.
    if y == 0:
        return "Error! Division by zero."
    return x / y

# This while loop runs indefinitely until the user chooses to exit.
while True:
    # Print the available operations to the user.
    print("\nSelect operation:")
    print("1. Add")
    print("2. Subtract")
    print("3. Multiply")
    print("4. Divide")
    print("5. Exit")

    # Prompt the user to enter their choice.
    choice = input("Enter choice(1/2/3/4/5): ")

    # Check if the user's choice is valid.
    if choice in ('1', '2', '3', '4'):
        try:
            # Prompt the user to enter the first number.
            num1 = float(input("Enter first number: "))
            # Prompt the user to enter the second number.
            num2 = float(input("Enter second number: "))
        except ValueError:
            # Handle the case where the input is not a valid number.
            print("Invalid input. Please enter numbers only.")
            # Continue to the next iteration of the loop if input is invalid.
            continue

        # Perform the selected operation based on the user's choice and print the result.
        if choice == '1':
            print(num1, "+", num2, "=", add(num1, num2))
        elif choice == '2':
            print(num1, "-", num2, "=", subtract(num1, num2))
        elif choice == '3':
            print(num1, "*", num2, "=", multiply(num1, num2))
        elif choice == '4':
            print(num1, "/", num2, "=", divide(num1, num2))
    # If the user chooses to exit, break out of the loop and exit the program.
    elif choice == '5':
        print("Exiting calculator.")
        break
    # Handle the case where the user's input is not a valid choice.
    else:
        print("Invalid input. Please enter a number between 1 and 5.")
