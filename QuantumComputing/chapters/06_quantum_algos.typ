#import "../snippets.typ" as sn
#import "../block_snippets.typ" as bs


= Quantum Search Algorithms
#bs.info([
  Classical search through N unordered elements $O(N)$.\
  Quantum Grover's algorithm: $O(sqrt(N))$ (*given certain preconditions*)
])

== Quantum Oracles
Search space of $N = 2^n$ elements, labelled $0, 1, dots, N-1$. Assume there are $M$ solutions (with $1 <= M <= N$).
Define corresponding _indicator function_ $f: {0, dots, N-1} arrow.r {0, 1}$ by:
$
f(x) = cases(
  0\, & "if element" x "is not a solution",
  1\, & "if element" x "is a solution"
)
$
Quantum version of f?\
$arrow.r.squiggly$ quantum "oracle" $U_f$ defined for computational basis states
#bs.placeholder()

#bs.info([
  $U_f$ maps basis states to basis states and satisfies $U_f^2 = serif(I) "and" (q times.circle f(x)times.circle f(x) = q)$ thus $U_f$ permutes basis states and is in particular unitary
])
Initialize oracle qubit in superpostion $sn.ket(-) = 1/sqrt(2) (sn.ket(0)- sn.ket(1))$, then:
$
sn.ket(x) times.circle (sn.ket(0)-sn.ket(1))/sqrt(2) arrow.r.long.bar^(U_f) cases(
  sn.ket(x) times.circle (sn.ket(0)-sn.ket(1))/sqrt(2)\, & "if f(x)= 0", 
  sn.ket(x) times.circle (sn.ket(1)-sn.ket(0))/sqrt(2) = #text(blue)[-] sn.ket(x) times.circle (sn.ket(0)-sn.ket(1))/sqrt(2)\, & "if f(x)= 1"
)
$
In summary: 
$
sn.ket(x) times.circle (sn.ket(0)-sn.ket(1))/sqrt(2)  arrow.r.long.bar^(U_f) underbrace(#text(blue)[$(-1)^(f(x))$] sn.ket(x), "relevant part") times.circle (sn.ket(0)-sn.ket(1))/sqrt(2) quad "(oracle qubit unchanged (only minus factor))"
$

$arrow.r.squiggly$ effective action of oracle:
#bs.placeholder()
Oracle _marks_ solution by a phase flip.

#bs.question([How could one construct such an oracle without knowing solution already?])
#bs.example([Example: Factorization of a larger integer $m in bb(N)$: Finding a prime factor of m is "difficult" on a classical computer: (no known algorithm with polynomial runtime in the bit length of m) but testing whether a given x $in bb(N)$ divides m is simple. Can perform arithmetic operations for trial division on a digital quantum computer as well $arrow.r.squiggly$ oracle which recognizes a solution x.])

== Grover's Algorithm
Search space with $N= 2^n$ elements, $M$ solutions.
Overall circuit diagram for Grover's algorithm:
#bs.placeholder()
#bs.info([StepA to StepE: in O($sqrt(N/M)$) times])
Initial Hadamard transform:
#bs.placeholder()

#bs.recap([
  Hadamard Gate:
  $
  H = 1/sqrt(2) mat(1, 1; 1, -1)
  $ 
  Applied to a single qubit: $H sn.ket(0) = 1/sqrt(2) (sn.ket(0) + sn.ket(1))$ and $H sn.ket(1) = 1/sqrt(2) (sn.ket(0) - sn.ket(1))$ for $x in {0,1}$:
 $ H sn.ket(x) = 1/sqrt(2) sum_(z=0)^1 (-1)^(z dot x) sn.ket(z) $
])

