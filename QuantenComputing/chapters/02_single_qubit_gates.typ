#import "../snippets.typ" as snip
= Single qubit gates (Nielsen 1.2.1, 2.1.8, 4.2)

== Principle of time evolution

#snip.info(eval("The quantum state $snip.ket(psi)$ at the current time point $t$ transitions to a new quantum state $#snip.ket(psi)$ at a later time point $t > t$", mode: "markup"))

// The transition is described by a complex unary matrix $U$ which also preserves the normalization:

// $$
// \vert \psi \rangle = U \cdot \vert \psi \rangle
// $$

// TODO: insert circuit notation here

// <aside>
// ⚠️

// The circuit notation is read from **left to right** but the *normal* notation ($U \cdot \vert \psi \rangle$) from **right to left**

// </aside>

// == Examples of quantum gates

// === Pauli-X-Gate

// The *X-Gate* is the quantum gate equivalent of the *regular* **NOT-Gate**; it flips $\vert 0  \rangle \leftrightarrow \vert 1 \rangle$

// $$
// X \equiv \sigma_1 = \begin{pmatrix} 0&1\\1&0\\ \end{pmatrix}
// $$

// === Pauli-Y-Gate

// $$
// Y \equiv \sigma_2 = \begin{pmatrix*}[r] 0&-i\\i&0\\ \end{pmatrix*}
// $$

// === Pauli-Z-Gate

// $$
// Z \equiv \sigma_3 \equiv \begin{pmatrix*}[r] 1&0\\0&-1\\ \end{pmatrix*}
// $$

// The **Z-Gate** leaves $\vert 0  \rangle$ unchanged but flips the sign of the coefficient of $\vert 1 \rangle$

// $$
// Z \ket{\psi} = cos\left(\frac{\theta}{2}\right) \ket{0} \textbf{\textcolor{red}{ - }} e^{i\phi} sin\left(\frac{\theta}{2}\right)\ket{1}
//     = cos\left(\frac{\theta}{2}\right) \ket{0} + e^{i(\phi + \pi)}sin\left(\frac{\theta}{2}\right)\ket{1}
// $$

// this leads to the new *Bloch-Sphere* angle $\theta ‘ = \theta$, $\phi ‘ = \phi + \pi$

// <aside>
// ℹ️

// The gates are respectively a $180^\circ$ rotation around the axis (The Z-Gate rotates around the Z-Axis and so on).

// </aside>

// **X, Y, Z-Gates** are called *Pauli-Matrices*. The *Pauli-Vector* $\vec{\sigma} = \left( \sigma_1, \sigma_2, \sigma_3 \right) = \left( X, Y, Z \right)$ is a vector of 2x2-Matrices

// === Hadamad-Gate

// $$
// H = \frac{1}{\sqrt{2}} \begin{pmatrix*}[r]1&1\\1&-1\\ \end{pmatrix*}
// $$

// $$
// H \cdot \ket{\psi} = \frac{1}{\sqrt{2}} \begin{pmatrix} 1&1\\1&-1\\ \end{pmatrix} \cdot \begin{pmatrix} \alpha\\ \beta\\ \end{pmatrix} = \alpha \underbrace{\frac{\ket{0} + \ket{1}}{\sqrt{2}}}_{\text{Base change}} + \beta \underbrace{\frac{\ket{0} - \ket{1}}{\sqrt{2}}}_{\text{Base change}}
// $$

// TODO: insert circuit notation here

// === Phase-Gate

// $$
// S = \begin{pmatrix} 1&0\\0&i\\ \end{pmatrix}
// $$

// === T-Gate

// $$
// T = \begin{pmatrix} 1&0\\0&\textcolor{red}{e^{\frac{i\pi}{4}}}\\ \end{pmatrix}
// $$

// <aside>
// ℹ️

// $T^2 = S \left(\text{ since } e^{(i\pi/4)^2} = e^{i\pi/2} = i\right)$

// </aside>

// === Pauli-Matrices Properties

