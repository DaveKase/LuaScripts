--[[
The very first program all future programmers create is called "Hello, World!". We will create it too by asking the computer to output "Hello, World!".

Important difference with recipes is that in a recipe some details are left vague. If a recipe says "take three eggs" it does not tell you where to get them; it is assumed you know how to do that.
This does not (yet!) work with computers. You need to specify **every** (bolding is done with adding two * before and after a word that needs to be **bolded**) detail in the program you are writing. This 
takes practice, so we will do some exercises in explaining ourselves in very basic terms. You will learn to think and write **exactly** what you mean.

Just as in any human language there is a way to express numbers, every programming language has a way of doing math with **numbers**. Each of the main math operations -- addition, subtraction, 
multiplication, and division -- has its equivalent in programming and a special symbol to use for it. You can use plus (+) for addition, minus (-) for subtraction, asterisk (*) for multiplication, and
slash (/) for division. Let us do some math with these **operators**.

As the division and multiplication have the same priority, the expression is calculated left to right, with division being executed first, which leads to the wrong result. To fix it, we can use
parentheses to group the operations.

While we got the result we wanted (the bulb will last for approximately one year), the output was a bit boring; just a number without any explanation. As a user -- and any programmer should be able to 
see the program being developed from the perspective of a user -- I would prefer to see something more descriptive, like `A bulb rated for 2200 hours will last 1.0045662100457 years`. To do this we need to use **
strings**.

A string is a text surrounded by double or single quotes. For example, `"Hello, World!"`, `'year'`, `"Don't do it!"`, and the like. `"Wrong'` and `'incorrect"` are two examples of invalid strings, because the
surrounding quotes do not match.

We will now use the interactive console to see what we can do with the strings. Go to the console and try to add two strings `'abc'` and `'def'` together. Let's use the `+` operation for that. [Click here](macro:shell('abc'+'def')) if
you feel stuck.

Hm, that did not work. You should see an error in red that reads `"attempt to perform arithmetic on a string value"`. For adding strings together there is a separate operation, **concatenation**, with its own 
operator: `..` (two dots). Try to use this one instead of the plus sign to combine the strings. I will wait.

Much better. Now we can go back to the bulb lifespan calculation and modify it to output the message we like. Try running it in the shell or as a script.

If you look at the output of your script, you may not like the long number that was returned as part of the answer. When you write a program, you need to think not only how the **computer** is going to 
execute it, but also how **users** are going to use the program: what they need to enter and what they will see.

In this case we will **format** the string. Every string may include placeholders and provides a special way (`format` method) to put values in those placeholders. Placeholders start with `%` (percent sign). 
Here is a way to include a number: `print(("I'm %d years old"):format(8))`. Try it in the console. Type it; don't copy!

We can now format our message using the number placeholders: `%d` for integers (like `2200)` and `%f` for decimals (like `1.5`).

**String**: a group of letters surrounded by single or double quotes. Strings can be **concatenated** together using |..| (two dots) operator. Strings can be **formatted** using |:format| (to ) method.
Examples: |"Hello!"|; |'abc'| .. |'def'|; print((|"I'm %d years old"|):|format|(|8|))

Done in |testingNumbers()| function
Hint: change `is(__, 2+3, '...')` to `is(5, 2+3, '...')` to pass the test.
After making the changes, run the tests to see the results.

Done in |testingStrings()| function
Hint: change `is(__, 'a'..'b', '...')` to `is('ab', 'a'..'b', '...')` to pass the test.
After making the changes, run the tests to see the results.
]]

require "testwell"

local function tutorial()
  print("Hello, World!")
  print(30+31) -- number of days in June and July
  print(60*60) -- number of seconds in one hour
  print(15-9) -- number of hours between 9am and 3pm
  print(365*24) -- number of hours in a year
  
  print(2200/6/365) -- lifespan of a light bulb rated for 2200 hours
  print(2200/(6*365)) -- same result with a different way to calculate it
  
  print("my long string in double quotes") -- experiment with
  print('another string in single quotes') -- different strings here
  print('A bulb rated for 2200 hours will last ' .. (2200/6/365) .. ' years')
  print(('A bulb rated for %d hours will last about %.1f years'):format(2200, 2200/6/365))
  print(("I'm %d years old"):format(30))
end

local function testingNumbers()
  is(6, 1 + 2 * 3 - 1, 'Multiplication done before addition and subtraction')
  is(8, (1 + 2) * 3 - 1, 'Parentheses change priority of operations')
  is(6, (1 + 2) * (3 - 1), 'Parentheses are calculated left-to-right')
  is(1, 12 / 4 / 3, 'Same priority operations [division] done left-to-right')
  is(9, 12 / 4 * 3, 'Same priority operations [mixed] done left-to-right')
  is(1, 12 / (4 * 3), 'Same priority operations [mixed] with grouping')
  is(5, 14 - 6 - 3, 'Same priority operations [subtraction] done left-to-right')
  is(11, 14 - (6 - 3), 'Same priority operations [subtraction] with grouping')
  is(3, 2 * 1.5, 'Numbers may include a decimal point')
  report()
end

local function testingStrings()
  is('', '', 'Strings can be empty')
  is('Hello, World!', "Hello, World!", 'Strings in double quotes')
  is('Hello, World!', "Hello, " .. 'World!', 'Strings concatenated using ..')
  is("She said, 'I love to code'", "She said, 'I love to code'", 'Single quotes in double quotes')
  is('abc', 'a' .. 'b' .. 'c', 'Expressions with multiple concatenations')
  is('abc', 'a' .. ('b' .. 'c'), 'Parentheses used for grouping')
  is("I'm 8 years old", "I'm ".. 8 .." years old", 'Numbers convert to strings')
  is(("I'm %d years old"):format(8), ("I'm %d years old"):format(8), 'Strings can be formatted')
  is(("%d is more than %d"):format(5, 2), ("%d is more than %d"):format(5, 2), 'Strings with placeholders')
  report()
end

local function testFunc()
  -- Functions have to be written before function calls (like C++)
  print("testing functions")
  local x = 10
  local s = "This is a string"
  local b = true
  
  print(x)
  print(s)
  print(b)
  
  if(b == x) then
    print("b == x")
  else
    print("b != x")
  end
end

local function simpleCode(isMotion, relayState, count)
  if(isMotion) then
    relayState = 1
  end
  
  if(isMotion == false) then
    if(relayState == 1) then
      relayState = 0
    end
  end
  
  print(("%d. Current light state is %d"):format(count, relayState))
end

local function testSimple()
  isMotion = false
  relayState = 0
  
  for i = 0, 4 do
    if(i == 0) then
      isMotion = true
      relayState = 0
    elseif(i == 1) then
      isMotion = false
      relayState = 1
    elseif(i == 2) then
      isMotion = false
      relayState = 0
    elseif(i == 3) then
      isMotion = true
      relayState = 1
    end
    
    simpleCode(isMotion, relayState, i)
  end
  
end

tutorial()
testingNumbers()
testingStrings()
testFunc()
testSimple()

