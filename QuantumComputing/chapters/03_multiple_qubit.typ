#import "../snippets.typ" as sn
#import "../block_snippets.typ" as bs
= Multiple Qubit (Nielsen 1.2.1, 2.1.7)

For *two* qubits the states generalize to:

$
\{ sn.ket(00), sn.ket(01), sn.ket(10), sn.ket(11) \}
$

as computation basis state, in general all possible combinations of bit strings of 0’s and 1’s of length $n$ for $n$ bit qubits.

== General two qubit state

$
sn.ket(psi) &= alpha_(00) sn.ket(00) + alpha_(01) sn.ket(01)+alpha_(10) sn.ket(10)+alpha_(11) sn.ket(11)\
&= sum_(i_1)dots sum_(i_n) alpha_(i_1,dots,i_n) sn.ket(i_1dots i_n)\
&alpha text('s) in bb(C) " and " sum |alpha text('s)|^2 = 1
$

Can identify the basis states with unit vectors:

$
sn.ket(00)=mat(1;0;0;0),sn.ket(01)=mat(0;1;0;0),sn.ket(10)=mat(0;0;1;0),sn.ket(11)=mat(0;0;0;1)
$

thus:

$
sn.ket(psi) = mat(alpha_(00);alpha_(01);alpha_(10);alpha_(11)) in bb(C)^(4)
$


#bs.question([
  _What happens if we measure one qubit of a two qubit state?_
  Say we measure the first qubit then we obtain the following:

- $0$ with probability $|alpha_(00)|^(2) + |alpha_(01)|^(2)$
- $1$ with probability $|alpha_(10)|^(2) + |alpha_(11)|^(2)$

The wave function directly after the measurement will be:

- $0: sn.ket(psi') = (alpha_(00) sn.ket(00) +alpha_(01) sn.ket(01))/(sqrt(|alpha_(00)|^(2) + |alpha_(01)|^(2)))$

- $1: sn.ket(psi') = (alpha_(10) sn.ket(10) +alpha_(11) sn.ket(11))/(sqrt(|alpha_(10)|^(2) + |alpha_(11)|^(2)))$
])