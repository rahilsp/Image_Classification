function [] = PCA_accuracy(l,k,r)
% This function computes the accuracy of the PCA method on the Yale pictures
% database once the following parameters are given:
%
%   -l := number of images per person that are included in the training 
%         test (the remaining pictures are considered as the test set);
%
%   -k := is the number of nearest data that the k-nearest neighbours
%         algorithm will use;
%
%   -r := is the number of characteristics that are going to be considered
%

% load the Yale Database
load('YaleB_32x32.mat')
% Number of pictures in the test set
l2=2414-l*38;    %2414 is the whole amount of pictures in the database

% Retrieve training set X
elem=choice_elem(gnd,l);
X = fea(elem,:);
X = X';

% Size of training set m
L = size(X);
m = L(2);

% Size test
elem2=choice_elem_tes(gnd,l);
Y = fea(elem2,:);
Y = Y';
LL= size(Y);
n = LL(2);

% Calculate mean image
Xm = sum(X,2)/m;

% Subtract mean from each training set image
Xc = X - repmat(Xm,[1 m]);


% Subtract mean from each test test image
Yc = Y - repmat(Xm,[1 n]);


% Eigendecompoistion 
[Vx Dx] = eig(Xc*Xc');


Xf = diag(diag(Dx).^(-1/2))*Vx'*X;  % Whitening 
Xf = flipud(Xf);
Xf = Xf(3:r+3,:);
Xf = Xf';

Yf = diag(diag(Dx).^(-1/2))*Vx'*Y;   % Whitening 
Yf = flipud(Yf);
Yf = Yf(3:r+3,:);
Yf = Yf';

% Knn search
test_person = gnd(elem2)';
[matching_pics,dis] = knnsearch(Xf,Yf,'k',k,'distance','seuclidean');
results_person = gnd(elem(matching_pics))';
[M,F,H] = mode(results_person);
accuracy=sum(test_person==M)/l2;

display([num2str(l*38/2414*100),'% of the database has been used as a training set. The remaining '...
         ,num2str((1-l*38/2414)*100),' % has been used as the test set.']);
display(['With this choice, the PCA has an accuracy of ',num2str(accuracy*100),'%.'])