function [P,L,U]=ele_u_pp(A)
   % factorizacion LU de A con pivoteo parcial

   % matriz identidad
   Id = eye(size(A));
   L = Id;
   U = A;
   P = Id;
   
   % PASOS DE TRIANGULACION. en el k-esimo paso se ponen 0s en la k-esima columna.
   for k = 1 : size(A,2)-1,
       e_k = Id(:,k);
   
       %pivoteo...
       col = abs(U(k:end,k));
       pos = find(col == max(col));
       if pos(1)>1,
           % Sea r la fila con la cual tengo que intercambiar la k-esima
           % usamos la matriz identidad para obtener los canonicos
           e_r = Id(:,k+pos(1)-1);
           u = e_k-e_r;
           P_k = Id - u * u'; %esta matriz intercambia dos filas al ser premultiplicada
       else
           P_k = Id;
       end
       
       U = P_k * U;
       L = P_k * L * P_k;
       
       % obtenemos pivotes y matriz M elemental de triangulacion
       r = [zeros(k,1) ; U(k+1:end,k)] / U(k,k);
       M = Id - r * e_k';
       
       U = M * U;
       L = L + r * e_k';
       
       P = P_k * P;
   end
end
