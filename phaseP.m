% MATLAB function which plots the vector field and nullclines of 
% the system of differential equations: x' = l(x,y), y' = k(x,y). 
% Input are two-variable function handles l,k and a vector S 
% determining a quadratic mesh grid.
% ----------------------------------------------------------------
% Setting up the input arguments in the command line:
% >> l = ...
% >> k = ...
% >> S = ...
% >> phaseP(l, k, S)



function[] = phaseP(l,k,S)

warning('off','all') % Disable all warnings
warning

[s,f] = meshgrid(S,S); % Set mesh grid
svec = reshape(s,length(s)^2,1); % Shape matrix to vector
fvec = reshape(f,length(f)^2,1); % Shape matrix to vector
df = l(fvec,svec); % Function values of l
ds = k(fvec,svec); % Function values of k
% Scale vectors to unit length
dfu = df./sqrt(df.^2+ds.^2);
dsu = ds./sqrt(df.^2+ds.^2); 
clf % Clear all previous figures
quiver(fvec,svec,dfu,dsu, 'color', [.53 .81 .98]) % Plot vector field
axis tight
hold on

% Plot trajectories with initial values (a,b)
for a = 1:3
    for b = 1:3
        j = @(t,y) [l(y(1),y(2));k(y(1),y(2))];
        [ts,ys] = ode45(j,[0,20],[a,b]);
        plot(ys(:,1),ys(:,2),'k')
    end
end

% Values to modify the axes for ezplot
n = S(1);
c = length(S);
m = S(c);

% Plot nullclines corresponding to l(x,y)=0 
w=ezplot(l);
set(w,'color',[1 .1 0]);
title([]);
xlabel([]);
ylabel([]);
axis([n m n m]);

% Plot nullclines corresponding to k(x,y)=0 
z=ezplot(k);
set(z,'color',[1 .1 0]);
title([]);
xlabel([]);
ylabel([]);
axis([n m n m])

xlabel('N_1');
ylabel('N_2');
%xlabel('x_1');
%ylabel('x_2');
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 9 6])
saveas(gcf,'fig1','epsc')
end