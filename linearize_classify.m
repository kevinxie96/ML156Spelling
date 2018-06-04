% Octave function which linearizes a system of differential 
% equations, takes in a fixed point, and then classifies the fixed 
% point. 
% Warning: This function is not meant to handle borderline cases, 
% as it is meant to give an accurate qualitative picture for the 
% nonlinearized system.
% ----------------------------------------------------------------
% Setting up the input arguments in the command line:
% >> syms x y
% >> f = ...
% >> g = ...
% >> linearize_classify(f, g, x1, y1)      
% *where (x1,y1) is the fixed point 



function linearize_classify(f, g, x1, y1)
  syms x y
  fjac(x,y) = jacobian(f);
  gjac(x,y) = jacobian(g);
  printf ("Jacobian matrix at the fixed point (%d,%d): \n", x1,y1);
  A = [fjac(x1,y1); gjac(x1,y1)]
  disp("Its corresponding eigenvalues: ");
  ev = eig(A)
  
  if (imag(ev(1)) == 0)
    if (real(ev(1))*real(ev(2)) < 0)
      disp("The fixed point is a saddle point.");
    elseif (real(ev(1))*real(ev(2)) > 0)
      if (real(ev(1)) == real(ev(2)))
        disp("The fixed point is a degenerate node.")
        disp("Warning: This is a borderline case; we can not make 
        any qualitative assumptions about the nonlinear system.");
      else
        if (real(ev(1)) > 0)
          disp("The fixed point is an unstable node.");
        else
          disp("The fixed point is an stable node.");
        endif
      endif
    else
      disp("The fixed point is a non-isolated fixed point.");
      disp("Warning: This is a borderline case; we can not make any 
      qualitative assumptions about the nonlinear system.");
    endif
  else
    if (real(ev(1)) > 0)
      disp("The fixed point is an unstable spiral.");
    elseif (real(ev(1)) < 0)
      disp("The fixed point is a stable spiral.");
    else
      disp("The fixed point is a stable center.");
      disp("Warning: This is a borderline case; check for energy 
      conservation.");
    endif
  endif
endfunction