#import "../snippets.typ" as sn
#import "../block_snippets.typ" as bs
#import "@preview/ilm:1.3.1": *

= Qubit (Nielsen 2.1)

== Classical Bit

States represented as 0 or 1

== Quantum Bit

State is represented as a superposition of 0 and 1.

A qubit state $sn.ket(psi)$ (”cat psi”) is described as the following:

$ sn.ket(psi) = alpha dot sn.ket(0) + beta dot sn.ket(1) quad alpha, beta in bb(C) \ "and" quad |alpha|^2 + |beta|^2 = 1 $

Further $sn.ket(psi) in bb(C)^2$ can be represented as a column vector where:

$
sn.ket(0) = mat(1; 0) quad 
sn.ket(1) = mat(0; 1) quad
sn.ket(psi) = mat(alpha;beta)
$

Contrary to *classical* bits, qubits cannot be observed/measured in general

_standard_ measurement will result in classical bit $0$ with probability $|alpha|^2$and $1$ with $|beta|^2$. The measurement also changes the qubit (*Wave Function Collapse*)

=== Wave Function Collapse

if the qubit’s state is measured to be $0$ then it will be $0$ directly after the measurement: $ sn.ket(psi) = sn.ket(0) $ (same for $1$)

#bs.info([*In practice*: one can only estimate the probability $|alpha|^2$, $|beta|^2$ experimental by repeating the same experiment (_trial_ or _shot_)])
== Circuit Notation

#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    align: (horizon, horizon),
    image("../assets/images/Circuit_notation_1.png", width: 80%),
    image("../assets/images/Circuit_notation_2.png", width: 80%),
  ),
  caption: [Example of two circuit notations]
)<fig:cn_ex>

=== What is a qubit physically? $(sn.ket(0), sn.ket(1))$

- two different polarization of a photon, e.g.  /, circular
- alignment of a nuclear or $e^-$-spin, e.g. $arrow.t, arrow.b$
- ground state or excited state
- clockwise or counter-clockwise loop currents states in a Joseph junction (*superconducting qubit*)

== Bloch Sphere Representation
if $alpha$ and $beta$ happen to be $bb(R)$ then there exits an angle $theta in bb(R)$ such that:

$ alpha = cos ( theta/2) quad beta = sin(theta/2)
\
|alpha|^2 + |beta|^2 = cos ( theta/2)^2 + sin(theta/2)^2 $

#figure(
  image("../assets/images/unit_circle_complex.png", width: 40%),
  caption: [Complex plane unit circle]
) <fig:complex_uc>

In general ($bb(C)$):

$ &alpha = e^(i dot gamma)( theta/2) quad beta = e^(i dot (gamma + phi)) sin (theta/2) \ \
sn.ket(psi) &= e^(i dot gamma)cos ( theta/2) dot sn.ket(0) + e^(i dot (gamma + phi))sin (theta/2) dot sn.ket(1) \
&= e^(i dot gamma) (cos ( theta/2) dot sn.ket(0) + e^(i dot phi)sin (theta/2) dot sn.ket(1) ) $

Thus $sn.ket(psi)$ is characterized by $theta$ and $phi$

#figure(
  image("../assets/images/bloch_sphere.png", width: 40%),
  caption: [Bloch sphere representation]
) <fig:bloch_sphere>