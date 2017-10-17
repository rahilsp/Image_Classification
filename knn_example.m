load fisheriris
x = meas(:,3:4)
% y = [5 1.45;6 2;2.75 .75]
y = [5 1.45]

[n,d] = knnsearch(x,y,'k',10,'distance','euclidean')
[ncb,dcb] = knnsearch(x,y,'k',10,...
   'distance','chebychev');