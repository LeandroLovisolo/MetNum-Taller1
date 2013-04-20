function x0 = reestimar_poblacion_con_potenciacion(A, x, n)
	xn = A^n * x;
	[P, L, U] = lu_con_pivoteo(A^n);
	y = forward_substitution(L, P * xn);
	x0 = backward_substitution(U, y);
return