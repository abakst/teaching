# CSE 130 Section Notes 1/8/2014
# Alexander Bakst

# "History" of types

You don't need to know this, but this motivated the study of types in
the first place.

## The Paradox

Russell's Paradox (Barber paradox): There is a town with just one
barber, who is male. In this town each male does exactly one of the
following: he a) shaves himself or b) goes to the barber.

Who shaves the barber?

## Types

Confusing a description of sets with a description of sets of sets:

Let R = { x | x not a member of x }
Then, R is a member of R if and only if R is not a member of R

Russell's theory of types places the two at different levels, so
they can not be confused.

    
# Expressions + Values + Types

The *most* important points from the first lecture

- All program terms are *expressions*
- Every *expression* evaluates to a *value*
- *Expressions* have *types*

## Expressions and Values

2

1 + 1

"seven"

[3; 4; 5]

is + an expression? Is ::?

Seriously, everything is an expression (looking ahead):

(if 5 > 7 then 3 else 5) + 99

if e1 then e2 else e3 

first evaluates e1 to a boolean (true or false) value.
If e1 evaluates to true, then e2 is evaluated. Otherwise
e3 is evaluated.

What are the *values* of the preceeding expressions? 

## Evaluation (sort of)

How does evaluation work? We'll see more on this when
we cover things like functions, but to give a basic intuition for now:







((3 * 5) + ((7 - 1) + (6 / 3))

(15 + ((7 - 1) + (6 / 3)))

(15 + (6 + 2))

(15 + 8)

(23)









We can make this a bit more formal:

e1 ↪ v1 and e2 ↪ v2 and v1 + v2 = v3
——————————————————–—————————————————–
e1 + e2 ↪ v3 







That is, if expressions e1 and e2 evaluate to values v1 and v2, and v1
+ v2 = v3 (in math land) then e1 + e2 evaluates to v3.

You can essentially use the *same* equational reasoning you learned
in math class to reason about the evaluation of OCaml programs!





## Types

So, what is the value of

"red" + 7

## In Python? 
Evaluation proceeds UNTIL "red" + 7 is reached, then
the program halts and throws an error!

## In OCaml?
Evaluation never happens - the type checker complains

## Slightly trickier?
OK, what about the following expression:


1 + (if 1 > 0 then 10 else "Uh oh, something's wrong!")

Is 1 <= 0 ever true?




## The Story

Every expression is given a type. A program *must* type check before
it can be compiled into executable code (i.e. evaluated into a value).

Satisfying the type checker can be a real pain (sorry!)

*BUT*

Types give us some serious power:

1. If an expression has a type, then after the program runs for a little bit, 
it is guaranteed to still be well typed!

(1 + (3 + 5)) ⇒ (1 + 8) → 9

2. If an expression has a type, then evaluation can always make progress.

Note that the type system is *conservative* - no well-typed program
"gets stuck," but not all programs that don't "get stuck" are well typed: 

1 + (if 1 > 0 then 10 else "Uh oh, something's wrong!")

Since 1 > 0, this evaluates to 1 + 10. Nevertheless, this
expression is rejected by OCaml's type checker.



# Developing OCaml programs

I use Emacs, the One True Editor, with tuareg-mode.

Find Emacs for your OS here:

http://www.emacswiki.org/emacs/CategoryPorts

I use OS X and Linux (Ubuntu usually). 

On OS X I installed Emacs using Homebrew:

http://brew.sh/

On Ubuntu, you can simply run:

> apt-get install emacs

tuareg-mode for Emacs provides syntax hilighting goodies, plus
an inferior-process that lets run you an OCaml REPL in Emacs