Applied to several qubits:
$ 
H^(times.circle n) sn.ket(x_1\, dots\,x_n) &= H sn.ket(x_1) times.circle dots times.circle H sn.ket(x_n)\ 
&= 1/sqrt(2^n) sum_(z_1\,dots\,z_n = 0)^1 (-1)^(x_1z_1+dots+x_n z_n) sn.ket(z_1...z_n)\ 
&= 1/sqrt(2^n) sum_(z=0)^(2^n-1) (-1)^(x dot z) sn.ket(z) 
$
In particular: $H^(times.circle n) sn.ket(0 dots 0) = 1/sqrt(N) sum_(z=0)^(N-1) sn.ket(z) =: #text(green)[$sn.ket(psi)$ equal superposition state]$\
Definition of Grover operator G:
#bs.placeholder() 
$
"phase gate" = cases(
sn.ket(0) arrow.r.long.bar  sn.ket(0)\, &,
sn.ket(x) arrow.r.long.bar  -sn.ket(x)\, &"for" x != 0
) 
quad = 2sn.ket(0)sn.tek(0) - I 
$
In summary: G = $(2sn.ket(psi)sn.tek(psi)-I)U_f$\
=== Geometric interpretation
#bs.placeholder()
Define:
$ 
sn.ket(alpha) &:= 1/sqrt(N-M) sum_(x=0, f(x)=0)^(N-1) sn.ket(x)\
sn.ket(beta) &:= 1/sqrt(M) sum_(x=0, f(x) = 1)^(N-1) sn.ket(x) 
$ 
angle $theta$ defined by $sin (theta/2) = sqrt(M/N)$ s.t. 
$ 
#text(green)[$sn.ket(psi)$] = cos (theta/2) sn.ket(alpha) + sin (theta/2) sn.ket(beta) 
$ 
#bs.info([
  By definition: $U_f sn.ket(alpha) = sn.ket(alpha), U_f sn.ket(beta) = - sn.ket(beta)$
])
$arrow.r.squiggly U_f$ is a reflection about $sn.ket(alpha)$ within subspace spanned by $sn.ket(alpha)$ and $sn.ket(beta)$. Likewise $2sn.ket(psi)sn.tek(psi) - I$ is a reflection about $sn.ket(psi)$: 
Since $sn.ket(psi)$ is part of subspace spanned by $sn.ket(alpha)$ and $sn.ket(beta)$, $G$ leaves subspace invariant!
Thus G is a product of two reflections $arrow.r.squiggly$ $G$ is a rotation by angle $theta$: 
$ 
sn.ket(phi) &= cos (phi) dot sn.ket(alpha) + sin (phi) dot sn.ket(beta)\
arrow.r.squiggly G sn.ket(phi) &= cos(phi + theta)sn.ket(alpha) + sin(phi + theta)sn.ket(beta) 
$

For $k$ applications of $G$:
$ 
G^k sn.ket(phi) = cos (phi + k theta) sn.ket(alpha) + sin (phi + k theta) sn.ket(beta) 
$ 
for initial state $sn.ket(psi): phi = theta/2$
$
G^k sn.ket(psi) = cos ((k + 1/2)theta) sn.ket(alpha) + sin((k + 1/2) theta) sn.ket(beta) 
$ 
#bs.goal([
  Rotate to $sn.ket(beta)$, i.e. $(k + 1/2)theta =^! pi/2$, since $sin (theta/2) = sqrt(M/N) quad arrow.r.long^("for" M << N) quad theta approx 2 sqrt(M/N)$ thus need $O(sqrt(M/N))$ rotations $k dot theta$ should be O(1), $k approx 1/theta$
])
Final step: standard measurement, will collapse quantum state (with high probability) to a basis state forming $sn.ket(beta)$, i.e. a solution!
== Optimality of the Search Algorithm
#bs.goal([
  Show that any quantum search algorithm needs $Omega (sqrt(N))$ oracle calls $arrow.r.squiggly O(sqrt(N))$ is already optimal.
])

For simplicity: single solution x
#bs.recap([
  Oracle flips sign of solutions:
  $ 
  O_x = I - 2 sn.ket(x) sn.tek(x) quad  ("denoted" U_f "in previous sections")) 
  $
])
 
