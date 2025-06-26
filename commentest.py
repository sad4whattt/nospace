import random

def number_guessing_game():
    """
    A simple number guessing game where the player needs to guess a number between 1 and 100.
    The game provides hints if the guess is too high or too low.
    """
    secret_number = random.randint(1, 100)
    attempts = 0
    max_attempts = 10

    print("Welcome to the Number Guessing Game!")
    print(f"I'm thinking of a number between 1 and 100. You have {max_attempts} attempts to guess it.")

    while attempts < max_attempts:
        try:
            guess = int(input("Enter your guess: "))
            attempts += 1

            if guess < 1 or guess > 100:
                print("Please guess a number between 1 and 100.")
                continue

            if guess == secret_number:
                print(f"Congratulations! You've guessed the number in {attempts} attempts!")
                return
            elif guess < secret_number:
                print("Too low! Try a higher number.")
            else:
                print("Too high! Try a lower number.")
                
            print(f"Attempts remaining: {max_attempts - attempts}")

        except ValueError:
            print("Please enter a valid number.")
            continue

    print(f"Game Over! The number was {secret_number}. Better luck next time!")

if __name__ == "__main__":
    number_guessing_game()
    while True:
        play_again = input("Would you like to play again? (yes/no): ").lower()
        if play_again in ['y', 'yes']:
            number_guessing_game()
        else:
            print("Thanks for playing! Goodbye!")
            break