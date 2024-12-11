#import "../snippets.typ" as sn
#import "../block_snippets.typ" as bs

= Entanglement and its application
A n-qubit state $sn.ket(psi) (n >= 2)$ is called underline(entangled) if it cannot be written as tensor product of single-qubit states, i.e. 
$
sn.ket(psi) != sn.ket(phi_(n-1)) times.circle dots times.circle sn.ket(phi_0) quad quad "for any" sn.ket(phi_0) dots sn.ket(phi_(n-1)) in bb(C)^2
$

*Example*: Bell states, also denoted EPR states (Einstein, Podolsky, Rosen):
$
sn.ket(beta_(00)) &= 1/sqrt(2)(sn.ket(00) + sn.ket(11)) #text(gray)[$!= sn.ket(a)sn.ket(b)$]\
sn.ket(beta_(01)) &= 1/sqrt(2)(sn.ket(01) + sn.ket(10))\
sn.ket(beta_(10)) &= 1/sqrt(2)(sn.ket(00) - sn.ket(11))\
sn.ket(beta_(11)) &= 1/sqrt(2)(sn.ket(01) - sn.ket(10))
$
Quantum circuit to create Bell states:
#bs.placeholder()

== Quantum teleportation
*Scnenario*: two (experimental physicists) Alice and Bob, are far away from each other. 
When visiting each other a long time ago, they generated the EPR pair $sn.ket(beta_(00))$ each keeping one qubit of the pair. 
Alice's task is to send another (unknown) qubit $sn.ket(psi)$ to Bob.\
_Note_: measurement is not an option.

#bs.placeholder()

_Input_: 
$
sn.ket(psi)sn.ket(beta_(00)) = sn.ket(psi) times.circle sn.ket(beta_(00)) = 1/sqrt(2) (alpha sn.ket(0) (sn.ket(00) + sn.ket(11)) + beta sn.ket(1)(sn.ket(00) + sn.ket(11)))
$

