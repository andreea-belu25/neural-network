function [G, c] = get_Jacobi_parameters(Link)
    [nr_lines nr_columns] = size(Link);
    nr_lines_G = nr_lines - 2;
    nr_columns_G = nr_columns - 2;
    G = sparse(G)
    
    for i = 1:nr_lines_G
      for j = 1:nr_columns_G
        G(i,j) = Link(i,j);
      endfor
    endfor
    
    for i=1:nr_lines_G
      c(i) = Link(i, nr_lines * nr_columns + 1);
    endfor
    
    c = c';
    
endfunction
