function R = Iterative(nume, d, eps)
	M = buildM(nume); # construim matricea stocastica care
                    # contine legaturile intre pagini
	[N, N] = size(M); # retinem dimensiunea matricii

  R = (1 / N) * ones(N, 1); # initializam vectorul PageRank la pasul 0
  PR = inf * ones(N, 1); # vectorul PageRank la pasul anterior; va fi
												 # initializat cu inf pentru toate elementele
	M_ = (d * M) + (((1 - d) / N) * ones(N, N)); # calculam matricea pe care
																							 # o folosim la algoritm
	while norm(R - PR, 2) > eps # continuam cat timp nu suntem
	  PR = R;										# multumiti de convergenta
	  R = M_ * R;
  endwhile

  R = PR;
endfunction