after CNOT:
$
sn.ket(psi_1) = 1/sqrt(2) (alpha sn.ket(0) (sn.ket(00) + sn.ket(11)) + beta sn.ket(1)(sn.ket(#text(red)[1]0) + sn.ket(#text(red)[0]1)))
$
after Hadamard:
$
&sn.ket(psi_2) = 1/2 (alpha (sn.ket(0) + sn.ket(1))(sn.ket(00) + sn.ket(11)) + beta (sn.ket(0) - sn.ket(1))(sn.ket(00) + sn.ket(11)))\
&= 1/2(sn.ket(00)(alpha sn.ket(0) + beta sn.ket(1)) + sn.ket(01)(alpha sn.ket(1) + beta sn.ket(0)) + sn.ket(10)(alpha sn.ket(1) - beta sn.ket(0)) + sn.ket(11)(alpha sn.ket(1) - beta sn.ket(0))) 
$
Now Alice measures qubits w.r.t computational basis (projective measurement): 
$
P_1 = sn.ket(00)sn.tek(00) times.circle I, P_2 = sn.ket(01) sn.tek(01) times.circle I, P_3 = sn.ket(10) sn.tek(10) times.circle I, P_4 = sn.ket(11) sn.tek(11) times.circle I
$
If Alice measures 00, then $psi_2$ will collapse to:
$
sn.ket(00)(alpha sn.ket(0) + beta sn.ket(1)) = sn.ket(00) sn.ket(psi)
$

Similarly:
$
00 arrow.r alpha sn.ket(0) + beta sn.ket(1)\
01 arrow.r alpha sn.ket(1) + beta sn.ket(0)\
10 arrow.r alpha sn.ket(0) - beta sn.ket(1)\
11 arrow.r alpha sn.ket(1) - beta sn.ket(0)
$
Alice transmits her measurement result to Bob (classical information), Bob then applies Pauli-X and/or Pauli-Z to recover $sn.ket(psi)$. 
Even though wavefunction collapse is instantaneous, no faster-than-light information transfer possible due to required classical communication.

== Einstein, Podolsky, Rosen(EPR) and Bell inequality
_"Can quantum mechanical description of physical reality be considered complete?"_ (1935). The authors argue that quantum mechanics is incomplete since it lacks certain _"elements of reality"_. 

_Scenario_: Alice and Bob are far from each other, but share the entangled two-qubit "spin-singlet" state: $
sn.ket(beta_(11)) = 1/sqrt(2) (sn.ket(01) - sn.ket(10))
$
Alice and Bob measure the observable: 
$
arrow(v) compose arrow(sigma) = v_1X + v_2Y + v_3Z quad ("with" arrow(v) in bb(R)^3, ||arrow(v)||=1)
$ on their respective qubit.

_Recall_: $arrow(v) compose arrow(sigma)$ is Hermitian and unitary and has eigenvalues $plus.minus 1$.
Alice performs her measurement immediately before Bob.

=== Example:
- $arrow(v)=(0,0,1), quad "observable Z" = #text(green)[1] * sn.ket(0)sn.tek(0) + (#text(blue)[-1]) sn.ket(1) sn.tek(1)$      (standard measurement)\ if Alice measures eigenvalue:
  - $#text(green)[1] ": wavefunction collapse to" sn.ket(01)$
  - $#text(blue)[-1] ": wavefunction collapse to" sn.ket(10)$
  $arrow.r.squiggly$ Bob will always obtain the opposite measurment result

-  $arrow(v) = (1,0,0), quad "observable: X, eigenstates" sn.ket(plus.minus) = 1/sqrt(2) (sn.ket(0) plus.minus sn.ket(1)),$ corresponding eigenvalues $plus.minus 1$ (measurement w.r.t. $(sn.ket(+), sn.ket(-))$ basis) can represent the wavefunction as $ sn.ket(beta_(11)) = - 1/sqrt(2) (sn.ket(plus.minus) - sn.ket(plus.minus)) $ namely:\ $ -1/sqrt(2)(sn.ket(+-) - sn.ket(-+)) &= -1/sqrt(2)(1/2 (sn.ket(0)+sn.ket(1))(sn.ket(0)-sn.ket(1)) - 1/2(sn.ket(0)-sn.ket(1))(sn.ket(0)+sn.ket(1))\ &= dots = 1/sqrt(2) (sn.ket(01) - sn.ket(10)= sn.ket(beta_(11)) $\ If Alice measures eigenvalue 1, wavefunction will collapse to $sn.ket(+-) arrow.r.squiggly$ Bob's qubit is :- state $sn.ket(-)$, he weill certainly measure eigenvalue -1 (conversely if Alice measures -1)

- general observable $arrow(v) compose arrow(sigma)$, general unit vector $arrow(v) in bb(R)^3$:\ denote the orthogonal eigenstates of $arrow(v) compose arrow(sigma)$ by $sn.ket(a), sn.ket(b)$, then there exist complex numbers $alpha, beta, gamma, delta$ such that: $ sn.ket(0) = alpha sn.ket(a) + beta sn.ket(b) $ $ sn.ket(1) = gamma sn.ket(a) + delta sn.ket(b) $ Inserted into $sn.ket(beta_(11))$: $ 1/sqrt(2)(sn.ket(01)-sn.ket(10)) = underbrace((alpha delta - beta gamma), "det(U) with U" = mat(alpha,beta;gamma,delta)) 1/sqrt(2)(sn.ket(a b)-sn.ket(b a)) $\ U is base change matrix between orthonormal ${sn.ket(0), sn.ket(1)}$ and ${sn.ket(a), sn.ket(b)}$ basis $arrow.r.squiggly$ U unitary $arrow.r.squiggly |"det(U)"|=1$. Can represent det(U)=$e^(i theta), theta in bb(R)$


$arrow.r.squiggly$ as before: Bob will obtain opposite measurement result as Alice. 
Therefore Alice can predict Bob's measurement result. 
However, there is no possibility that Alice could influence Bob's measurement (after performing her measurement) since they are far apart (speed of light too slow).
EPR argument: "property" $arrow(v) compose arrow(sigma)$ of a qubit is an "element of reality".
However quantum mechanics does not a priori specify this property for all possible $arrow(v)$ (but only probabilities), and is thus an incomplete description of reality.

Instead: "hidden variable theory": there must be additional variables "hidden" in a qubit which determines Bob's measurement of $arrow(v) compose arrow(sigma)$ for all possible $v in bb(R)^3$
Bell's inequality: experimental test which can #underline("invalidate") local hidden variable theories (bell 1964)

#underline("local") no faster-than-light communication possible _(otherwise one could send information backwards in time according to special relativity)_.

Experimental schematic: many repetitions (to collect statistics) of the following setup:
#bs.placeholder()
binary property values:
$
Q in {plus.minus 1}, R in {plus.minus 1}, S in {plus.minus 1}, T in {plus.minus 1}
$
- _Alice_ decides randomly whether to measure property Q or R\
- _Bob_ decides randomly whether to measure property S or T\
_Alice_ and _Bob_ perform their measurement (almost) simultaneously, such that no information about the result can be transmitted in between. 
After completing this protocol, _Alice_ and _Bob_ meet to analyze their measurement data.
Consider the quantity:
$
Q S + R S + R T - Q T = (Q + R)S + (R - Q)T = plus.minus  2
$ 
Denote by $p(q,r,s,t)$ the probability that the system before the measurement is in the state Q=q, R=r, S=s, T=t, then:
$
bb(E)[Q S + R S + R T - Q T] &= sum_(q,r,s,t in {plus.minus  1}) p(q,r,s,t) underbrace((q s+r s+r t-q t), plus.minus 2)\ &<= sum_(q,r,s,t in {plus.minus  1}) 2p(q,r,s,t) = 2
$ 
By linearity of $bb(E)$, arrive at the following #underline("Bell inequality"):
$
bb(E)[Q S] + bb(E)[R S] + bb(E)[R T] - bb(E)[Q T] <= 2 
$ 
Each term can be experimentally evaluated, e.g. for $bb(E)[Q S]$: _Alice_ and _Bob_ average over cases where _Alice_ measures Q and _Bob_ measures S.
Compare with "quantum" realization of the experiment:
Charlie prepares the two-qubit single state  
$ 
sn.ket(psi) = 1/sqrt(2) (sn.ket(#text(green)[0] #text(orange)[1]) - sn.ket(#text(green)[1] #text(orange)[0])) 
$  
and sends the first qubit to #text(green)[_Alice_] and the second to #text(orange)[_Bob_].\
Observables:
$ 
Q=Z_1 quad quad  S= (-Z_2 - X_2)/(sqrt(2))\
R=X_1 quad quad  T= (Z_1 - X_2)/(sqrt(2))
$ 
Measurement changes:
$ 
sn.bra(Q S) equiv sn.tek(psi) Q times.circle S sn.ket(psi) = 1/sqrt(2), quad sn.bra(R S) = 1/sqrt(2)\
sn.bra(R T) = 1/sqrt(2), quad sn.bra(Q T) = -1/sqrt(2)\
sn.bra(Q S) + sn.bra(R S) + sn.bra(R T) - sn.bra(Q T) = 2 sqrt(2) #text(red)[$lt.eq.not 2$] "(violates Bell's inequality)"
$ 
Actual laboratory experiments (using photons) agree with predictions by quantum mechanics, thus not all (implicit) assumptions leading to Bell's inequality can be satisfied:
- "realism": physical properties Q,R,S,T have definite values independent of observation (measurement)
- locality: _Alice_ performing her measurement cannot influence _Bob_'s measurement and vice versa
$arrow.r.squiggly$ nature is not "locally realistic" (most common viewpoint: realism does not hold)\
Practical lesson: use entanglement as resource 