= Divide and Conquer
The _divide and conquer_ paradigm is a paradigm which tries to solve problems by dividing them into subproblems of constant size which can be solved efficiently.

== Divide
The first step of solving a problem is dividing it into *$k$ subproblems* of sizes $n_1, dots,n_k "with" k >= 2$. 
When the problem has been divided up into subproblems which are smaller than a certain _constant_ threshold they can be solved directly.

TODO: insert cases equation here

== Conquer
In the _conquer_ step, the subproblems are solved recursively.

== Merge
In the _merge_ step the partial solutions are combined and into a new subproblem until enough recursion steps have been made between _conquer_ and _merge_ until the final solution to the original problem is reached.

== Time Complexity of Divide and Conquer Algorithms


#set math.cases(gap: 1em)
$ T(n) = cases(Theta(1) quad quad quad quad quad quad "if" n = 1, 2T(n\/2) + Theta(n) quad "if" n > 1) $
$ T(n) = Theta(n dot log n) $