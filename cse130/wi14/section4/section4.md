# CSE 130 Section Notes 1/17/2014
# Alexander Bakst

# Warm up - assoc

Let's define a type of list that can store keys/values:

# Safe List.hd etc...

Remember our definition of hd:

    let hd x = match x with
                 | []   -> failwith "hd: empty list"
                 | h::t -> h
                 
This is a real bummer if we ever accidentally call `hd` with
an empty list - our program will crash!




    
