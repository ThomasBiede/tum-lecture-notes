#import "../snippets.typ" as sn
#import "../block_snippets.typ" as bs

= Mathematical formalisms: Constructing two qubit states

== Tensor product of vector spaces

Can combine two arbitrary vector spaces $V$ and $W$ to form the *tensor product* $V  times.circle W$

// TODO: write tensor product pdf handout

Generalization to n qubits: $2^n$ computational basis states

$
 {  sn.ket(underbrace(0\,dots 0, "length n")),  sn.ket(0\,dots 0\,1),  sn.ket(0\, dots 1\,0), sn.ket(0\, dots 1\,1),dots  sn.ket(1\,1 dots 1)}
$

Thus: general n-qubit quantum state, also denoted as _quantum register_, given by:

$
 sn.ket(psi) =  sum_(x_0 = 0)^1  sum_(x_1 = 0)^1 dots  sum_(x_(n-1) = 0)^1  alpha_(x_(n-1),dots x_1,x_0)  sn.ket(x_(n-1)\, dots x_1\,x_0) =  sum_(x = 0)^(2^n -1)  alpha_x  sn.ket(x)
$

with $ alpha  in bb(C)$ for all $x  in  ( 0,dots 2^n-1 )$, such that:

$
||psi||^2 =  sum_(x = 0)^(2^n -1) | alpha_x|^2  =^! 1  quad quad quad quad quad quad quad quad ( "normalization")
$

$arrow.r.squiggly$ in general "hard" to simulate on classical computer (for large n) due to this "_curse of dimensionality_". 

Vector space as tensor products:

$
  underbrace(bb(C)^2  times.circle dots  times.circle bb(C)^2, "n times") = (bb(C)^2)^( times.circle n)  tilde.eq bb(C)^((2^n))
$

== Multiple Qubit Gates (Nielsen 1.3.2, 1.3.4, 2.17)

As for single qubits, an operation on multiple qubits is described by a unitary matrix U.  
For $n$ qubits: $U  in bb(C)^(2^n x 2^n)$

=== Example: Controlled-NOT Gate (CNOT)

Two qubits control and target, target-qubit gets flipped if control is 1:

$
 sn.ket(underbrace(#text(orange)[0], #text(orange)[control]) overbrace(0, "target"))  arrow.r.long.bar  sn.ket(00),  sn.ket( #text(orange)[0] 1)  arrow.r.long.bar  sn.ket(01),  sn.ket( #text(orange)[1]0)  arrow.r.long.bar  sn.ket(1 #text(red)[1]) , sn.ket( #text(red)[1] 1)  arrow.r.long.bar  sn.ket(1 #text(red)[0])
$

Can be expressed as:

$
 sn.ket("ab")  arrow.r.long.bar  sn.ket(a\, underbrace(a  plus.circle b, "add. mod 2"))  quad quad quad quad  forall a,b  in  {0,1}
$

#bs.placeholder()

==== Matrix representation

$
U_("CNOT")=  mat(                                     
1, 0, 0, 0;              
0, 1, 0, 0;              
0, 0, 0, 1;              
0, 0, 1, 0;
)
$

#bs.placeholder()

Can generalize Pauli-X to any unitary operator $ #text(green)[U] in bb(C)^(2 times 2)$ acting on target qubit:

=== Example: Controlled-U Gate

$
 sn.ket(underbrace(#text(orange)[0], #text(orange)[control]) overbrace(0, "target"))  arrow.r.long.bar  sn.ket(00),  sn.ket(#text(orange)[0]1)  arrow.r.long.bar  sn.ket(01),  sn.ket( #text(orange)[1]0)  arrow.r.long.bar  sn.ket(1)  #text(blue)[$times.circle$] ( #text(green)[U] sn.ket(0)),  sn.ket( #text(orange)[1]1)  arrow.r.long.bar  sn.ket(1)  #text(blue)[$times.circle$] ( #text(green)[U] sn.ket(1))
$

#bs.placeholder()

=== Example: Controlled-Z Gate

#bs.placeholder()

=== Example: Controlled-U Gate for multiple target qubits

#bs.placeholder()

#bs.info([Single qubit and CNOT gates are universal: they can be used to implement an arbitrary unitrary operation on n qubits. (Quantum analogue of universality of classical NAND gate).])

==== Example: A circuit consisting only of single qubit gates and CNOTs

#bs.placeholder()

Operation on basis states: $a,b  in  ( 0,1 )$

$
underbrace(sn.ket("a"\,"b"), sn.ket(a)  #text(blue)[$times.circle$]  sn.ket(b))  arrow.r.long.bar ("A" sn.ket("a"))  #text(blue)[$times.circle$] ("B" sn.ket("b"))  #text(gray)[$= ("A"  times.circle "B")  sn.ket("a"\,"b")$]
$

==== Example: A = I (identity), B = Y

$
sn.ket(00) & arrow.r.long.bar  sn.ket(0)  times.circle  underbrace((Y sn.ket(0)), i sn.ket(1)) =  #text(purple)[i] sn.ket(01)\
sn.ket(01) & arrow.r.long.bar  sn.ket(0)  times.circle  underbrace((Y sn.ket(1)), -i sn.ket(0)) =  #text(green)[-i] sn.ket(00)\
sn.ket(10) & arrow.r.long.bar  sn.ket(1)  times.circle (Y sn.ket(0)) = i sn.ket(11)\
sn.ket(11) & arrow.r.long.bar  sn.ket(1)  times.circle (Y sn.ket(1)) = -i sn.ket(10)
$

#bs.placeholder()

Generalization to arbitrary number of tensor factors possible, e.g.:

#bs.placeholder()

== Basic Properties
#bs.info([
  1. $(A  times.circle B)^* = A^*  times.circle B^*$    (element-wise complex conjugation)
  2. $(A  times.circle B)^T = A^T  times.circle B^T$    (transposition)
  3. $(A  times.circle B)^ dagger = A^ dagger  times.circle B^ dagger$    (ad joint)
  4. $(A  times.circle B)  times.circle C = A  times.circle (B  times.circle C)$    (associative property)
  5. $(A  times.circle B)  dot (C  times.circle D) = (A  dot C)  times.circle (B  dot D)$    (for matrices with compatible dimensions) 
  #bs.placeholder()
  6. Kronecker product of Hermitian matrices is Hermitian
  7. Kronecker product of unitary matrices is unitary
])