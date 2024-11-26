#import "../snippets.typ" as sn
#import "../block_snippets.typ" as bs

= Quantum Measurements (Nielsen 1.3.3, 2.2.3, 2.2.5)

== Unitary freedom of choice of measurement
Given an orthogonal basis $ (sn.ket(u_1), sn.ket(u_2))$, can measure with respect to this orthogonal basis by performing base change before and after measurement: $U=(sn.ket(u_1), sn.ket(u_2)) in bb(C)^(2 times 2)$ unitary.

// TODO: INSERT CN

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
#text(orange)[$p($]lambda_m #text(orange)[$)$] = sn.tek(psi) #text(blue)[$P_m$] sn.ket(psi).
$

State of the quantum system after the measurement:

$
(P_m sn.ket( psi))/(||P_m sn.ket( psi)||) =  (P_m sn.ket( psi))/( sqrt( #text(orange)[(p(] lambda_m #text(orange)[)])).
$