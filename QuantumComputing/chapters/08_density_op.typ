#import "../snippets.typ" as sn
#import "../block_snippets.typ" as bs

= Density operator
So far: state vector $sn.ket(psi)$ describing a quantum state.
Convenient alternative formulation for quantum systems about which we only have partial information:
#underline("density operator") (also called #underline("density matrix"))

== Ensembles of quantum states
Considering a quantum system which is in one of several states $sn.ket(psi_i)$ with probability $#text(blue)[$p_i$]$: #underline("ensemble") of quantum states ${p_i, sn.ket(psi_i)}$
The #underline("density operator") $rho$  of the ensemble ${p_i, sn.ket(psi_i)}$ is defined as:
$ 
rho = sum_i p_i sn.ket(psi_i)sn.tek(psi_i) 
$ 
Quantum mechanics in terms of density operators:

- unitary operations: a unitary transformation U maps each $sn.ket(psi_i) arrow.r.long.bar U sn.ket(psi_i)$, and the ensemble to ${p_i, U sn.ket(psi_i)}$. Thus the density operator is transformed as 
    $ 
    rho arrow.r.bar.long^(U) sum_i p_i U sn.ket(psi_i) underbrace(sn.tek(psi_i) U^dagger, (U sn.ket(psi_i))^dagger) = U(underbrace(sum_i p_i sn.ket(psi_i)sn.tek(psi_i), rho))U^dagger = U rho U^dagger 
    $
- measurements: measurement operator ${M_m}$,  if system is in state $sn.ket(psi_i)$, then probability for result $m$, given $i$, is 
    $ 
    P(M|i) = sn.ket(psi)M_m^dagger M_m sn.ket(psi_i) = tr[M_m^dagger M_m sn.ket(psi_i)sn.tek(psi_i)] 
    $ 
    #bs.info([$tr[A B C] = tr[B C A] "and" tr[sn.ket(psi)sn.tek(phi)] = sn.bra(psi|phi)$])
    Thus overall probability for result $m$ is:
    $ 
    p(m) &= sum_i p(m|i)p_i = sum_i tr[M_m^dagger M_m sn.ket(psi_i)sn.tek(psi_i)]p_i\
    &= tr[M_m^dagger M_m sum_i p_i sn.ket(psi_i)sn.tek(psi_i)]\
    &= tr[M_m^dagger M_m rho] 
    $ 
    #bs.question([Density operator $rho_m$ after obtaining the result $m$])
    State $i$ collapses to $sn.ket(psi_i) arrow.r.long.bar (M_m sn.ket(psi_i))/(||M_m sn.ket(psi_i)||) =: sn.ket(psi_i^m)$ thus: 
    $ 
    rho_m &= sum_i p(i|m) sn.ket(psi_i^m)sn.tek(psi_i^m) = sum_i p(i|m) (M_m sn.ket(psi_i) sn.tek(psi_i)M_m^dagger)/(||M_m sn.ket(psi_i)||^2)\
    &= sum_i p_i (M_m sn.ket(psi_i)sn.tek(psi_i)M_m^dagger)/(p(m)) = (M_m rho M_m^dagger)/(tr[M_m^dagger M_m rho]) 
    $ 
    #bs.definition([$(p(i|m))/(p(m|i)) = (p_i)/(p(m)) "(Baye's thereom)" P(A|B) = (P(B|A) dot P(A))/(P(B))$])

    #bs.info([
        $rho_m$ is now expressed in terms of $rho$ and the measurement operators, without explicit reference to the ensemble ${p_i, sn.ket(psi_i)}$
    ])
