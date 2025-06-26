-- Simple Lua Calculator

-- Function to add two numbers
function add(a, b)
    return a + b
end
-- Function to subtract two numbers
function subtract(a, b)
    return a - b
end
-- Function to multiply two numbers
function multiply(a, b)
    return a * b
end
-- Function to divide two numbers
function divide(a, b)
    if b == 0 then
        return "Error: Division by zero"
    end
    return a / b
end
-- Main calculator loop
print("Simple Lua Calculator")
print("Operations available: +, -, *, /")
print("Enter 'exit' to quit")
while true do
    io.write("Enter first number: ")
    local input1 = io.read()
    if input1 == "exit" then
        print("Goodbye!")
        break
    end
    
    local num1 = tonumber(input1)
    if not num1 then
        print("Invalid input. Please enter a valid number.")
        goto continue
    end
    io.write("Enter second number: ")
    local input2 = io.read()
    if input2 == "exit" then
        print("Goodbye!")
        break
    end
    
    local num2 = tonumber(input2)
    if not num2 then
        print("Invalid input. Please enter a valid number.")
        goto continue
    end
    io.write("Enter operation (+, -, *, /) or 'exit' to quit: ")
    local operation = io.read()
    if operation == "exit" then
        print("Goodbye!")
        break
    end
    local result
    if operation == "+" then
        result = add(num1, num2)
    elseif operation == "-" then
        result = subtract(num1, num2)
    elseif operation == "*" then
        result = multiply(num1, num2)
    elseif operation == "/" then
        result = divide(num1, num2)
    else
        print("Invalid operation. Please use +, -, *, or /")
        goto continue
    end
    if type(result) == "string" then
        print(result)
    else
        print(string.format("Result: %.2f", result))
    end
    ::continue::
end
