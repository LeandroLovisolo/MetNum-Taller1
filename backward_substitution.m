function y = backward_substitution(A,b)
   if size(b,2)~=1 || size(A,1)~=numel(b),
      error('las dimensiones no concuerdan') ;
   end ;
   
   if any( tril(A,-1) ),
      error('A no es triangular superior') ;
   end ;
   
   n = size(A,2) ;
   y = zeros(n,1) ;
   
   for i=n:-1:1,
      y(i) = (b(i) - A(i,i+1:n)*y(i+1:n)) / A(i,i) ;
   end
end