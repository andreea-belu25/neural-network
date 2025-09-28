function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  [n m] = size(InitialMatrix);
  FeatureMatrix = zeros(n, m);
  i1 = 0;
  j1 = 0;
  
  for j=1:m
    ok = 0;
    j1++;
    i1 = 0;
    
    for i=1:n
      v1 = 0;
      v2 = 0;
      v3 = 0;
      v4 = 0;
      v5 = 0;
      i1++;
      
      if (strcmp(InitialMatrix{i,j}, "no") == 1)
        FeatureMatrix(i1,j1) = 0;
        v1 = 1;
      endif
      
      if(strcmp(InitialMatrix{i,j}, "yes") == 1)
        FeatureMatrix(i1, j1) = 1;
        v2 = 1;
      endif
      
      if(strcmp(InitialMatrix{i,j}, "semi-furnished") == 1)
        FeatureMatrix(i1, j1) = 1;
        if (ok == 0)
          k = j1 + 1;
          ok = 1;
        endif
        
        FeatureMatrix(i1, k) = 0;
        v3 = 1;
      endif
      
      if(strcmp(InitialMatrix{i,j}, "unfurnished") == 1)
        FeatureMatrix(i1, j1) = 0;
        if (ok == 0)
          k = j1 + 1;
          ok = 1;
        endif
        FeatureMatrix(i1, k) = 1;
        v4 = 1;
      endif
      
      if(strcmp(InitialMatrix{i,j}, "furnished") == 1)
        FeatureMatrix(i1, j1) = 0;
        if (ok == 0)
          k = j1 + 1;
          ok = 1;
        endif
        
        FeatureMatrix(i1, k) = 0;
        v5 = 1;
      endif
      
      if(v1 == 0 && v2 == 0 && v3 == 0 && v4 == 0 && v5 == 0)
          ascii_number = hex2dec(InitialMatrix{i, j});
          FeatureMatrix(i1, j1) = ascii_number;
      endif
      
    endfor
   endfor
  
endfunction

