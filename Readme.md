# Metode numerice - Tema 1

Enuntul proiectului se afla in fisierul numit "Tema1.pdf".

  Cerinta 1
-------------
  Pentru rezolvarea prin metoda iterativa am construit matricea stocastica
prin intermediul functiei auxiliare "buildM" pe care o voi explica mai jos.
Dupa obtinerea matricii stocastice, ma voi folosi de 2 vectori coloana de N
elemente, care reprezinta vectorul PageRank pe care dorim sa il calculam la
pasul curent, respectiv la pasul anterior. Pentru a afla vectorul la pasul k
, inmultim vectorul obtinut la pasul k - 1 cu matricea M_. Aceasta matrice
are o formula bine definita, si anume :
                  (d * M) + (((1 - d) / N) * ones(N, N))
, unde d reprezinta probabilitarea ca utilizatorul sa ramana pe internet iar M
este matricea stocastica. Apoi rulam algoritmul, facand iteratii pana cand
solutia de la pasul k, converge la o anumita valoare (cautam o precizie data
de parametrul epsilon). La final intoarcem ultima iteratie.

  Cerinta 2
------------
  Pentru rezolvarea prin metoda algebrica, vom construi din nou matricea
stocastica, apoi aflam vectorul PageRank dupa formula :
               PR_Inv(eye(N) - d * M) * (1-d) / N * ones(N, 1)
, folosind functia PR_Inv pentru a calcula inversa unei matrici. In cadrul
acestei functii calculam descompunerea QR a unei matrici date ca parametru, pe
care dorim sa o inversam. Apoi aflam inversa astfel :
                              A * A^(-1) = I
                            Q * R * A^(-1) = I
                     Q^(-1) * Q * R * A^(-1) = Q^(-1)
                   R * A^(-1) = Q^(-1) = Qt (Q transpus)
  Apoi rezolvam un sistem linear de ecuatii, in care matricea coeficientilor este
una superior triunghiulara. Aflam pe rand liniile matricei A^(-1), si incepem cu
elementul de pe linia N, pana la primul element de pe linie.

  ***functia buildM*** 
  
  In aceasta functie citim din fisierul de input numarul de pagini web si pentru
fiecare pagina, celelalte pagini la care aceasta are linkuri. Punem in matrice la
linia si coloana corespunzatoare 1 daca exista link de la o pagina la cealalta
(totusi ignoram linkurile spre aceeasi pagina). La final impartim fiecare linie la
numarul de elemente (linuri valide) pentru a o transforma intr-o matrice stocastica.

  Cerinta 3
-------------
  In functia PageRank vom citi din fisierul de input valorile val1 si val2, apoi
apelam functia "Apartenenta" pentru a afla valoarea functiei u. Aceasta trebuie
sa fie continua, asa ca limitele laterale trebuie sa fie egale :
                            0 = a * val1 + b
                            a * val2 + b = 1
, de unde deducem valorile lui a si b. Pentru a sorta descrescator elementele din
vectorul PageRank calculat prin metoda algebrica, folosim algoritmul Bubble sort,
si folosim un vector auxiliar pentru a retine pozia initiala a elementului.

***Resurse :***
- https://en.wikipedia.org/wiki/PageRank
- Eastern-European Journal of Enterprise Technologies, "An algebraic method for
calculating PageRank" (V. Vlasyuk, O. Galchonkov, A. Nevrev)
- Algoritmii folositi care nu au fost explicati au fost luati din materialele de
curs / laborator primite la clasa
