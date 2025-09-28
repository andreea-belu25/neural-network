function [Adj] = get_adjanceny_matrix(Labyrinth)
  [nr_lines nr_columns] = size(Labyrinth);
  p = nr_columns * nr_lines;
  
  for i = 1:nr_lines
    for j=1:nr_columns
      number = Labyrinth(i,j);
      nrnou = 0;
      p10 = 1;
      
       while number != 0
         rest = mod(number, 2);
         nrnou = rest * p10 + nrnou;
         p10 = p10 * 10;
         number = floor(number / 2);
       endwhile
       
       Labyrinth(i,j) = nrnou;
    endfor
  endfor
  
  Adj = zeros(p + 2, p + 2);
  
  for i=1:nr_lines
    for j=1:nr_columns
      number = Labyrinth(i,j);
      b0 = mod(number, 10);
      
      number = floor(number / 10);
      b1 = mod(number, 10);
      
      number = floor(number / 10);
      b2 = mod(number, 10);
      
      number = floor(number / 10);
      b3 = mod(number, 10);
      
      index_in_matrix = (i - 1) * nr_columns + j;
      
      if(i != 1 && i != nr_lines && j != 1 && j != nr_columns)
        if(b0 == 0)
          Adj(index_in_matrix, index_in_matrix - 1) = 1;
        endif
        
        if(b1 == 0)
          Adj(index_in_matrix, index_in_matrix + 1) = 1;
        endif
        
        if(b2 == 0)
          Adj(index_in_matrix + 1, index_in_matrix) = 1;
        endif
        
        if(b3 == 0)
          Adj(index_in_matrix - 1, index_in_matrix) = 1;
        endif
      endif
      
      if(i == 1 && b0 == 0)
          if(j == 1)
              Adj(index_in_matrix, p + 2) = 1;
          else
              Adj(index_in_matrix, index_in_matrix - 1) = 1;
          endif
      endif
      
      if(i == 1 && b3 == 0)
          Adj(index_in_matrix, p + 1) = 1;
      endif
      
      if(i == 1 && b2 == 0)
          Adj(index_in_matrix, i * nr_columns + j) = 1;
      endif
     
     if(i == 1 && b1 == 0)
          if(j == nr_columns)
              Adj(index_in_matrix, p + 2) = 1;
           else
              Adj(index_in_matrix, index_in_matrix + 1) = 1;
           endif
      endif
      
      if(i == nr_lines && b2 == 0)
          Adj(index_in_matrix, p + 1) = 1;
      endif
      
      if(i == nr_lines && b3 == 0)
          Adj(index_in_matrix, index_in_matrix - nr_columns) = 1;
      endif
      
      if(i == nr_lines && b0 == 0)
        if(j == 1)
           Adj(index_in_matrix, p + 2) = 1;
        else
           Adj(index_in_matrix, index_in_matrix - 1) = 1;
        endif
     endif
     
     if(i == nr_lines && b1 == 0)
        if(j == nr_columns)
          Adj(index_in_matrix, p + 2) = 1;
        else
          Adj(index_in_matrix, index_in_matrix + 1) = 1;
        endif
     endif
     
     if(j == 1 && i != 1 && i != nr_lines)
        if(b3 == 0)
          Adj(index_in_matrix, index_in_matrix - nr_columns) = 1;
        endif
        
        if(b2 == 0)
            Adj(index_in_matrix, index_in_matrix + nr_columns) = 1;
         endif
         
         if(b0 == 0)
              Adj(index_in_matrix, p + 2) = 1;
         endif
         
         if(b1 == 0)
            Adj(index_in_matrix, index_in_matrix + 1) = 1;
         endif
      endif
      
      if(j == nr_columns && i != 1 && i != nr_lines)
          if(b3 == 0)
            Adj(index_in_matrix,index_in_matrix - nr_columns) = 1;
          endif
          
          if(b0 == 0)
            Adj(index_in_matrix, index_in_matrix - 1) = 1;
          endif
          
          if(b1 == 0)
            Adj(index_in_matrix, p + 2) = 1;
          endif
          
          if(b2 == 0)
            Adj(index_in_matrix, index_in_matrix + nr_columns) = 1;
          endif
        endif
      endfor
    endfor
    
    Adj(p + 1, p + 1) = 1;
    Adj(p + 2, p + 2) = 1;
    Adj = sparse(Adj);
    
endfunction