Most general form of algorithm: oracle calls interleaved with unitary operations $U_1, U_2,dots$\
State after $k$ steps: 
$
sn.ket(psi_k^x) = U_k O_x U_(k-1) O_x dots U_1 O_x sn.ket(psi_0) 
$ 
We also define
$
sn.ket(psi_k) = U_k U_(k-1) ... U_1 sn.ket(psi_0) quad "(omit oracle calls)" 
$
#pagebreak()
=== Upper bound of of the Search Algorithm 
Strategy of proof: upper bound of
$ 
D_k := sum_(x=0)^(N-1) ||sn.ket(psi_k^x) - sn.ket(psi_k)|| 
$ 
$D_k$ grows as $O(k^2)$, but must be $Omega(N)$ to distinguish between N alternatives. First show that $D_K <= 4 k^(2)$ by induction:\
$k = 0: D_0 0 0$\
$k arrow.r k+1:$\
$
D_(k+1) &= sum_x||O_x sn.ket(psi_k^x) - sn.ket(psi_k)||^2 = sum_x || underbrace(O_x(sn.ket(psi_k^x)), b) - underbrace(sn.ket(psi_k) + (O_x - I sn.ket(psi_k)), -2 sn.ket(x)sn.bra(x|psi_k) = c)||^2\
&<= sum_x(||b||^(2) + 2||b||dot||c|| + ||c||^(2)) = sum_x (underbrace(||sn.ket(psi_k^x) - sn.ket(psi_k)||^(2), D_k) + 4 underbrace(||sn.ket(psi_k^x) - sn.ket(psi)|| |sn.bra(x|psi_k)|, "Cauchy-Schwarz") + 4 |sn.bra(psi_k|x)|^(2)\
&<= D_k + 4 (underbrace(sum_x ||sn.ket(psi_k^x) - sn.ket(psi_k)||^(2), D_k))^(1/2) (underbrace(sum_x|sn.bra(x|psi_k)|^(2), 1))^(1/2)\
&= D_k + 4 sqrt(D_k) + 4\
&<= 4k^(2) + 8k + 4 = 4(k+1)
$
=== $2^(n d)$ part of proof: $D_k$ must be $Omega(N)$:
#bs.goal([
  Find solution $x$, s.t. $sn.ket(psi_k^x) approx sn.ket(x)$
])
suppose $sn.bra(x|psi_k^x) >= 1/2$ for all x  (probability of success at least 50%)\
w.l.o.g. $sn.bra(x|psi_k^x) = |sn.bra(x|psi_k^x)|$ (can be multiply $sn.ket(x)$ by phase factor)
$ 
arrow.r.squiggly ||sn.ket(psi_l^x) - |sn.ket(x)||^(2) = underbrace(||sn.ket(psi_k^x)||^(2), 1) - 2sn.bra(x|psi_k^x) + underbrace(||sn.ket(x)||^(2), 1) = 2 - 2 underbrace(sn.bra(x|psi_k^x), >= 1/sqrt(2)) <= 2 - sqrt(2)
$
Therefore $E_k := sum_(x=0)^(N-1) ||sn.ket(psi_k^x) - sn.ket(x)||^(2) <= (2-sqrt(2))N$\
Def. $F_k := sum_(x=0)^(N-1) ||sn.ket(x) - sn.ket(psi_k)||^(2)$, then 

$
F_k &= sum_x (||sn.ket(x)||^(2) - 2 Re sn.bra(x|psi_k) + underbrace(||psi_k||^(2), 1))\
&>= 2 N - 2 underbrace(sum_x |sn.bra(x|psi_k)| dot 1, <= sqrt(sum_x |sn.bra(x|psi_k)|^(2)) dot sqrt(sum_x 1)) >= 2N - 2sqrt(N)\
$
$
D_k &= sum_x || (sn.ket(psi_k^x) - sn.ket(x)) + (sn.ket(x) - sn.ket(psi_k))||^(2)\ 
&>= sum_x (|| (sn.ket(psi_k^x) - sn.ket(x)||^(2) - 2||sn.ket(psi_k^x) - sn.ket(x)|| dot ||sn.ket(x) - sn.ket(psi_k)|| + ||sn.ket(x) - sn.ket(psi_k)||^(2))\
&= E_k + F_k - 2sum_x underbrace(underbrace(||sn.ket(psi_k^x) - sn.ket(x)||, a_x) dot underbrace(||sn.ket(x) - sn.ket(psi_k)||, b_x), |sum_x a_x dot b_x equiv |sn.bra(a|b) <= ||a|| dot ||b||)\
&>= E_k + F_K - 2sqrt(E_k) sqrt(F_k) = (sqrt(F_k) - sqrt(E_k))^(2)\
&>= (sqrt(2N - 2sqrt(N)) - sqrt((2-sqrt(2))N))^(2)\
& = N (sqrt(2 - underbrace(2/sqrt(N), "goes to" 0)) - sqrt(2 - sqrt(2)))^(2) tilde.eq N (underbrace(sqrt(2) - sqrt(2 - sqrt(2)), =: c = 0.42))^(2) = c dot N
$

In summary: $underbrace(D_k <= 4 dot k^(2) "and" D_K >= c dot N, k >= sqrt((c N)/4)) quad$ (_$k$ := number of oracle evaluations_)\
Thought experiment: If it was possible to search using O(log(N)) oracle calls, then a QC could solve NP-complete problems efficiently: just search through $2^(omega(n))$ witnesses using $omega(n)$ (bit length of a witness) oracle calls.