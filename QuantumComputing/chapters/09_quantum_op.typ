#import "../snippets.typ" as sn
#import "../block_snippets.typ" as bs

= Quantum operations
== Motivation and overview
In general: changes of quantum states are effected by unitary time evolution or by wave function collapse during measurements. Quantum operations (also called "quantum channels") are a (mathematical) generalization and unification of these concepts.\
Abstractly:  $ rho' = cal(E)(rho) $ 
where $rho$ is the density matrix and $cal(E)$ is a quantum operation.\
Special cases:\
    - unitary time evolution $cal(E)(rho) = U rho U^dagger$
    - measurement, with measurement operator ${M m}$:\
        recall that $underbrace(p(m), "probability for outcome" m) = tr[M m^dagger M m rho]$\
        State after obtaining result m:\
     $ rho_m = (M m rho M m^dagger)/(tr[M m^dagger M m rho]) = (M m rho M m^dagger)/(p(m)) $ 
Corresponding quantum channel (without re-normalization): $ cal(E)_m(rho) = M m rho M m^dagger $ 
$p(m) = tr[cal(E)_m(rho)]$ is the probability that outcome m occurs.\
Consider the scenario of performing a measurement, but not recording the outcome:\
$arrow.r.squiggly$ density matrix after this process is weighted  sum over all possible outcomes:
     $ cal(E)(rho) = sum_m p(m) times #text(blue)[$rho_m$] = sum_m cal(E)_m(rho) = underbrace(sum_m M m rho M m^dagger)_(#text(gray)[operator-sum representation of $cal(E)$]) $ 

Different (but equivalent) perspectives on quantum operations: 
    - system coupled to environment (Stinespring dilation)
    - operator-sum (Kraus) representation
    - physically motivated axioms
    - Choi matrix representation

== Environments and quantum operations
"Open" quantum system can be regarded as interaction between a
    - principle quantum system (initially in state $rho$)
    - environment (initially in state $rho_("enf")$)
The principle system interacts with the environment, i.e. a time evolution of the overall system described by some unitary U:\
Circuit diagram: 

$quad quad quad quad$ mathematical representation: $U(rho times.circle rho_("enf"))U^+$\

Output is the reduced density matrix of the principle system:\
$cal(E) (rho) = tr_("enf")[U(rho times.circle rho_("enf")) U^+]$

Example:\
Represents $rho = mat(
    rho_(00), rho_(01);
    rho_(10), rho_(11)) = rho_(00)sn.ket(0)sn.tek(0) + rho_(01)sn.ket(0)sn.tek(1) + rho_(10)sn.ket(1)sn.tek(0) + rho_(11)sn.ket(1)sn.tek(1)$, \then\
