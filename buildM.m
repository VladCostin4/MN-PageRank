function M = buildM(nume)
	[fin, err] = fopen(nume,'r'); # deschidem fisierul de input

	if fin == -1 # verificam daca a fost deschis cu succes
		disp(err);
	endif

	N = fscanf(fin, "%d", 1); # citim numarul de pagini web

  M = zeros(N, N);

	for i = 1:N
		page = fscanf(fin, "%d", 1);
		L(page) = fscanf(fin, "%d", 1);

		for j = 1:L(page)
			p = fscanf(fin, "%d", 1);
		
      if page != p
			  M(p, page) = 1; # punem 1 in M daca exista link de la page la p
      else
				L(p)--; # daca o pagina are link la ea insasi vom ignora acel link
			endif
    endfor
	endfor

  for j = 1:N
    M(:, j) = M(:, j) / L(j); # transformam matricea de 1-uri intr-o
  endfor                      # matrice stocastica

  fclose(fin);

endfunction