== General properties of the density operator
#bs.definition([
    Characterization of density operators: Am operator $rho$ is the density matrix associated to some ensemble ${p_i, sn.ket(psi_i)}$ if and only if:
    + $tr[rho] = 1$ (trace condition)
    + $rho$ is a positive operator (positive condition)
])
#bs.remark([
    $rho$ is called a positive operator if it is Hermitian and all its eigenvalues are $>=0$, equivalent if $sn.bra(phi|rho|phi) >= 0$ for all vectors $sn.ket(phi)$
])
#bs.proof([
    "$arrow.r.double$": Suppose $rho = sum_i p_i sn.ket(psi_i) sn.tek(psi_i)$, then:
    $
    tr[rho] = sum_i p_i tr[sn.ket(psi_i) sn.tek(psi_i)] = sum_i p_i underbrace(sn.bra(psi_i|psi_i), 1) = 1
    $
    and for any state  $sn.ket(phi)$:
    $
    sn.bra(phi|rho|phi) = sum_i p_i sn.bra(phi|psi_i)sn.bra(psi_i|phi) = sum_i p_i |sn.bra(phi|psi_i)|^(2) >= 0.
    $
    #sn.hline()
    "$arrow.l.double$": $rho$ is an operator (i.e. a hermitian matrix) $arrow.r.squiggly$ by spectral theorem there exist eigenvalues $lambda_j$ and corresponding orthonormal eigenvecetors $sn.ket(phi_j)$ such that: 
     $ 
     rho = sum_j lambda_j sn.ket(phi_j) sn.tek(phi_j) 
     $
     since $rho$ satisfies the trace condition:
     $
     1 = tr[rho] = sum_j lambda_j tr[sn.ket(phi_j) sn.tek(phi_j)] = sum_j lambda_j sn.bra(phi_j|phi_j) = sum_j lambda_j
     $  
     due to passivity of $rho: lambda_j >= 0$ for all j. Thus can interpret eigenvalues $lambda_j$ as probabilities $arrow.r.squiggly {lambda_j, sn.ket(phi_j)}$ is an ensemble which gives rise to $rho$.
])
From now on, we define a density operator as positive operator $rho$ with tr[$rho$] = 1.
#bs.definition([
    Language regarding density operators:
    - _pure state_:\
        Quantum system in a state $psi$, corresponding density operator $rho = sn.ket(psi)sn.tek(psi)$ s.t. 
        $
        tr[rho^(2)] = tr[sn.ket(psi)sn.bra(psi|psi)sn.tek(psi)] = sn.bra(psi|psi) = 1
        $
    - _mixed state_:\
        $rho$ describing quantum setup cannot be written as $rho = sn.ket(psi)sn.tek(psi)$;\
        intuition: in the ensemble representation ${p_i, sn.ket(psi_i)}$ of $rho$, all the probabilities are strictly smaller than 1, then: 
        $
        tr[rho^(2)] = sum_i p_i^2 < 1.
        $
])

In general let $rho$ be a density operator then $tr[rho^(2)] <= 1.$, and tr[$rho^(2)$] = 1 if and only if  $rho$ describes a pure quantum state.
#bs.proof([
    Denote the  eigenvalues of $rho$ by ${lambda_i}$, then $0 <= lambda_i <= 1$ since $rho$ is positive and 
    $
    1 = tr[rho] = sum_i lambda_i
    $
    Moreover, $tr[rho^2] = sum_i lambda_i^2 <= 1$, with "$=1$" precisely if one of the eigenvalues is $1$ and the others are $0$.  
])

#bs.warn([
    *Ensemble representation is not unique!*\
    Example:  
    $
    rho = 3/4 sn.ket(0)sn.tek(0) + 1/4 sn.ket(1)sn.tek(1) = 1/2 sn.ket(a)sn.tek(a) + 1/2 sn.ket(b)sn.tek(b) 
    $ 
    with
    $
    sn.ket(a) = sqrt(3/4)sn.ket(0) + sqrt(1/4)sn.ket(1), sn.ket(b) = sqrt(3/4)sn.ket(0) - sqrt(1/4)sn.ket(1) 
    $ 
    #bs.info([
        $sn.ket(0), sn.ket(1)$ are the (unique) eigenvectors of $rho$, and $sn.bra(a|b) != 0$)
    ])
])

