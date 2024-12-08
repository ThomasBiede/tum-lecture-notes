#import "../snippets.typ" as sn
#import "../block_snippets.typ" as bs

= Quantum operations
== Motivation and overview
In general: changes of quantum states are effected by unitary time evolution or by wave function collapse during measurements. 
Quantum operations (also called "quantum channels") are a (mathematical) generalization and unification of these concepts.
Abstractly:  
$ 
rho' = cal(E)(rho) 
$ 
where $rho$ is the density matrix and $cal(E)$ is a quantum operation. 
Special cases:
- unitary time evolution $cal(E)(rho) = U rho U^dagger$
- measurement, with measurement operator ${M m}$:\
    recall that 
    $
    underbrace(p(m), "probability for outcome" m) = tr[M m^dagger M m rho]
    $
    State after obtaining result $m$:
    $ 
    rho_m = (M m rho M m^dagger)/(tr[M m^dagger M m rho]) = (M m rho M m^dagger)/(p(m)) 
    $ 
    Corresponding quantum channel (without re-normalization): 
    $ 
    cal(E)_m(rho) = M m rho M m^dagger 
    $ 
    $p(m) = tr[cal(E)_m(rho)]$ is the probability that outcome $m$ occurs.
    Consider the scenario of performing a measurement, but not recording the outcome
    $arrow.r.squiggly$ density matrix after this process is weighted  sum over all possible outcomes:
    $ 
    cal(E)(rho) = sum_m p(m) times #text(blue)[$rho_m$] = sum_m cal(E)_m(rho) = underbrace(sum_m M m rho M m^dagger, "operator-sum representation of" cal(E)) 
    $ 

Different (but equivalent) perspectives on quantum operations: 
- system coupled to environment (_Stinespring dilation_)
- operator-sum (_Kraus_) representation
- physically motivated axioms
- Choi matrix representation

== Environments and quantum operations
_Open_ quantum system can be regarded as interaction between a:
- principle quantum system (initially in state $rho$)
- environment (initially in state $rho_("enf")$)

The principle system interacts with the environment, i.e. a time evolution of the overall system described by some unitary $U$:
#bs.placeholder()
// Circuit diagram: 
// $quad quad quad quad$ mathematical representation: $U(rho times.circle rho_("enf"))U^+$\

Output is the reduced density matrix of the principle system:
#bs.placeholder()
// $cal(E) (rho) = tr_("enf")[U(rho times.circle rho_("enf")) U^+]$

#bs.example([
    #bs.placeholder()
    
    Represents $rho = mat(
        rho_(00), rho_(01);
        rho_(10), rho_(11)
    ) = rho_(00)sn.ket(0)sn.tek(0) + rho_(01)sn.ket(0)sn.tek(1) + rho_(10)sn.ket(1)sn.tek(0) + rho_(11)sn.ket(1)sn.tek(1)$, then
    $
    U_("CNOT") (rho times.circle sn.ket(0)sn.tek(0))U_("CNOT")^dagger &= U_("CNOT")(rho_(00)sn.ket(00)sn.tek(00)\ 
    &+ rho_(01)sn.ket(00)sn.tek(10) + rho_(10)sn.ket(10)sn.tek(00) + rho_(11)sn.ket(10)sn.tek(10)) U_("CNOT")^dagger\
    &= rho_(00)sn.ket(00)sn.tek(00) + rho_(01)sn.ket(00)sn.tek(1#text(red)[1]) + rho_(10)sn.ket(1#text(red)[1])sn.tek(00) + rho_(11)sn.ket(1#text(red)[1])sn.tek(1#text(red)[1])\
    $
    #sn.hline()
    $
    tr_("env")[dots] =& rho_(00)sn.ket(0)sn.tek(0) underbrace(sn.bra(0|0), 1) + rho_(01)sn.ket(0)sn.tek(0)underbrace(sn.bra(0|1), 0)\
    & + rho_(10)sn.ket(1)sn.tek(0)underbrace(sn.bra(1|0), 0) + rho_(11)sn.ket(1)sn.tek(1) underbrace(sn.bra(1|1), 1)\
    =& rho_(00)sn.ket(0)sn.tek(0) + rho_(11)sn.ket(1)sn.tek(1) = mat(
    rho_(00), 0;
    0, rho_(11)
    )\
    =& P_0 rho P_0 + P_1 rho P_1 
    $ 
    with $P_0 = sn.ket(0)sn.tek(0)$, $P_1 = sn.ket(1)sn.tek(1)$
    #bs.info([off-diagonal entries of $rho$ are set to zero])
])

