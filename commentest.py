# commentest.py
# A simple Python script with comments scattered throughout

# Import necessary modules
import random
import time
from datetime import datetime
# Define constants
MAX_NUMBER = 100
MIN_NUMBER = 1
NUM_GUESSES = 5  # Maximum number of allowed guesses
def generate_random_number():
    """Generate a random number between MIN_NUMBER and MAX_NUMBER."""
    # Using the random module to create unpredictability
    return random.randint(MIN_NUMBER, MAX_NUMBER)
# Main game function
def guess_the_number():
    # Print welcome message
    print("Welcome to the Number Guessing Game!")
    print(f"I'm thinking of a number between {MIN_NUMBER} and {MAX_NUMBER}")
    
    # Generate the target number
    target = generate_random_number()
    
    # Initialize variables for tracking game state
    guesses_left = NUM_GUESSES
    has_won = False
    
    # Main game loop
    while guesses_left > 0 and not has_won:
        # Display guesses remaining
        print(f"\nYou have {guesses_left} guesses left.")
        
        # Get user input
        try:
            # Convert input to integer
            guess = int(input("Enter your guess: "))
            
            # Check if the guess is valid
            if guess < MIN_NUMBER or guess > MAX_NUMBER:
                # Invalid range message
                print(f"Please enter a number between {MIN_NUMBER} and {MAX_NUMBER}.")
                continue  # Skip this iteration without decreasing guesses_left
                
            # Decrease remaining guesses
            guesses_left -= 1
            
            # Check if the guess is correct
            if guess == target:
                # Player wins
                has_won = True
                print(f"Congratulations! You guessed the number {target}!")
            elif guess < target:
                # Provide hint
                print("Too low! Try a higher number.")
            else:  # guess > target
                # Provide hint
                print("Too high! Try a lower number.")
                
        except ValueError:
            # Handle non-integer inputs
            print("Please enter a valid number.")
    
    # Game over - check if player lost
    if not has_won:
        print(f"\nGame over! The number was {target}.")
# Run the game if this script is executed directly
if __name__ == "__main__":
    # Record the start time
    start_time = time.time()
    
    # Log the game session
    print(f"Game session started at {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    # Start the game
    guess_the_number()
    
    # Calculate and display game duration
    elapsed_time = time.time() - start_time
    print(f"\nYou played for {elapsed_time:.2f} seconds.")
    
    # End of script comment
    # Thanks for playing!