For the following: given an ensemble ${p_i,sn.ket(psi_i)}$, set $sn.ket(accent(psi_i, tilde)) = sqrt(p_i)sn.ket(psi_i)$ such that $rho = sum_i sn.ket(accent(psi_i, tilde)) sn.tek(accent(psi_i, tilde))$.
Ensemble  ${sn.ket(accent(psi_i, tilde))}$ _generates_ the density operator $rho$.
To relate an ensemble ${sn.ket(accent(psi_i, tilde))}_(i=1,dots,m)$ to another ${sn.ket(accent(phi_j, tilde))}_(j=1,dots,n)$ in case $m != n$, we "pad" one of the ensembles with zero vectors, such that without loss of generality $m=n$.\

Unitary freedom in the ensemble for density matrices:\
The sets ${sn.ket(accent(phi_i, tilde))}$ and ${sn.ket(accent(phi_j, tilde))}$ generate the same density matrix if and only if 
$ 
sn.ket(accent(phi_i, tilde)) = sum_j u_(i j) sn.ket(accent(phi_j, tilde)) 
$ 
for some unitary matrix ($u_(i j)$)
#bs.proof([
    $arrow.l.double$: Insert definitions.\
    #sn.hline()
    $arrow.r.double$: Use the spectral decomposition of the density matrix:  
    $ 
    rho = sum_k lambda_k sn.ket(chi_k) sn.tek(chi_k) "with" sn.bra(chi_k|chi_k) = delta_(k l), 
    $ 
    set $sn.ket(accent(chi_k, tilde)) = sqrt(lambda_k) sn.ket(chi_k)$, express $sn.ket(accent(phi_i, tilde)) = sum_k v_(i k) sn.ket(accent(chi_k, tilde))$ for some complex coefficients $v_(i k)$. Then 
    $ 
    underbrace(sum_k sn.ket(accent(chi_k, tilde)) sn.tek(accent(chi_k, tilde)), #text(maroon)[$sum_(k,l) #text(orange)[$delta_(k,l)$] sn.ket(accent(chi_k, tilde)) sn.tek(accent(chi_l, tilde))$]) = rho = sum_i sn.ket(accent(phi_i, tilde)) sn.tek(accent(phi_i, tilde)) = sum_(k,l)(#text(orange)[$sum_i v_(i k)v_(i l)^*$]) sn.ket(accent(chi_k, tilde)) sn.tek(accent(chi_l, tilde)) 
    $ 
    This equality can only be satisfied (since the $sn.ket(accent(chi_k, tilde))$ are orthogonal and thus $sn.ket(accent(chi_k, tilde))sn.tek(accent(chi_l, tilde))$ linearly independent) if  $ #text(orange)[$delta_(k,l) = sum_i v_(i k)v_(i l)^*$] #text(maroon)[$= (V^*V^T)_(l k) = (V dot V^dagger)^*_(l k)$] $  in other words, if ($v_(i k)$) is a unitary matrix.
    By the same arguments, $sn.ket(phi_j) = sum_k w_(j k)sn.ket(accent(chi_k, tilde))$ for a unitary matrix ($w_(j k)$). 
    Thus 
    $ 
    sn.ket(accent(phi_i, tilde)) = sum_k v_(i k)sn.ket(accent(chi_k, tilde)) = sum_(k,j) v_(i k) w_(j k)^* sn.ket(accent(phi_j, tilde)) = sum_j (v w^dagger)_(i j) sn.ket(accent(phi_j, tilde)), 
    $  
    and $v dot w^dagger$ is (as product of unitary matrices) again unitary.
])


The Bloch sphere picture for qubits can be generalized to mixed states by the following representation:
$ 
rho = (I + arrow(r) * arrow(sigma))/2 
$  
with $arrow(r) in bb(R), ||arrow(r)|| <= 1,$ the Bloch vector of $rho$ (Coincides with hitherto definition in case $rho = sn.ket(psi)sn.tek(psi)$) 

