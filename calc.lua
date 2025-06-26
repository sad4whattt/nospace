
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

-- Fallback for environments where io is not available
local function safeWrite(message)
    if io then
        io.write(message)
    else
        print(message) -- Fallback to print if io is not available
    end
end

local function safeRead()
    if io then
        return io.read()
    else
        return nil -- In environments without io, input might not be possible
    end
end

-- Main calculator loop
print("Simple Lua Calculator")
print("Operations available: +, -, *, /")
print("Enter 'exit' to quit")

while true do
    safeWrite("Enter first number: ")
    local input1 = safeRead()
    if not input1 then
        print("Error: Input not supported in this environment.")
        break
    end
    if input1 == "exit" then
        print("Goodbye!")
        break
    end

    local num1 = tonumber(input1)
    if not num1 then
        print("Invalid input. Please enter a valid number.")
        goto continue
    end

    safeWrite("Enter second number: ")
    local input2 = safeRead()
    if not input2 then
        print("Error: Input not supported in this environment.")
        break
    end
    if input2 == "exit" then
        print("Goodbye!")
        break
    end

    local num2 = tonumber(input2)
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