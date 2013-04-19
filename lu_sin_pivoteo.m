function [L,U] = lu_sin_pivoteo(A)
   % devuelve la factorizacion LU en A
   % guarda los resultados en la misma matriz A
   
   % calcular la cantidad e filas y de columnas de A
   [n,m]=size(A);
   if( n~=m )
      error('La matriz no es cuadrada') ;
   end
   for i = 1:n-1,
      % testear que el coeficiente a dividir no se anule
      if( abs( A(i,i) ) == 0 )
         % podriamos testear si abs( A(i,i) )< 1e-16
         error('Uno de los pivotes es cero. Realizar LU con pivoteo parcial') ;
      end
      
      % el corazon del algoritmo
      A(i+1:n,i) = A(i+1:n,i)/A(i,i) ;
      A(i+1:n,i+1:n) = A(i+1:n,i+1:n)-A(i+1:n,i)*A(i,i+1:n) ;
   end
   
   % extraer U de A
   U=triu(A); % Extracts U from A
   
   % extraer L de A
   L=tril(A); % Extracts L from A
   
   % setear unos en la diagonal de L
   for j=1:n
      L(j,j)=1; 
   end
return
