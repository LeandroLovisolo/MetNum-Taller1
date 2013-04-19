function [L,U]=ele_u(A)
   % calcula la factorizacion LU de A

   % matriz identidad
   Id = eye(size(A));
   L = Id;
   U = A;

   % en el k-esimo paso se ponen ceros en la k-esima columna.
   for k = 1 : size(A,2)-1,
      %obtenemos pivotes
      if U(k,k)==0, error('Uno de los pivotes es cero. Realizar LU con pivoteo parcial'); end
    
      r = [zeros(k,1) ; U(k+1:end,k)] / U(k,k);
      
      % usamos Id para obtener los canonicos
      e_k = Id(:,k);
      
      M = Id - r * e_k' ;
    
      U = M * U ;
      L = L + r * e_k' ;
   end
end