== The reduced density operator
#bs.definition([
    _partial trace_: Let $n_1, n_2 in bb(N)$ then the _partial trace_ operations in terms of the conventional matrix trace by:
    $ 
    tr_1: bb(C)^(n_1n_2 times n_1n_2) arrow.r.bar bb(C)^(n_2 times n_2), tr_1[M_1 times.circle M_2] = tr[M_1] dot M_2,\ 
    tr_1: bb(C)^(n_1n_2 times n_1n_2) arrow.r.bar bb(C)^(n_1 times n_1), tr_2[M_1 times.circle M_2] = tr[M_2] dot M_1, 
    $ 
    for all $M_1 in  bb(C)^(n_1 times n_1)$ and $M_2 in  bb(C)^(n_2 times n_2)$ together with linear extension.
    $ 
    tr_1[alpha M_1 times.circle M_2 + beta N_1 times.circle N_2] = alpha tr_1 [M_1 times.circle M_2] + beta tr_2[N_1 times.circle N_2] 
    $
])
Consider a composite quantum systems consisting of subsystems $A$ and $B$ for example: $A$: $m$ qubits, $B$: $n$ qubits
#bs.placeholder()
Let the quantum system be described by a density operator $rho^(A B)$.
#bs.definition([
    The _reduced density operator_ for a System $A$ by:
    $ 
    rho^A = tr_B [rho^(A B)] 
    $  
    and analogously  
    $ 
    rho^B = tr_A [rho^(A B)] 
    $
])
Examples:
    - For any quantum states $sn.ket(a_1), sn.ket(a_2) in bb(A)$ and $sn.ket(b_1), sn.ket(b_2) in bb(B)$:
        $ 
        tr_B[sn.ket(a_1)sn.tek(a_2) times.circle sn.ket(b_1)sn.tek(b_2)] = sn.ket(a_1)sn.tek(a_2) dot underbrace(tr[sn.ket(b_1)sn.tek(b_2)], sn.bra(b_2|b_1))= sn.ket(a_1)sn.tek(a_2) dot sn.bra(b_2|b_1) 
        $ 
    - Given a density matrix $rho$ for subsystem A and $sigma$ for subsystem B. Suppose that overall density matrix is 
        $ 
        rho^(A B) = rho times.circle sigma 
        $ 
        Then
        $ 
        tr_B[rho times.circle sigma] = rho dot underbrace(tr[sigma], 1) = rho\ 
        tr_A[rho times.circle sigma] = sigma dot underbrace(tr[rho], 1) = sigma
        $
    - $rho^(A B) ? sn.ket(psi)sn.tek(psi)$ with $sn.ket(psi) = 1/sqrt(2) (sn.ket(00) + sn.ket(11))$ (Bell state). Expanding $rho^(A B)$ leads to
        $ 
        rho^(A B) &= 1/2 (sn.ket(00) + sn.ket(11))(sn.tek(00) + sn.tek(11))\
        &= 1/2 (sn.ket(00)sn.tek(00) + sn.ket(00)sn.tek(11) + sn.ket(11)sn.tek(00) + sn.ket(11)sn.tek(11)) 
        $ 
        Then 
        $
        rho^A &= tr_B [rho^(A B)]\
        &= 1/2 (sn.ket(0)sn.tek(0) dot underbrace(sn.bra(0|0), 1) + sn.ket(0)sn.tek(1) dot underbrace(sn.bra(0|1), 0) + sn.ket(1)sn.tek(0) dot sn.bra(1|0) + sn.ket(1)sn.tek(1) dot sn.bra(1|1))\
        &= 1/2 (sn.ket(0)sn.tek(0) + sn.ket(1)sn.tek(1)) = I/2 
        $ 

#bs.info([
    Composite system is in the _pure state_ $sn.ket(psi)$, whereas the subsystem is described by the _mixed state_ $I/2$ (Indeed a mixed state: $tr[(I/2)^2] =  1/4 tr [I] = 1/2 < 1$)
])

