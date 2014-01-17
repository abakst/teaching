# CSE 130 Section Notes 1/10/2014
# Alexander Bakst

## Type Review

What are the types of the following expressions? 
If there is a type error, why is there one?

1 + 1

[("one",2);("three",4)] @ (["five"],[6])

(if "five" = "six" then 3 + 4 else 0) - if (if 1 > 0 then "cat" else "dog") = "cat" then 0 else 1

## Variables

Clearly there is only so much we can do here. What if we want to
remember the values of certain expressions? We can use the `let`
construct to do so at the OCaml top level:

    # let <name> = <expression>;;
      
    # let x = 3;;

What happens if we do...
   
    # let x = y;;

Or     

    # let x = 3;;
    # let x = x;;
    # x;;

Note that this syntactic form only works at the top level. For temporary
bindings, the more general form is:

    let <name> = <expression> in <expression>
    
So what is the value of

    # let x = 3 in x + x;;
    
Remember, everything is an expression, so `let x = e in e` is an expression, too...
...which means it has a value
...and a type!

What is the value of 
 
    # let 
        x = 3 
      in 
        let 
          z = 0
        in
          if x > z then 
            x 
          else 
            z

And what is the value of 
 
    # let x = 3 in (let x = x in x) + x
    
    # let x = 3 in (let y = x in x) + y
       
       
## Pattern matching       

How do we construct a pair? There's only one way:

    # (<expr>, <expr>);;
    
    # (1, 2);;
    -: int * int = (1, 2)
    
We can use `let` to match on this pattern. What is the value of:

    # let (x, y) = (1, 2) in x;;
    
What else do we know how to construct? Lists!

`::` takes a "thing" and a list of "things" and creates a new list:

Therefore, what are the types of `h` and `t` in? What are their values?

    # let h::t = [1;2;3;4];;

Try running this in your interpreter. What is the warning about?

    # let h::t = [];;
    
What went wrong here??


## Functions

Everything has been pretty lame so far - how do we abstract?

Remember, everything is an expression and has a value - so functions are values, too!

    # let inc = fun x -> x + 1;;

What do we get here? What is the type of `inc`? 

How are functions evaluated?

What about multiple parameters?

    # let myAdd = fun x -> fun y -> x + y;;
    # let inc   = myAdd 1;;

What is the type of `(+)`?
"                 " `(&&)`?
"                 " `(^)`?

What is the type of `cons`:

    # let cons = fun x -> fun y -> x :: y;;
    
What is the type of `cons "red"`    

What is the result of:

    # let cons = fun x -> fun y -> x :: [y];;
    # let cons = fun x -> fun y -> cons [x] (cons x y);;
    # let cons = fun x -> fun y -> cons [x] [y];;
    
What are the types of each?    

What is the value of cons 1 2 at each definition?

## Functions of functions!!

In math we have the notion of function composition:

f(g(x)) = (f . g)(x)

We can define the same operation in ocaml. But first, what do
we expect the type of compose to be?

    compose f g = ...

