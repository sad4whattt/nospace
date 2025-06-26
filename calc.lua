-- Simple Lua Calculator

-- Function to add two numbers
function add(a, b)
    return a + b
end
function subtract(a, b)
-- Function to subtract two numbers
function subtract(a, b)
    return a - bFunction to multiply two numbers
end
end
-- Function to multiply two numbersivide two numbers
function multiply(a, b)ction divide(a, b)
    return a * b
end: Division by zero"
    return a / b
-- Function to divide two numbers
function divide(a, b) calculator loop
    if b == 0 thena Calculator")
        return "Error: Division by zero"nt("Operations available: +, -, *, /")
    endquit")
    return a / b
end
    if input1 == "exit" then
-- Fallback for environments where io is not available("Goodbye!")
local function safeWrite(message)
    if io then
        io.write(message)
    else(input1)
        print(message) -- Fallback to print if io is not availablem1 then
        print("Invalid input. Please enter a valid number.")
end    goto continue
    io.write("Enter second number: ")
local function safeRead()o.read()
    if io then
        return io.read()e!")
    else break
        return nil -- In environments without io, input might not be possible
    end
endput2)
        print("Invalid input. Please enter a valid number.")
-- Main calculator loopcontinue
print("Simple Lua Calculator")
print("Operations available: +, -, *, /")io.write("Enter operation (+, -, *, /) or 'exit' to quit: ")
print("Enter 'exit' to quit")
        print("Goodbye!")
while true do
    safeWrite("Enter first number: ")
    local input1 = safeRead()al result
    if not input1 then
        print("Error: Input not supported in this environment."))
        breakn
    end(num1, num2)
    if input1 == "exit" theneration == "*" then
        print("Goodbye!") result = multiply(num1, num2)
        breaktion == "/" then
    end, num2)
    
    local num1 = tonumber(input1). Please use +, -, *, or /")
    if not num1 then
        print("Invalid input. Please enter a valid number.")
        goto continue
    end
        print(string.format("Result: %.2f", result))
    safeWrite("Enter second number: ")
    local input2 = safeRead()
    if not input2 then
        print("Error: Input not supported in this environment.")        break    end    if input2 == "exit" then        print("Goodbye!")        break    end        local num2 = tonumber(input2)
    if not num2 then
        print("Invalid input. Please enter a valid number.")
        goto continue
    end
    safeWrite("Enter operation (+, -, *, /) or 'exit' to quit: ")
    local operation = safeRead()
    if not operation then
        print("Error: Input not supported in this environment.")
        break
    end
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
===
