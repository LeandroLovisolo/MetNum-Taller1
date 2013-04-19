function x0 = reestimar_poblacion(A, x, n, usar_pivoteo)
	for i = 1:n,
		x = anio_siguiente(A, x);
	end
	for i = 1:n,
		x = anio_anterior(A, x, usar_pivoteo);
	end
	x0 = x;
return