// $$
// \begin{align}
// \sigma_j^{2} = I \quad(\text{identity}) \qquad \forall j\\
// \sigma_j \sigma_k = - \sigma_j \sigma_k \qquad \forall j,k \quad j\neq k\\

// \begin{split}
// \textcolor{blue}{[}\sigma_j, \sigma_k\textcolor{blue}{]} &= \sigma_j\sigma_k - \sigma_k\sigma_j\\ 
// &= 2i\sigma_l \quad \forall(j,k.l) \in (1\,2\,3) \\ [Y,Z] &= 2i\cdot X
// \end{split}
// \end{align}
// $$

// TODO: insert handout stuff here

// === X-Y-Decomposition of an arbitrary 2x2 unitary matrix

// For any unitary matrix $U \in \mathbb{C}^{2\times2}$ there $\exists \alpha, \beta, \gamma, \delta \in \mathbb{R}$ s.t.:

// $$
// U=e^{i\alpha}\underbrace{\begin{pmatrix}e^{-i\beta/2}& 0\\0&e^{i\beta/2}\end{pmatrix}}_{R_z(\beta)}\underbrace{\begin{pmatrix}\cos{(\frac{\gamma}{2})}& -\sin{(\frac{\gamma}{2})}\\\sin{(\frac{\gamma}{2})}&\cos{(\frac{\gamma}{2})}\end{pmatrix}}_{R_y(\gamma)}\underbrace{\begin{pmatrix}e^{-i\delta/2}& 0\\0&e^{i\delta/2}\end{pmatrix}}_{R_z(\delta)}
// $$

// = Multiple Qubit (Nielsen 1.2.1, 2.1.7)

// For *two* qubits the states generalize to:

// $$
// \left\{ \ket{00},\ket{01},\ket{10},\ket{11} \right\}
// $$

// as computation basis state, in general all possible combinations of bit strings of 0’s and 1’s of length $n$ for $n$ bit qubits.

// == General two qubit state

// $$
// \begin{align*}
// \ket{\psi} &= \alpha_{00}\ket{00}+\alpha_{01}\ket{01}+\alpha_{10}\ket{10}+\alpha_{11}\ket{11}\\
// &= \sum_{i_1}\dots \sum_{i_n} \alpha_{i_1,\dots,i_n}\ket{i_1\dots i_n}
// \end{align*}\\
// \alpha\text{'s} \in \mathbb{C} \text{ and } \sum \vert \alpha\text{'s}\vert^2 = 1
// $$

// Can identify the basis states with unit vectors:

// $$
// \ket{00}=\begin{pmatrix}1\\0\\0\\0\\\end{pmatrix},\ket{01}=\begin{pmatrix}0\\1\\0\\0\\\end{pmatrix},\ket{10}=\begin{pmatrix}0\\0\\1\\0\\\end{pmatrix},\ket{11}=\begin{pmatrix}0\\0\\0\\1\\\end{pmatrix}
// $$

// thus:

// $$
// \ket{\psi} = \begin{pmatrix}\alpha_{00}\\\alpha_{01}\\\alpha_{10}\\\alpha_{11}\\\end{pmatrix} \in\mathbb{C}^{4}
// $$

// <aside>
// ℹ️

// **What happens if we measure one qubit of a two qubit state?**
// Say we measure the first qubit then we obtain the following:

// - $0$ with probability $|\alpha_{00}|^{2} + |\alpha_{01}|^{2}$
// - $1$ with probability $|\alpha_{10}|^{2} + |\alpha_{11}|^{2}$

// The wave function directly after the measurement will be:

// - $0:\ket{\psi'} = \frac{\alpha_{00} \ket{00} +\alpha_{01} \ket{01}}{\sqrt{|\alpha_{00}|^{2} + |\alpha_{01}|^{2}}}$
// - $1:\ket{\psi'} = \frac{\alpha_{10} \ket{10} +\alpha_{11} \ket{11}}{\sqrt{|\alpha_{10}|^{2} + |\alpha_{11}|^{2}}}$
// </aside>