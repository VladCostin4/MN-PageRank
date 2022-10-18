function y = Apartenenta(x, val1, val2)
	if x < val1
		y = 0;
	elseif x > val2
		y = 1;
	else											  # pentru a afla valoarea functiei intre val1
		a = 1 / (val2 - val1);    # si val2, functia trebuie sa fie continua
		b = val1 / (val1 - val2); # deci limitele laterale sunt egale, de unde
		y = a * x + b;            # deducem si valoarea lui a si b
	endif
endfunction
	