function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
   if max(abs(eigs(G))) < 1
    [n n]= size(G);
    x = zeros(n, 1);
    G = speye(n) - G;
    
   for steps = 1:max_steps
     for i =1:n
        x(i) = (c(i) - G(i, 1:i-1) * x0(1:i-1) - G(i, i+1:n) * x0(i+1:n)) / G(i,i);
     endfor
     
     if norm(x - x0) < tol
        return;
     endif
     
     x0 = x;
     err = 0;
     
   endfor
   
  else
   err = 1;
   return;
  endif
  
endfunction
