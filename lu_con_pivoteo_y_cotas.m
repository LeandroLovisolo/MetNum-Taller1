% tipo_matriz:
%   0 = arbitraria, 1 = Hessenberg, 2 = tridiagonal
function [P,L,U]=lu_con_pivoteo_y_cotas(A, tipo_matriz)
   % Factorizacion LU de A con pivoteo parcial
   % devuelve P L U donde LU = PA
   
   [n,n]=size(A) ;
   L=eye(n); P=L; U=A;

   a0 = max(abs(U(:)));
   ak_anteriores=[a0]

   for k=1:n,
      [pivot m]=max(abs(U(k:n,k)));
      m=m+k-1;
      if m~=k
         % interchange rows m and k in U
         temp=U(k,:);U(k,:)=U(m,:);U(m,:)=temp;
         % interchange rows m and k in P
         temp=P(k,:);P(k,:)=P(m,:);P(m,:)=temp;
         if k >= 2
             temp=L(k,1:k-1);L(k,1:k-1)=L(m,1:k-1);L(m,1:k-1)=temp;
         end
      end
      for j=k+1:n,
         L(j,k)=U(j,k)/U(k,k);
         U(j,:)=U(j,:)-L(j,k)*U(k,:);
      end

      ak = max(abs(U(:)));
      ak_anteriores = [ak_anteriores ak];

      if tipo_matriz == 0
         cumple_cota = (ak <= 2^k * a0);
      else
         if tipo_matriz == 1
            cumple_cota = (ak <= (k + 1) * a0);
         else
            cumple_cota = (max(ak_anteriores)) <= 2*a0;
         end
      end

      printf("La iteración %d ", k)
      if !cumple_cota, printf("NO "); end
      printf("cumple con la cota.\n");
   end
end