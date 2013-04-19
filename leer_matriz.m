function A = leer_matriz(fname)
  %	A = leer_matriz(fname)
  %	Lee datos desde archivo con nombre fname. 
  %     Formato:
  %     L1: n m
  %     L2: a_11 a_12 a_13 ... a_1n 
  %     L3: a_21 a_22 a_23 ... a_2n
  %     ...
  %     Ln+1: a_n1 a_n2 a_n3 ... a_nn
  fp = fopen(fname);
  if fp == -1
   error(['Error: no se puede abrir archivo ' fname]);
  end	
  
  % lee cantidad de filas
  n = fscanf(fp,'%d',1);
  
  % lee cantidad de columnas
  m = fscanf(fp,'%d\n',1);
  
  % datos
  A = zeros(n,m) ;
  for i = 1:n
      A(i,:) = fscanf(fp, '%f', m) ;
      fscanf(fp,'\n',1);
  end
  
  fclose(fp);
return