=== Motivation/justification for the partial trace:
Let $M$ be any observable on subsystem $A$, then we want that $rho^A$ yields the same statistics for measuring $M$ as $rho^(A B)$ for measuring $M times.circle I$. In particular  
$ 
sn.bra(M) = tr[M dot rho^A] =^! tr[(M times.circle I) rho^(A B)] = sn.bra(M times.circle I) 
$ 
for all density operators $rho^(A B)$. The partial trace operation for computing $rho^A$ from $rho^(A B)$ is the unique operation with this property.
#bs.question([
    Application to quantum teleportation: Why does quantum teleportation not allow for faster than light communication via the instantaneous wave function collapse?
])
Recall the corresponding quantum circuit:
#bs.placeholder()
// (First two qubits has _Alice_ and the last qubit has _Bob_)\
At $sn.ket(psi_3)$, _Alice_ has completed her measurements (her qubits have _collapsed_), but _Bob_ does not know her measurement results yet. Intermediate state $sn.ket(psi_2)$: (see above)
$ 
sn.ket(psi_2) ?& 1/2 (sn.ket(00) (alpha sn.ket(0) + beta sn.ket(1)) + sn.ket(01) (alpha sn.ket(1) + beta sn.ket(0) + sn.ket(10) (alpha sn.ket(0) - beta sn.ket(1))\
&+ sn.ket(11) (alpha sn.ket(1) - beta sn.ket(0))) 
$ 
Thus, directly after _Alice_'s measurement, system is in state (from _Bob_'s perspective, who does not know the measurement results yet):
$ 
sn.ket(phi_1) = sn.ket(00) (alpha sn.ket(0) + beta sn.ket(1)) "with probability" 1/4\
sn.ket(phi_2) = sn.ket(01) (alpha sn.ket(1) + beta sn.ket(0)) "with probability" 1/4\ 
sn.ket(phi_3) = sn.ket(10) (alpha sn.ket(0) - beta sn.ket(1)) "with probability" 1/4\ 
sn.ket(phi_4) = sn.ket(11) (alpha sn.ket(1) - beta sn.ket(0)) "with probability" 1/4 
$
Corresponding density matrix of ensemble ${1/4, sn.ket(phi_j)}_(j=1...4)$:
$ 
rho^(A B) =& 1/4 sum^4_(j=1) sn.ket(phi_j)sn.tek(phi_j)\
=& 1/4 (sn.ket(00) sn.tek(00) times.circle (alpha sn.ket(0) + beta sn.ket(1))\
&(alpha^* sn.tek(0) + beta^*sn.tek(1)) + sn.ket(01) sn.tek(01) times.circle (alpha sn.ket(1) + beta sn.ket(0))\ 
&(alpha^* sn.tek(1) + beta^*sn.tek(0)) + sn.ket(10) sn.tek(10) times.circle (alpha sn.ket(0) - beta sn.ket(1))\
&(alpha^* sn.tek(0) - beta^*sn.tek(1)) + sn.ket(11) sn.tek(11) times.circle (alpha sn.ket(1) - beta sn.ket(0))\
&(alpha^* sn.tek(1) - beta^*sn.tek(0))) 
$ 

Reduced density operator describing _Bob_'s qubit:
$ 
rho^A =& tr[rho^(A B)]\
=& 1/4((alpha sn.ket(0) + beta sn.ket(1))(alpha^* sn.tek(0) + beta^*sn.tek(1)) +(alpha sn.ket(1) + beta sn.ket(0))\ 
& (alpha^* sn.tek(1) + beta^*sn.tek(0)) + (alpha sn.ket(0) - beta sn.ket(1))(alpha^* sn.tek(0) - beta^*sn.tek(1)) + (alpha sn.ket(1) - beta sn.ket(0))\
& (alpha^* sn.tek(1) - beta^*sn.tek(0)))\
=& 1/4 ( 2 ( |alpha|^2 + |beta|^2) sn.ket(0)sn.tek(0) + 2 (underbrace(|alpha|^2 + |beta|^2, 1) sn.ket(1)sn.tek(1)\
=& 1/2(sn.ket(0)sn.tek(0) + sn.ket(1)sn.tek(1)) = I/2 
$ 
independent of $sn.ket(psi) (alpha$ and $beta$ coefficients).
Since $rho^B = I/2$, any measurements by _Bob_ cannot reveal any information about $sn.ket(psi)$, i.e. _Alice_ cannot transmit information (encoded in $alpha, beta$) via the instantaneous wave function collapse to _Bob_.