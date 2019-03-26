function barn_fern(p);

tic % calculate simulation time

% values of matrices A1,A2,A3,A4,B2,B3 ans B4
A1 = [ 0.00 0.00 ; 0.00 0.16];
A2 = [ 0.85 0.04; -0.04 0.85]; B2 = [0; 1.60];
A3 = [ 0.20 -0.26; 0.23 0.22]; B3 = [0; 1.60];
A4 = [-0.15 0.28; 0.26 0.24];  B4 = [0; 0.44];


%initial conditions
n=1;
x=0;y=0;
X=[x;y];


while n<=p               
    i=rand;
    if i<=0.03               % for values less than 3%
        X=A1*X;
        RGB=[1,0,0];         % Red color
    elseif i>0.03 && i<=0.8  % for values between 3% to 80%
        X=A2*X + B2;
        RGB=[0,1,0];         % Green color
    elseif i>0.8 && i<=0.9   % for values between 80% to 90%
        X=A3*X + B3;
        RGB=[0,0,1];         % Blue color
    else                     % for values above 90%
        X=A4*X + B4;
        RGB=[1,1,0];         % Yellow color
    end
    n=n+1;
    plot(X(1),X(2),'.','color',RGB,'markersize',1) %plotting
    hold on     %hold plot for upgrading graph            
    
end

%for Black background and Figure name
set(gcf,'color','black','name','Barnsley Fern') 
axis off % to make axis invisible


% print report message on command window after complete plotting
sprintf('Done plotting of %d point in %f seconds',n-1,toc)

end