== Operator-sum representation
Let ${sn.ket(e_K)}$ be an orthonormal basis of the environment quantum system, assume w.l.o.g. $rho_("env") = sn.ket(e_0)sn.tek(e_0)$ (see tut. 12: if environment is in a mixed state, then can equivalently work with a pure state in a larger environment)\
$ 
arrow.r.squiggly cal(E)(rho) =& tr_("env") = [U(rho times.circle sn.ket(e_0)sn.tek(e_0))U^dagger]\
=& sum_K tr_("env") [U(rho times.circle sn.ket(e_0)sn.tek(e_0))U^dagger dot (I times.circle sn.ket(e_K)sn.tek(e_K))]\
=& sum_K sn.bra(e_K| U dot (rho times.circle sn.ket(e_0)sn.tek(e_0))U^dagger | e_K)\
=& sum_K #text(blue)[$E_K$] rho #text(blue)[$E_K^dagger$]
$
with #text(blue)[$E_K$] complex matrix with entries $(#text(blue)[$E_K$])_("lm") = sn.tek(l\,e_K) U sn.ket(m\,e_0) equiv sn.tek(l) sn.tek(e_K) U sn.ket(M) sn.ket(e_0) equiv (sn.tek(l) times.circle sn.tek(e_K)) U (sn.ket("lm") times.circle sn.ket(e_0))$.
The $E_K$'s are called _operation elements_ or _Kraus operators_ of $cal(E):$
$
cal(E)(rho) = sum_K E_K rho E_K^dagger 
$ 
Revisit example:
#bs.placeholder()
$ 
cases((E_0)_("lm") = sn.tek(l\,0) U_("CNOT") sn.ket(m\,0) arrow.r.squiggly E_0 = mat(
    1, 0;
    0, 0
) = P_0,
(E_1)_("lm") = sn.tek(l\,1) U_("CNOT") sn.ket(m\,0) arrow.r.squiggly E_0 = mat(
    0, 0;
    0, 1
) = P_1, reverse: #true) = "agrees with previous derivations"
$
=== Completeness relation of Kraus operators
If $cal(E)$ is trace-preserving, then for any density matrix $rho$:
$ 
1 =^!& tr[cal(E)(rho)] = tr[sum_K E_K rho E_K^dagger]\
=& sum_K tr[E_K rho E_K^dagger] = sum_K tr[E_K^dagger E_K rho]\
=& tr[(sum_K E_K^dagger E_K) dot rho] 
$ 
should hold for arbitrary $rho$ with $tr[rho] = 1 arrow.r.squiggly $
$ 
#text(blue)[$sum_K E_K^dagger E_K = I$] 
$ 
We allow for quantum operations with $sum_K E_K^dagger E_K #text(blue)[$<=$] I $ (see $E_m$ for measurement example).
"A $<=$ B" if $B - A$ is _positive semidefinite_ (p.s.d.).
#bs.definition([
    $A in bb(C)^(n times n)$ is called _positive semidefinite_ if $A$ is Hermitian and 
    $
    sn.bra(v|A|v) >= 0 arrow.long.l.r.double "all eigenvalues of" A "are" >= 0
    $ 
    for all $v in bb(C)^n$
])
$sum_K E_K^dagger E_K attach(<=, t: !) I$ stems from the requirement that $tr[cal(E)(rho)] attach(<=, t: !) 1$

#bs.remark([
    _Physical interpretation_ as measurement performed on environment with respect to ${ sn.ket(e_K)}$ basis; i.e. measurement operators $sn.ket(e_K)sn.tek(e_K)$ for outcome $k$, state of principle system is: 
    $ 
    rho_k prop tr_("env")[underbrace(sn.ket(e_K)sn.tek(e_K), M_K) U(rho times.circle sn.ket(e_0)sn.tek(e_0)) U^dagger underbrace(sn.ket(e_K)sn.tek(e_K), M_K^dagger)]  
    $ 
    i.e. $E_K$'s play the role of the measurement operators on principle systems.
])

