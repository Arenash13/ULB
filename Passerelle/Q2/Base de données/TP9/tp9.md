# Ex 1

$$
\{u.NU, u.NomU, u.Ville | U(u)\}
$$

# Ex 2

$$
\{u.NU, u.NomU, u.Ville | U(u) \land u.Ville ='Londres'\}
$$

# Ex 3 

$$
\{l.NF | PUF(l) ∧ l.NU = 1 ∧ l.NP = 1\}
$$

# Ex 4

$$
\{p.NomP, p.Couleur | P(p) ∧ \exists f(PUF(f) \land f.NP = p.NP \land f.NF = 1)\}
$$

# Ex 5

$$
\{ f.NF | PUF(f) \land \exists p(P(p) \land f.NP = p.NP \land f.NU = 1 \land p.Couleur='Rouge')\}
$$

# Ex 6

$$
\{f.NomF | F(f) \land \exists l, p, u (PUF(l) \land P(p) \land U(u) \land f.NF = l.NF \land p.NP = l.NP \land u.NU = l.NU \land \\p.Couleur = 'Rouge' \land (u.Ville='Londres' \lor u.Ville = 'Paris')\}
$$

# Ex 7

$$
\{l.NP | PUF(l) \land \exists u, f (U(u) \land F(f) \land l.NU = u.NU \land l.NF = f.NF \land u.Ville = f.Ville\}
$$

# Ex 8

$$
\pi_{NP}(
	PUF
	*_{NF=NF \and NU=NU}
		(\sigma_{Ville=Londres}(F)
		*_{Ville=Ville}
		U)
)
$$

# Ex 17

$$
\{p.NP | P(p) \land \forall u \space (U(u) \land u.Ville = 'Londres' \rightarrow \exists l (PUF(l) \land p.NP = l.NP \land u.NU = l.NU))\}
$$

# Ex 20

$$
\{ u.NU | U(u) \land \forall p((PUF(p) \land u.NU = p.NU) \rightarrow  p.NF = 3)\}
$$

# 

