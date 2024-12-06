#import "../snippets.typ" as sn
#import "../block_snippets.typ" as bs
= Single qubit gates (Nielsen 1.2.1, 2.1.8, 4.2)

== Principle of time evolution
#bs.info([The quantum state $sn.ket(psi)$ at the current time point $t$ transitions to a new quantum state $sn.ket(psi')$ at a later time point $t' > t$])

The transition is described by a complex unary matrix $U$ which also preserves the normalization:

$
sn.ket(psi) = U dot sn.ket(psi)
$

#bs.placeholder()

#bs.warn([The circuit notation is read from *left to right* but the _normal_ notation ($U dot sn.ket(psi)$) from *right to left*])

== Examples of quantum gates

=== Pauli-X-Gate

The *X-Gate* is the quantum gate equivalent of the _regular_ *NOT-Gate*; it flips $sn.ket(0) arrow.l.r.double.long sn.ket(1)$

$
X equiv sigma_1 = mat(0, 1; 1, 0)
$

=== Pauli-Y-Gate

$
Y equiv sigma_2 = mat(0, -i; i, 0 )
$

=== Pauli-Z-Gate

$
Z equiv sigma_3 equiv mat(1, 0; 0, -1 )
$

The _Z-Gate_ leaves $sn.ket(0)$ unchanged but flips the sign of the coefficient of $sn.ket(1)$

$
Z sn.ket(psi) = cos (theta / 2) sn.ket(0) #text(red)[-] e^(i phi) sin (theta / 2)sn.ket(1)
    = cos (theta / 2) sn.ket(0) + e^(i(phi + pi)) sin (theta / 2)sn.ket(1)
$

this leads to the new *Bloch-Sphere* angle $theta ‘ = theta$, $phi ‘ = phi + pi$

#bs.info([The gates are respectively a $180^degree$ rotation around the axis (The Z-Gate rotates around the Z-Axis and so on).])

_X, Y, Z-Gates_ are called *Pauli-Matrices*. The *Pauli-Vector* $arrow(sigma) = ( sigma_1, sigma_2, sigma_3 ) = ( X, Y, Z )$ is a vector of 2x2-Matrices

=== Hadamad-Gate

$
H = 1/sqrt(2) mat(1, 1; 1, -1)
$

$
H dot sn.ket(psi) = 1/sqrt(2) mat(1, 1; 1, -1 ) dot mat( alpha; beta ) = alpha underbrace((sn.ket(0) + sn.ket(1))/sqrt(2), "Base change") + beta underbrace((sn.ket(0) - sn.ket(1))/sqrt(2), "Base change")
$

#bs.placeholder()

=== Phase-Gate

$
S = mat( 1, 0; 0, i )
$

=== T-Gate

$
T = mat(1, 0; 0, #text(red)[$e^((i pi)/4)$] )
$

// TODO: seems weird the squaring result in the equation part below
#bs.info([$T^2 = S ("since" e^((i pi\/4)^2) = e^((i pi)\/2) = i)$])

=== Pauli-Matrices Properties

$
sigma_j^2 = I quad "identity" quad quad forall j\
$

$
sigma_j sigma_k &= - sigma_j sigma_k quad quad forall j,k quad j != k
$

$
#text(blue)[\[]sigma_j, sigma_k #text(blue)[\]] &= sigma_j sigma_k - sigma_k sigma_j \
&= 2i sigma_l quad forall (j,k.l) in (1,2,3)
$

$
[Y,Z] &= 2i dot X
$

// TODO: insert handout stuff here

=== X-Y-Decomposition of an arbitrary 2x2 unitary matrix

For any unitary matrix $U in bb(C)^(2 times 2)$ there $exists alpha, beta, gamma, delta in bb(R)$ s.t.:

$
U = e^(i alpha) underbrace(mat(e^(-i beta/2), 0; 0, e^(i beta/2)), R_z (beta)) dot underbrace(mat(cos (gamma/2), -sin (gamma/2); sin (gamma/2), cos (gamma/2)), R_y (gamma)) dot underbrace(mat(e^(-i delta\/2), 0; 0, e^(i delta\/2)), R_z (delta))
$

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


#bs.info([
  _What happens if we measure one qubit of a two qubit state?_
Say we measure the first qubit then we obtain the following:

- $0$ with probability $|alpha_(00)|^(2) + |alpha_(01)|^(2)$
- $1$ with probability $|alpha_(10)|^(2) + |alpha_(11)|^(2)$

The wave function directly after the measurement will be:

- $0: sn.ket(psi') = (alpha_(00) sn.ket(00) +alpha_(01) sn.ket(01))/(sqrt(|alpha_(00)|^(2) + |alpha_(01)|^(2)))$

- $1: sn.ket(psi') = (alpha_(10) sn.ket(10) +alpha_(11) sn.ket(11))/(sqrt(|alpha_(10)|^(2) + |alpha_(11)|^(2)))$
])