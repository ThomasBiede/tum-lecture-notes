#import "../snippets.typ" as sn
#import "../block_snippets.typ" as bs

= Quantum Measurements (Nielsen 1.3.3, 2.2.3, 2.2.5)

== Unitary freedom of choice of measurement
Given an orthogonal basis $ (sn.ket(u_1), sn.ket(u_2))$, can measure with respect to this orthogonal basis by performing base change before and after measurement: $U=(sn.ket(u_1), sn.ket(u_2)) in bb(C)^(2 times 2)$ unitary.

#bs.placeholder()

Representing a qubit $ sn.ket( psi)= alpha_1 sn.ket(u_1)+ alpha_2 sn.ket(u_2)$, $ alpha_1, alpha_2 in bb(C)^(2 times 2)$, then:

$
U^dagger sn.ket( psi) =  alpha_1 sn.ket(0) alpha_2 sn.ket(1)
$

will obtain measurement result 0 or 1 with respective probabilities $|alpha_1|^2$ and $|alpha_2|^2$.
After the measurement and applying $U$: $ sn.ket( psi)$ will be in state $ sn.ket(u_1)$ or $ sn.ket(u_2)$

== Abstract general definition of quantum measurements

Quantum measurements are described by a collection ${M_m}$ of *measurements operators* acting on the quantum system, with the index $m$ labeling possible measurement outcomes. Denoting the quantum state before measurement by $sn.ket( psi)$, result $m$ occurs with probability:

$
p(m) &=  #sn.bra([$psi|M_m^ dagger M_m| psi$])\
     &= ||M_m sn.ket( psi)||^2
$

state after the measurement is:

$
(M_m sn.ket( psi))/(||M_m sn.ket( psi)||)
$

The measurement operators satisfy the *completeness relation*

$
sum M_m^ dagger M_m = I  quad quad  "s.t. the probabilities sum to 1"\   
sum p(m) =  sum  #sn.bra([$psi|M_m^ dagger M_m| psi$]) =  angle.l  psi underbrace( |(sum M_m^ dagger M_m )|, I) psi angle.r = angle.l psi  |  psi angle.r = 1
$

=== Example: Measurement of a qubit $ sn.ket( psi) =  alpha  sn.ket(0) +  beta  sn.ket(1)$ with repsect to computational basis $( sn.ket(0), sn.ket(1))$

$
M_0:=  #sn.ket(0) #sn.tek(0) =  underbrace(mat(1;0), 2 times 1) underbrace(mat(1, 0), 1 times 2) = mat(1, 0; 0, 0)\
M_1:=  #sn.ket(1) #sn.tek(1) =  underbrace(mat(0; 1), 2 times 1) underbrace(mat(0, 1), 1 times 2) = mat(0, 0; 0, 1)\  
arrow.r.squiggly p(0) =  #sn.bra([$psi|M^ dagger_0 M_0|psi$]) =  #sn.bra([$psi|M_0|psi$]) = |alpha|^2\  
arrow.r.squiggly p(1) =  #sn.bra([$psi|M^ dagger_1 M_1|psi$]) =  #sn.bra([$psi|M_1|psi$]) = |beta|^2
$

== Projective measurements

// TODO: HANDOUT

#bs.info([
A projective measurement is described by an *observable* $M$, a Hermitian operator acting on the quantum system spectral decomposition

$
M =  sum  lambda_m P_m
$

with $P_m$: projection onto eigenspace with eigenvalue $lambda_m$
])

The possible outcomes of the measurement correspond to the eigenvalues $ lambda_m$. Probability of getting result $ lambda_m$:

$
#text(orange)[$p($]lambda_m #text(orange)[$)$] = attach(sn.tek(psi) underbrace(#text(blue)[$P_m$]) sn.ket(psi), b: = P_m^dagger P_m = P_m^2 = P_m, bl: "", br: "").
$
State of the quantum system after the measurement:

$
(P_m sn.ket( psi))/(||P_m sn.ket( psi)||) =  (P_m sn.ket( psi))/( sqrt( #text(orange)[(p(] lambda_m #text(orange)[)])).
$

_Remarks_:
- Projective measurements are special cases of general measurement framework
- Projective measurements combined with unitary transformations are equivalent to general measurement framework

Average value of projective measurement:
$
  bb(E)[M] &= sum_m lambda_m p(lambda_m) = sum_m lambda_m sn.bra(psi|P_m|psi)\
   & = sn.bra(psi|underbrace(sum_m lambda_m P_m, M) |psi) = sn.bra(psi|M|psi) = sn.bra(M)
$

Corresponding #underline("standard deviation"): 
$
triangle (M) := sqrt(sn.bra(M^2) - sn.bra(M)^2) = sqrt(sn.bra((M-sn.bra(M))^2))
$

#bs.example([
  - Measuring a qubit w.r.t computational basis ${sn.ket(0), sn.ket(1)}$ is actually a projective measurement: $P_0 sn.ket(0) sn.tek(0), P_1 sn.ket(1) sn.tek(1)$

  - In general: measurement w.r.t. orthonormal basis ${sn.ket(u_1), sn.ket(u_2)}$ is a projective measurement: set $ P_M = sn.ket(u_m) sn.tek(u_m) quad "for m = 1,2" $ define observable M by: $ M :=  sum_(m=1)^2 lambda_m P_m quad "with arbitrary" lambda_1,lambda_2 in bb(R), lambda_1 != lambda_2 $
  
  - Measuring Pauli-Z: $ Z = 1 dot underbrace(mat(
    1, 0;
    0, 0
    ), P_0=sn.ket(0)sn.tek(0)) + (-1) dot underbrace(mat(
    0, 0;
    0, 1
    ), P_1) $ agrees with standard measurement w.r.t. computational basis ${sn.ket(0), sn.ket(1)}$.
])

== The Heisenberg uncertainty principle
Suppose C and D are two observables and $sn.ket(psi)$ a quantum state. 
Then:
$ 
triangle(C) dot triangle(D) >= sn.bra(psi|\[C D\]|psi)/2.
$
Interpretation for experiments: repeated preparation of $sn.ket(psi)$, measure C in some cases, D in the other cases to obtain standard deviations $triangle(C)$ and $triangle(D)$.\
$arrow.r.squiggly$ see handout _heisenberg_uncertainity_priciple.pdf_.