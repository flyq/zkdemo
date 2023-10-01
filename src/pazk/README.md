# Proofs, Arguments and Zero Knowledge

- [Proofs, Arguments and Zero Knowledge](#proofs-arguments-and-zero-knowledge)
  - [Abtract](#abtract)
  - [Chapter 1 Introduction](#chapter-1-introduction)
    - [1.1 Mathematical Proofs](#11-mathematical-proofs)
    - [1.2 What kinds of non-traditional proofs will we study?](#12-what-kinds-of-non-traditional-proofs-will-we-study)

## Abtract
Interactive proofs(IPs) and arguments are cryptographic protocols that enable an untrusted prover to provide a guarantee that it performed a requested computation correctly.

IPs allow for interaction between prover and verifier, as well as a tiny but nonzero probability that an invalid proof passes verification. Arguments(But not IPs) even permit there to be "proofs" of false statements, so long as those "proofs" require exorbitant computational power to find.

**IP = PSPACE**

**MIP = NEXP**

Any argument can in principle be transformed into one that is *zero-knowledge*, which means that proofs reveal no information other than their own validity.

There are now no fewer than five promising approaches to designing efficient, general-purpose zero-knowledge arguments.

## Chapter 1 Introduction
A particular goal of this survey is to describe a variety of approaches to constructing so-called zero- knowledge Succinct Non-interactive Arguments of Knowledge, or zk-SNARKs for short. "Succinct" means that the proofs are short. "Non-interactive" means that the proof is static, consisting of a single message from the prover. "Of Knowledge" roughly means that the protocol establishes not only that a statement is true, but also that the prover knows a "witness" to the veracity of the statement. Argument systems satisfying all of these properties have a myriad of applications throughout cryptography.

Even though implementations of general-purpose VC protocols remain somewhat costly (especially for the prover), paying this cost can often be justified if the VC protocol is zero-knowledge, since zero- knowledge protocols enable applications that may be totally impossible without them.

Argument systems are typically developed in a two-step process. First, an information-theoretically secure protocol, such as an IP, multi-prover interactive proof (MIP), or probabilistically checkable proof (PCP), is developed for a model involving one or more provers that are assumed to behave in some restricted manner (e.g., in an MIP, the provers are assumed not to send information to each other about the challenges they receive from the verifier). Second, the information-theoretically secure protocol is combined with cryptography to "force" a (single) prover to behave in the restricted manner, thereby yielding an argument system. This second step also often endows the resulting argument system with important properties, such as zero-knowledge, succinctness, and non-interactivity. If the resulting argument satisfies all of these properties, then it is in fact a zk-SNARK.


* IPs
* MIPs
* PCPs or *interactive oracle proofs*(IOPs), which is a hybrid between an IP and a PCP
* *linear* PCPs

IPs, MIPs, and PCPs/IOPs + *polynomial commitment scheme* => succinct interactive arguments 

succinct interactive arguments + *Fiat-Shamir transformation* => SNARK

linear PCPs + ?(polynomial commitment schemes)

### 1.1 Mathematical Proofs

Traditionally, a mathematical proof is something that can be written and checked line-by-line for correct- ness.

* Proof: anything that convinces someone that a statement is true
* "Proof system": any procedure that decides what is and is not a convincing proof.
* proof system is specified by a verification procedure that takes as input any statement and a claimed "proof" that the statement is true, and decides whether or not the proof is valid.

* *completeness*: Any true statement should have a convincing proof of its validity. 对的错不了
* *soundness*: No false statement should have a convincing proof. 错的对不了
* Ideally, the verification procedure will be *efficient*. Roughly, this means that simple statements should have short (convincing) proofs that can be checked quickly.
* Ideally, proving should be efficient too. Roughly, this means that simple statements should have short (convincing) proofs that can be found quickly.

### 1.2 What kinds of non-traditional proofs will we study?

probabilistic in nature.

