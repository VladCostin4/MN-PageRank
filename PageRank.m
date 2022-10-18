function [R1 R2] = PageRank(nume, d, eps)
	[fin, err] = fopen(nume, "r"); # deschidem fisierul de input

	if fin == -1 # verificam daca a fost deschis cu succes
		disp(err);
	endif

	N = fscanf(fin, "%d", 1); # citim numarul de pagini web

	fseek(fin, -12, SEEK_END);	 # mergem la finalul fisierului
														 	 # de input pentru a citi cele
	val1 = fscanf(fin, "%f", 1); # 2 valori de care ne vom
	val2 = fscanf(fin, "%f", 1); # folosi la cerinta 3

	fclose(fin);

	R1 = Iterative(nume, d, eps); # calculam vectorul PR prin
																# metoda iterativa
	R2 = Algebraic(nume, d); # calculam vectorul PR prin metoda
													 # algebrica
  S = SortAlg(R2); # sortam vectorul obtinut la cerinta 2

	output = strcat(nume,'.out'); # generam numele fisierului
																# de output
	[fout, err] = fopen(output, "w"); # deschidem fisierul de output

	if fout == -1 # verificam daca a fost deschis cu succes
		disp(err);
	endif

	fprintf(fout, "%d\n", N);    #
	fprintf(fout, "%.6f\n", R1); #
	fprintf(fout, "\n");				 # afisam rezultatele obtinute la
	fprintf(fout, "%.6f\n", R2); # cerintele 1 si 2
	fprintf(fout, "\n");         #
	
	for i = 1:N # afisam rezultatele obtinute la cerinta 3
		fprintf(fout, "%d %d %.6f\n", i, S(i, 1), Apartenenta(R2(S(i, 1), 1), val1, val2));
	endfor

	fclose(fout);
endfunction