$U_("CNOT") (rho times.circle sn.ket(0)sn.tek(0))U_("CNOT")^dagger = U_("CNOT")(rho_(00)sn.ket(00)sn.tek(00) + rho_(01)sn.ket(00)sn.tek(10) + rho_(10)sn.ket(10)sn.tek(00) + rho_(11)sn.ket(10)sn.tek(10)) U_("CNOT")^dagger = $\
$= rho_(00)sn.ket(00)sn.tek(00) + rho_(01)sn.ket(00)sn.tek(1#text(red)[1]) + rho_(10)sn.ket(1#text(red)[1])sn.tek(00) + rho_(11)sn.ket(1#text(red)[1])sn.tek(1#text(red)[1])$\
$tr_("env")[dots] = rho_(00)sn.ket(0)sn.tek(0) underbrace(sn.bra(0|0))_(1) + rho_(01)sn.ket(0)sn.tek(0)underbrace(sn.bra(0|1))_(0) + rho_(10)sn.ket(1)sn.tek(0)underbrace(sn.bra(1|0))_(0) + rho_(11)sn.ket(1)sn.tek(1) underbrace(sn.bra(1|1))_(1) =$\ 
$ =rho_(00)sn.ket(0)sn.tek(0) + rho_(11)sn.ket(1)sn.tek(1) = mat(
    rho_(00), 0;
    0, rho_(11)
)$\
$ = P_0 rho P_0 + P_1 rho P_1 $ with $P_0 = sn.ket(0)sn.tek(0)$, $P_1 = sn.ket(1)sn.tek(1)$\
(off-diagonal entries of $rho$ are set to zero)

== Operator-sum representation
Let ${sn.ket(e_K)}$ be an orthonormal basis of the environment quantum system, assume w.l.o.g. $rho_("env") = sn.ket(e_0)sn.tek(e_0)$ (see tut. 12: if environment is in a mixed state, then can equivalently work with a pure state in a larger environment)\
 $ arrow.r.squiggly cal(E)(rho) = tr_("env") = [U(rho times.circle sn.ket(e_0)sn.tek(e_0))U^dagger] = sum_K tr_("env") [U(rho times.circle sn.ket(e_0)sn.tek(e_0))U^dagger dot (I times.circle sn.ket(e_K)sn.tek(e_K))] $  $  = sum_K sn.bra(e_K| U dot (rho times.circle sn.ket(e_0)sn.tek(e_0))U^dagger | e_K) = sum_K #text(blue)[$E_K$] rho #text(blue)[$E_K^dagger$] $  with $#text(blue)[$E_K$]$ complex matrix with entries$(#text(blue)[$E_K$])_("lm") = sn.tek(l\,e_K) U sn.ket(m\,e_0) equiv sn.tek(l) sn.tek(e_K) U sn.ket(M) sn.ket(e_0) equiv (sn.tek(l) times.circle sn.tek(e_K)) U (sn.ket("lm") times.circle sn.ket(e_0))$\
The $E_K$'s are called #underline("operation elements") or #underline("Kraus operators") of $cal(E):$
 $ cal(E)(rho) = sum_K E_K rho E_K^dagger $ 
Revisit example:\
$ <="ft". 
(E_0)_("lm") = sn.tek(l\,0) U_("CNOT") sn.ket(m\,0) arrow.r.squiggly E_0 = mat(
    1, 0;
    0, 0
) = P_0\
(E_1)_("lm") = sn.tek(l\,1) U_("CNOT") sn.ket(m\,0) arrow.r.squiggly E_0 = mat(
    0, 0;
    0, 1
) = P_1
$ agrees with previous derivations\
*Completeness relation of Kraus operators:*\
If $cal(E)$ is trace-preserving, then for any density matrix $rho$:
 $ 1 =^! tr[cal(E)(rho)] = tr[sum_K E_K rho E_K^dagger] = sum_K tr[E_K rho E_K^dagger] = sum_K tr[E_K^dagger E_K rho] = tr[(sum_K E_K^dagger E_K) dot rho] $ 
should hold for arbitrary $rho$ with $tr[rho] = 1 arrow.r.squiggly $
 $ #text(blue)[$sum_K E_K^dagger E_K = I$] $ 
We allow for quantum operations with $sum_K E_K^dagger E_K #text(blue)[$<=$] I $ (\small(see $E_m$ for measurement example))\
"A $<=$ B" if B - A is positive semidefinite (p.s.d.)\
A $in bb(C)^(n times n)$ is called #underline("positive semidefinite") if A is Hermition and $underbrace(sn.bra(v|A|v) >= 0 )_(arrow.long.l "all eigenvalues of" A "are" >= 0)$ for all $v in bb(C)^n$\
$sum_K E_K^dagger E_K accent(<=, !) I$ stems from the requirement that $tr[cal(E)(rho)] accent(<=, !) 1$\

Remark: #underline("Physical interpretation") as measurement performed on environment with respect to ${ sn.ket(e_K)}$ basis; i.e. measurement operators $sn.ket(e_K)sn.tek(e_K)$:\
For outcome k, state of principle system is 
 $ rho_k "\propto" tr_("env")[underbrace(sn.ket(e_K)sn.tek(e_K))_(#text(gray)[$M_K$]) U(rho times.circle sn.ket(e_0)sn.tek(e_0)) U^dagger underbrace(sn.ket(e_K)sn.tek(e_K))_(#text(gray)[$M_K^dagger$])] =  $ 
i.e. $E_K$'s play the role of the measurement operators on principle systems.

#underline("System-environment model of a Kraus representation").\
Given trace-preserving $cal(E)(rho) = sum_(k=0)^(n-1) E_K rho E_K^dagger$ is there ea corresponding system environment representation?\
Yes: Define model environment as vector space of dimension #text(blue)[n], with orthonormal basis ${sn.ket(e_k)}_(k=0,..,n-1)$, assume that environment starts in $sn.ket(e_0)$ state.\
Define unitary U via $sn.ket(psi) sn.ket(e_0) = sum_K E_K sn.ket(psi) sn.ket(e_K)$ and #text(blue)[matrix extension] to a unitary operator on combined system.\
This is possible since for any principle quantum states $sn.ket(psi), sn.ket(phi)$:
 $ sn.tek(psi) sn.tek(e_0) U^dagger U sn.ket(phi) sn.ket(e_0) = sum_(k,k') sn.tek(psi) E_k^dagger E_(k') sn.tek(phi) underbrace(sn.bra(e_k|e_(k')))_(delta_(k,k')) = sn.tek(psi) underbrace(sum_k E_k^dagger E_k)_(= I \#text( ("compl. relation")))sn.ket(phi) = sn.bra(psi|phi) quad quad arrow.r.squiggly "U preserves orthogonality" $ 
U has the desired property since
 $ tr_("env") [U ( rho times.circle sn.ket(e_o)sn.tek(e_0)) U^dagger] = sum_(k,k') tr_("env") [(E_k rho E_(k')^dagger ) times.circle sn.ket(e_k)sn.tek(e_(k'))] = sum_(k,k') E_k rho E_(k') underbrace(sn.bra(e_k|e_(k')))_(delta_(k,k')) = sum_k E_k rho E_k^dagger $ 

== Axiomatic approach to quantum operations
Alternative viewpoint: physical motivated axioms which a quantum operation $cal(E)$ must obey:

    -[*A1:*] $tr[cal(E)(rho)]$ is probability that the process $cal(E)$ occur, thus  $ 0 <= tr[cal(E)(p)] <= 1 $  for all density matrices $rho$.
    -[*A2:*] $cal(E)$ is convex-linear:  $ cal(E) (sum_i p_i rho_i) = sum_i p_i cal(E)(rho_i) "for any probability vector p and density matrices" {rho_i} $ 
    -[*A3:*] $cal(E)$ is a #underline("completely positive") map:\
    $cal(E)(A)$ must be positive semidefinite (p.s.d.) for any p.s.d. matrix A.\
    Moreover, when enlarging the principle quantum system Q by another quantum system R, then\
    $(underbrace(I)_("on R") times.circle underbrace(cal(E))_("on Q")) (A)$ must be p.s.d. for any p.s.d. matrix A on combined system RQ 
#text(blue)[Theorem: The map $cal(E)$ satisfies A1, A2, A3 if and only if  $ 
cal(E)(rho) = sum_k E_K rho E_k^dagger $ 
for some set of complex matrices ${E_k}$ with $sum_k E_k^dagger E_k <= I$]
Sketch of proof:
    -[$arrow.l$]: to verify A3: Let A be a p.s.d. matrix on enlarged system RQ, then, for any vector $sn.ket(psi)$ on the RQ:
    //  $ #sn.tek(psi) (
//     rel(op(I)\limits_(\substack(\uparrow\
//  \hbox to 0pt(\hss$\scriptstyle 
// \#text(Identify map on R)$\hss))))
//     times.circle cal(E))(A) sn.ket(psi) = sum_k sn.tek(psi) (
//     rel(op(I)\limits_(\substack(\uparrow\
//  \hbox to 0pt(\hss$\scriptstyle n times n \#text( matrix)$\hss))))
//     times.circle E_k)A(underbrace(I times.circle E_k^dagger) sn.ket(psi))_(=:sn.ket(phi_k)) = sum_k underbrace(sn.tek(phi_k) A sn.ket(phi_k))_(>= 0 \#text( since A is p.s.d)) >= 0 quad quad #text(green)(\surd) $ 

//     -["$arrow.r$"] Principle system (which $cal(E)$ acts on) denoted Q, dimension n.\
//     Introduce another qunatum system, labelled R, with same dimension as Q.\
//     Let ${ sn.ket(j_Q): j = 1,dots.n}$ an orthonormal basis of Q 
//     ${ sn.ket(j_R): j = 1,dots.n}$ an orthonormal basis of R
//     Define the "maximally entangled state" (c.f. ex. 12.1)
//      $ sn.ket(alpha) := sum_(j=1)^n sn.ket(j_r)sn.ket(j_Q) quad in RQ quad \#text(and) $ 
//      $ rel(op(sigma)\limits_(\substack(\uparrow\
//  \hbox to 0pt(\hss$\scriptstyle \#text(#underline(Choi matrix))$\hss)))) := (I times.circle cal(E))(#text(blue)(sn.ket(alpha)) #text(magenta)(sn.tek(alpha))) quad quad \#text(p.s.d by A3 i.e. density matrix on combined system) $ 
//  turns out to completely specify $cal(E)$\
//  For any state $sn.ket(psi) = sum_j psi_j sn.ket(j_Q)$ on Q, set\
//  $sn.ket(\widetilde(psi)) := sum_j psi_j^* sn.ket(j_R)$ on R $arrow.r.squiggly$
//   $ sn.tek(\widetilde(psi)) sigma  rel(op( )\limits_(\substack(\uparrow\
//  \hbox to 0pt(\hss$\scriptstyle \#text(inner product on R)$\hss))))sn.ket(\widetilde(psi)) = sn.tek(\widetilde(psi)) sum_(i,j) #text(blue)(sn.ket(i_r)) #text(magenta)(sn.tek(j_R)) times.circle cal(E) (#text(blue)(sn.ket(i_Q)) #text(magenta)(sn.tek(j_Q))) sn.ket(\widetilde(psi)) = sum_(i,j) = psi_i psi_j^* cal(E) (sn.ket(i_Q)sn.tek(j_Q)) = cal(E) (sn.ket(psi)sn.tek(psi)) quad quad #text(orange)((*)) $ 
//  Spectral decomposition $arrow.r.squiggly sigma = sum_k sn.ket(s_k) sn.tek(s_k) $ for some states $sn.ket(s_k)$ on combined system {eigenvalues absorbed into $sn.ket(s_k)$) #text(lightgray)($(sigma = sum_k lambda_k sn.ket(phi_k) sn.tek(phi_k); sn.ket(s_k): sqrt(lambda_k) sn.ket(phi_k))$)\
//  Can represent  $ #text(orange)(sn.ket(s_k) = sum_(j, j'=1)^n s_(#text(black)(rel(op(#text(orange)(k,j,j'))\limits_(\substack(\uparrow\
//  \hbox to 0pt(\hss$\scriptstyle \#text(coefficients)$\hss)))))) sn.ket(j_R) sn.ket(j'_Q)) $ 
//  For each k, define a linear map $E_k: Q arrow.r Q$ by
//   $ E_k sn.ket(j_Q) = sum_(j'=1)^n s_(k,j,j') sn.ket(j'_Q) quad quad \#text(and linear extension) $ 
//  Then
//   $ #text(violet)(E_k) sn.ket(psi) = sum_(j,j'=1)^n psi_j s_(k,j,j') sn.ket(j'_Q) = sum_(j''=1)^n #text(orange)(sum_(j,j'=1)^n) psi_(j'') #text(orange)(s_(k,j,j')) underbrace(sn.bra(j''_R|#text(orange)(j_R)))_(delta_(j'',j)) #text(orange)(sn.ket(j'_Q)) = sum_(j''=1)^n psi_(j'') sn.bra(j''_R #text(orange)(|s_k)) = sn.bra(\widetilde(psi) rel(op(|)\limits_(\substack(\uparrow\
//  \hbox to 0pt(\hss$\scriptstyle \#text(inner product on R)$\hss))))s_k) $ 
//   $ sum_k #text(violet)(E_k sn.ket(psi)) sn.tek(psi) E_k^dagger = sum sn.bra(\widetilde(psi) | s_k) sn.bra(s_k|\widetilde(psi)) = sn.tek(\widetilde(psi)) (underbrace(sum_k sn.ket(s_k) sn.tek(s_k))_sigma )sn.ket(\widetilde(psi)) = sn.tek(\widetilde(psi)) sigma sn.ket(\widetilde(psi)) \stackrel(#text(orange)((*))) (=) cal(E)(sn.ket(psi)sn.tek(psi)) $ 
//  Holds for any arbitrary $sn.ket(psi) in Q \stackrel(A2)(arrow.r.squiggly) cal(E)(rho) = sum_k E_k rho E_k^dagger$ for any denstiy matrix $rho$. $\square$  


// \subsection(Examples of quantum operations)

//     - Bit flip channel: flips $sn.ket(0) \mapsto sn.ket(1)$ with probability 1-p $p in [0,1]$
//      $ E_o = sqrt(p) I, E_1 = sqrt(1-p) X $ 
//      $ cal(E)(rho) = sum_(k=0)^1 E_k rho E_k^dagger = p dot rho + (1-p)X rho X $ 
//     - Phase flip (analogously): 
//      $ E_0 = sqrt(p)I, E_1 = sqrt(1-p)Z $ 
//     - Depolarizing channel: replace $rho$ by completely mixed state $\frac(I)(2)$ with probability p:
//      $ cal(E)(rho) = p dot \frac(I)(2) + (1-p)rho $ 
//     Block sphere representation: uniform contraction
//     - Amplitude damping (cf. exercise 13.1)
//      $ E_0 = \begin(pmatrix)
//         1 & 0\
//         0 & sqrt(1-gaM ma)
//     \end(pmatrix), E_1 = \begin(pmatrix)
//         0 & sqrt(gaM ma)\
//         0 & 0
//     \end(pmatrix), E_1 sn.ket(1) = sqrt(gaM ma) sn.ket(0) $ 
//     Interpretation: $sn.ket(1) \mapsto sn.ket(0)$ with probability $gaM ma$.