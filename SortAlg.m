function S = SortAlg(v)
  [N, M] = size(v);

  S(1:N, 1) = 1:N; # vectorul S retine pozitia initiala a elementelor
                   # din vectorul PageRank
  for i = 1:(N - 1)
    for j = (i + 1):N # pentru sortare folosim algoritmul Bubble Sort
      if v(j, 1) >= v(i, 1)
        aux = v(j, 1);
        v(j, 1) = v(i, 1);
        v(i, 1) = aux;

        aux = S(j, 1);
        S(j, 1) = S(i, 1);
        S(i, 1) = aux;
      endif
    endfor
  endfor
endfunction