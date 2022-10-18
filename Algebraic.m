function R = Algebraic(nume, d)
	M = buildM(nume); # construim matricea stocastica care
                    # contine legaturile intre pagini
	[N, N] = size(M); # retinem dimensiunea matricii

  R = PR_Inv(eye(N) - d * M) * (1-d) / N * ones(N, 1);
endfunction