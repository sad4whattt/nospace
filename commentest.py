import random
import time
from datetime import datetime
MAX_NUMBER = 100
MIN_NUMBER = 1ssary modules
NUM_GUESSES = 5om
def generate_random_number():
    """Generate a random number between MIN_NUMBER and MAX_NUMBER."""rt datetime
    return random.randint(MIN_NUMBER, MAX_NUMBER)ts
def guess_the_number():00
    print("Welcome to the Number Guessing Game!")
    print(f"I'm thinking of a number between {MIN_NUMBER} and {MAX_NUMBER}")mber of allowed guesses
    
    target = generate_random_number()AX_NUMBER."""
    ability
    guesses_left = NUM_GUESSESndint(MIN_NUMBER, MAX_NUMBER)
    has_won = False
    
    while guesses_left > 0 and not has_won:
        print(f"\nYou have {guesses_left} guesses left.")
        print(f"I'm thinking of a number between {MIN_NUMBER} and {MAX_NUMBER}")
        try:
            guess = int(input("Enter your guess: "))
            target = generate_random_number()
            if guess < MIN_NUMBER or guess > MAX_NUMBER:
                print(f"Please enter a number between {MIN_NUMBER} and {MAX_NUMBER}.") tracking game state
                continueNUM_GUESSES
                has_won = False
            guesses_left -= 1
            
            if guess == target:has_won:
                has_won = True
                print(f"Congratulations! You guessed the number {target}!")print(f"\nYou have {guesses_left} guesses left.")
            elif guess < target:
                print("Too low! Try a higher number.")t user input
            else:
                print("Too high! Try a lower number.")
                guess = int(input("Enter your guess: "))
        except ValueError:
            print("Please enter a valid number.")
    ess > MAX_NUMBER:
    if not has_won:
        print(f"\nGame over! The number was {target}.")BER}.")
if __name__ == "__main__":continue  # Skip this iteration without decreasing guesses_left
    start_time = time.time()
    ing guesses
    print(f"Game session started at {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")guesses_left -= 1
    
    guess_the_number()s is correct
    t:
    elapsed_time = time.time() - start_time
    print(f"\nYou played for {elapsed_time:.2f} seconds.")
            elif guess < target:
                print("Too low! Try a higher number.")
                # Provide hint
                
            # Handle non-integer inputs
    
    if not has_won:
# Run the game if this script is executed directly
    # Record the start time
    
    print(f"Game session started at {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    # Start the game
    
    elapsed_time = time.time() - start_time
    
    # Thanks for playing!
