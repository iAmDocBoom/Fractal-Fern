function barn_fern(p)
tic % calculate simulation time

% values of matrices a1,a2,a3,a4,b2,b3 ans b4
a1 = [ 0.00 0.00 ; 0.00 0.16];
a2 = [ 0.85 0.04; -0.04 0.85]; b2 = [0; 1.60];
a3 = [ 0.20 -0.26; 0.23 0.22]; b3 = [0; 1.60];
a4 = [-0.15 0.28; 0.26 0.24];  b4 = [0; 0.44];


%initial conditions
n=1;
x=0;y=0;
X=[x;y];


while n<=p               
    i=rand;
    if i<=0.03               % for values less than 3%
        X=a1*X;
        rgb=[1,0,0];         % Red color
    elseif i>0.03 && i<=0.8  % for values between 3% to 80%
        X=a2*X + b2;
        rgb=[0,1,0];         % Green color
    elseif i>0.8 && i<=0.9   % for values between 80% to 90%
        X=a3*X + b3;
        rgb=[0,0,1];         % Blue color
    else                     % for values above 90%
        X=a4*X + b4;
        rgb=[1,1,0];         % Yellow color
    end
    n=n+1;
    plot(X(1),X(2),'.','color',rgb,'markersize',1)
    hold on
end


set(gcf,'color','black','name','Barnsley Fern') %for Black background and name of figure
axis OFF



% print report message on command window after complete plotting
sprintf('Function plots %d points in %f time',n-1,toc)

end