=== System-environment model of a Kraus representation
#bs.question([
    Given trace-preserving $cal(E)(rho) = sum_(k=0)^(n-1) E_K rho E_K^dagger$ is there ea corresponding system environment representation?
])
*Yes!* 
Define model environment as vector space of dimension $n$, with orthonormal basis ${sn.ket(e_k)}_(k=0,..,n-1)$, assume that environment starts in $sn.ket(e_0)$ state.
Define unitary $U$ via $sn.ket(psi) sn.ket(e_0) = sum_K E_K sn.ket(psi) sn.ket(e_K)$ and _matrix extension_ to a unitary operator on combined system.
This is possible since for any principle quantum states $sn.ket(psi), sn.ket(phi)$:
$ 
sn.tek(psi) sn.tek(e_0) U^dagger U sn.ket(phi) sn.ket(e_0) =& sum_(k,k') sn.tek(psi) E_k^dagger E_(k') sn.tek(phi) underbrace(sn.bra(e_k|e_(k')), delta_(k,k'))\
=& sn.tek(psi) underbrace(sum_k E_k^dagger E_k, = I "compl. relation") sn.ket(phi) = sn.bra(psi|phi)\
arrow.r.squiggly& "U preserves orthogonality" 
$ 
$U$ has the desired property since:
$
tr_("env") [U ( rho times.circle sn.ket(e_o)sn.tek(e_0)) U^dagger] =& sum_(k,k') tr_("env") [(E_k rho E_(k')^dagger ) times.circle sn.ket(e_k)sn.tek(e_(k'))]\
=& sum_(k,k') E_k rho E_(k') underbrace(sn.bra(e_k|e_(k')), delta_(k,k'))\
=& sum_k E_k rho E_k^dagger
$ 

== Axiomatic approach to quantum operations
Alternative viewpoint: physical motivated axioms which a quantum operation $cal(E)$ must obey:
- [*A1:*] $tr[cal(E)(rho)]$ is probability that the process $cal(E)$ occur, thus  $ 0 <= tr[cal(E)(p)] <= 1 $  for all density matrices $rho$.
- [*A2:*] $cal(E)$ is convex-linear:  
    $ 
    cal(E) (sum_i p_i rho_i) = sum_i p_i cal(E)(rho_i) 
    $
    for any probability vector p and density matrices ${rho_i}$
- [*A3:*] $cal(E)$ is a _completely positive_ map iff $cal(E)(A)$ is _positive semidefinite_ (p.s.d.) for any p.s.d. matrix $A$.
    Moreover, when enlarging the _principle quantum system_ $Q$ by another quantum system $R$, then: 
    $
    (underbrace(I, "on" R) times.circle underbrace(cal(E), "on" Q)) (A)
    $ 
    must be p.s.d. for any p.s.d. matrix $A$ on combined system $R Q$ 

#bs.proof([
    Theorem: The map $cal(E)$ satisfies $A 1, A 2, A 3$ if and only if  
    $ 
    cal(E)(rho) = sum_k E_K rho E_k^dagger 
    $ 
    for some set of complex matrices ${E_k}$ with $sum_k E_k^dagger E_k <= I$
    #sn.hline()
    "$arrow.l.double$": to verify $A 3$: Let $A$ be a p.s.d. matrix on enlarged system $R Q$, then, for any vector $sn.ket(psi)$ on the $R Q$:
    $ 
    sn.tek(psi)(I times.circle cal(E))(A)sn.ket(psi) =& sum_k sn.tek(psi)(I times.circle E_k)A(I times.circle E_k^dagger)sn.ket(psi)\
    =& sum_k sn.bra(phi_k|A|phi_k) >= 0
    $
    "$arrow.l.double$" Principle system (which $cal(E)$ acts on) denoted $Q$, dimension $n$.
    Introduce another quantum system, labelled $R$, with same dimension as $Q$.
    Let ${ sn.ket(j_Q): j = 1,dots,n}$ an orthonormal basis of $Q$ and ${ sn.ket(j_R): j = 1,dots,n}$ an orthonormal basis of $R$.
    Define the *maximally entangled state* (c.f. ex. 12.1)
    $ 
    sn.ket(alpha) := sum_(j=1)^n sn.ket(j_r)sn.ket(j_Q) quad in R Q 
    $
    and
    $
    sigma := (I times.circle cal(E))(#text(blue)[$sn.ket(alpha)$]#text(red)[$sn.tek(alpha)$])
    $
    Note: $sigma$ p.s.d by $A 3$ i.e. density matrix on combined system\
    turns out to completely specify $cal(E)$.
    For any state $sn.ket(psi) = sum_j psi_j sn.ket(j_Q)$ on $Q$, set $sn.ket(accent(psi, tilde)) := sum_j psi_j^* sn.ket(j_R)$ on $R$:
    $
    arrow.r.squiggly sn.bra(accent(psi, tilde)|sigma|accent(psi, tilde)) =& sn.tek(accent(psi, tilde))sum_(i,j) #text(blue)[$sn.ket(i_r)$]#text(red)[$sn.tek(j_r)$] times.circle cal(E)(#text(blue)[$sn.ket(i_Q)$]#text(red)[$sn.tek(j_Q)$])sn.ket(accent(psi, tilde))\
    =& sum_(i,j) psi_i psi_j^* cal(E)(#text(blue)[$sn.ket(i_Q)$]#text(red)[$sn.tek(j_Q)$])\
    =& cal(E)(sn.ket(psi) sn.tek(psi))
    $
    Spectral decomposition $arrow.r.squiggly sigma = sum_k sn.ket(s_k) sn.tek(s_k)$ for some states $sn.ket(s_k)$ on combined system (eigenvalues absorbed into $sn.ket(s_k)$)
    can represent:
    $
    #text(orange)[$sn.ket(s_k) = sum_(j,j')^n s_(k,j,j')sn.ket(j_R)sn.ket(j'_Q)$].
    $ 
    For each $k$, define a linear map $E_k: Q arrow.r Q$ by
    $
    E_k sn.ket(j_Q) = sum_(j')^n s_(k,j,j')sn.ket(j'_Q)
    $
    Then
    $
    E_k sn.ket(psi) =& sum_(j,j'=1)^n psi_j s_(k,j,j')sn.ket(j'_Q)\
    =& sum_(j''=1)^n #text(orange)[$sum_(j,j'=1)^n$] psi_j'' #text(orange)[$s_(k,j,j')$] underbrace(sn.bra(j''_R|#text(orange)[$j_R$]), delta_(j'',j)) #text(orange)[$sn.ket(j'_Q)$]\
    =& sum_(j''=1)^n psi_j'' sn.bra(j''_R|#text(orange)[$s_k$])\
    =& sn.bra(accent(psi, tilde)|s_k)
    $
    $
    sum_k #text(purple)[$E_k sn.ket(psi)$] sn.tek(psi) E_k^dagger =& sum sn.bra(accent(psi, tilde)|s_k) sn.bra(s_k|accent(psi, tilde))\
    =& sn.bra(accent(psi, tilde)|\(underbrace(sum_k sn.ket(s_k) sn.tek(s_k), sigma)\)|accent(psi, tilde))\
    =& sn.bra(accent(psi, tilde)|sigma|accent(psi, tilde)) = cal(E)(sn.ket(psi)sn.tek(psi))
    $
    Holds for any arbitrary $sn.ket(psi) in Q attach(arrow.r.squiggly, t: A 2) cal(E)(rho) = sum_k E_k rho E_k^dagger$ for any denstiy matrix $rho$. $square$
])  
== Examples of quantum operations
- Bit flip channel: flips $sn.ket(0) arrow.bar sn.ket(1)$ with probability 1-p $p in [0,1]$
    $ 
    E_o = sqrt(p) I, E_1 = sqrt(1-p) X\
    cal(E)(rho) = sum_(k=0)^1 E_k rho E_k^dagger = p dot rho + (1-p)X rho X 
    $ 
- Phase flip (analogously): 
    $ 
    E_0 = sqrt(p)I, E_1 = sqrt(1-p)Z 
    $ 
- Depolarizing channel: replace $rho$ by completely mixed state $I/2$ with probability $p$:
    $ 
    cal(E)(rho) = p dot I/2 + (1-p)rho 
    $ 
    Block sphere representation: uniform contraction
- Amplitude damping (cf. exercise 13.1)
    $ 
    E_0 = mat(
        1, 0;
        0, sqrt(1-gamma)
    ), E_1 = mat(
        0, sqrt(gamma);
        0, 0
    ), E_1 sn.ket(1) = sqrt(gamma) sn.ket(0) $ 
    Interpretation: $sn.ket(1) arrow.bar sn.ket(0)$ with probability $gamma$.