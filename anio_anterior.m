function x0 = anio_anterior(A, x1, usar_pivoteo)
	if usar_pivoteo
		[P, L, U] = lu_con_pivoteo(A);
		y = forward_substitution(L, P * x1);
		x0 = backward_substitution(U, y);
	else
		[L, U] = lu_sin_pivoteo(A);
		y  = forward_substitution (L, x1);
		x0 = backward_substitution(U, y);
	end
return