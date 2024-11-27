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
after Hadamad:
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

_Recall_: $arrow(v) compose arrow(sigma)$ is Hermitian and unitary and has eigenvalues $plus.minus 1$
// Alice performs her measurement immediately before Bob.
// Example:
// begin(itemize)
// item $vec(v)=(0,0,1), quad text(observalbe Z)=textcolor(green)(1) * ket(0)bra(0) + (textcolor(blue)(-1))ket(1)bra(1)$      (standard measurement)
//     if Alice measures eigenvalue:
//     $text(textcolor(green)(1): wavefunction collapse to )ket(01)$
//     $text(textcolor(blue)(-1): wavefunction collapse to )ket(10)$
//     $rightsquigarrow$ Bob will always obtain the opposite measurment result
// item $vec(v) = (1,0,0), quad text(observable: X, eigenstates ) ket(pm) = frac(1)(sqrt(2)) (ket(0) pm ket(1)),$ corresponding eigenvalues $pm1$ (measurement w.r.t. $(ket(+), ket(-))$ basis)
// can represent the wavefunction as $ket(beta_(11)) = - frac(1)(sqrt(2)) (ket(+-) - ket(-+))$ namely:
// $-frac(1)(sqrt(2))(ket(+-) - ket(-+)) = -frac(1)(sqrt(2))(frac(1)(2)(ket(0)+ket(1))(ket(0)-ket(1)) - frac(1)(2)(ket(0)-ket(1))(ket(0)+\ket(1)) = ... = \frac(1)(\sqrt(2)) (\ket(01) - \ket(10)= \ket(\beta_(11))$ 
// If Alice measures eigenvalue 1, wavefunction will collapse to $\ket(+-) \rightsquigarrow$ Bob's qubit is :- state $\ket(-)$, he weill certainly measure eigenvalue -1 (conversely if Alice measures -1)
// \item general observable $\vec(v) \circ \vec(\sigma)$, general unit vector $\vec(v) \in \mathbb(R)^3$:\\
// denote the orthogonal eigenstates of $\vec(v) \circ \vec(\sigma)$ by $\ket(a), \ket(b)$, then there exist complex numbers $\alpha, \beta, \gamma, \delta$ such that
// $\ket(0) = \alpha \ket(a) + \beta \ket(b)$
// $\ket(1) = \gamma \ket(a) + \delta \ket(b)$
// Inserted into $\ket(\beta_(11))$:
// $\frac(1)(\sqrt(2))(\ket(01)-\ket(10)) = \underbrace((\alpha\delta - \beta\gamma))_(\text(det(U) with U) = \begin(pmatrix)
//     \alpha&\beta\\
//     \gamma&\delta
// \end(pmatrix)) \frac(1)(\sqrt(2))(\ket(ab)-\ket(ba)) $
// U is base change matrix between orthonormal $\(\ket(0), \ket(1)\)$ and $\(\ket(a), \ket(b)\)$ basis $\rightsquigarrow$ U unitary $\rightsquigarrow \quad |\text(det(U))|=1$\\
// Can represent det(U)=$e^(i\vartheta), \vartheta \in \mathbb(R)$
// \end(itemize)
// $\rightsquigarrow$ as before: Bob will obtain opposite measurement result as Alice. Therefore Alice can predict Bob's measurement result. However, there is no possibility that Alice could influence Bob's measurement (after performing her measurement) since they are far apart (speed of light too slow)\\
// EPR argument: "property" $\vec(v) \circ \vec(\sigma)$ of a qubit is an "element of reality". However quantum mechanics does not a priori specify this property for all possible $\vec(v)$ (but only probabilities), and is thus an incomplete description of reality.\\
// Instead: "hidden variable theory": there must be additional variables "hidden" in a qubit which determines Bob's measurement of $\vec(v) \circ \vec(\sigma)$ for all possible $v \in \mathbb(R)^3$\\
// Bell's inequality: experimental test which can \underline(invalidate) local hidden variable theories (bell 1964)\\
// \underline("local") no faster-than-light communication possible \textit((otherwise one could send information backwards in time according to special relativity))\\
// Experimental schematic: many repetitions (to collect statistics) of the following setup:
// \begin(figure) [H]
//     \centering
//     \includegraphics[width=0.5\textwidth](figures/image_ABC.png)
//     \caption(prepares two particles, sends one to Alice and one to Bob)
//     \label(fig:ABC)
// \end(figure)