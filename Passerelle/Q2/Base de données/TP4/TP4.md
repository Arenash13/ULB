# Ex1

$$
\pi NU,NomU,Ville (U)
$$

# Ex2

$$
\sigma Ville = Londres (U)
$$

# Ex3

$$
\pi NF(\sigma NU=1,NP=1(PUF))
$$

# Ex4

$$
\pi _{couleur,NomP} ( \sigma _{NF=1} (PUF *_{NP=NP} P))
$$

# Ex5

$$
\pi_{NP}(
	\sigma_{Couleur=Rouge}(P)
	*_{NP=NP}
    \sigma_{NU=1}(PUF)))
$$

# Ex6

$$
\pi_{NomF}(
	\sigma_{Ville=Londre\or Ville=Paris}(U) *_{NP=NP} PUF)
	*_{NU=NU}
	\sigma_{Couleur=Rouge}(P)
	
)
$$

# Ex7

$$
\pi_{NP}(
	PUF
	*_{NF=NF \and NU=NU}
		(U
		*_{Ville=Ville}
		F)
)
$$

# Ex8

$$
\pi_{NP}(
	PUF
	*_{NF=NF \and NU=NU}
		(\sigma_{Ville=Londres}(F)
		*_{Ville=Ville}
		U)
)
$$

# Ex9

$$
\pi_{NU}(
	F
	*_{Ville!=Ville}
	U
)
$$

# Ex10

$$
\pi_{NF}(
	\sigma_{NU=1}(PUF)
	\and_{NU=2}
	PUF
)
$$

# EX11

$$
\pi_{NU}(
	\sigma_{NF=3}(PUF)
	
)
$$

