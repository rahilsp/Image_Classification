function [test_person,closest_match,knn_match] = face_recog(gnd,fea,p,l,r,k)

% Inputs
% gnd & fea: data
% p: number of people in training set
% l: number of pictures of each person in training set
% r: dimension of space spanned by eigenvector of X*X'(length of feature vector)
% k: number of nearest neighbours in knnsearch

% Outputs
% test_person: person number of randomly chosen test image. The person to
% which this face belongs to is in the training set, however the test image
% face is not in the training set.
% closest_match: person number of closest match
% knn_match: person number of k-NN match
%
%
% Inputs
% gnd & fea: data
% s: index of test image corresponding to fea
% p: number of people in training set
% l: number of pictures of each person in training set
% r: dimension of space spanned by eigenvector of X*X'(length of feature vector)
% k: number of nearest neighbours in knnsearch

% Outputs
% test_person: person number relating to test image
% closest_match: person number of closest match
% knn_match: person number of k-NN match

[elem,random_test] = choice_test_ppl(p,l,gnd);  % Retrieve row numbers of gnd required for training set
X = fea(elem,:);            % Retrieve training set X
X = X';
L = size(X);                % Size of training set m
m = L(2);

s = random_test;
test_person = gnd(s);       % Person number of test image
Y = fea(s,:);               % Retrieve test image
Y = Y';

Xm = sum(X,2)/m;            % Calculate mean image
 
% Xc = X - repmat(Xm,[1 m]);    % Subtract mean from each training set imageS if desired
Xc = X;

% Yc = Y - repmat(Xm,[1 n]);    % Subtract mean from test test image if desired
Yc = Y;

[Vx Dx] = eig(Xc*Xc');       % Eigendecompoistion 
[Vy Dy] = eig(Yc*Yc');

Xf = Vx'*Xc;                % Project X into space spanned by V1
% Xf = Dx.^(-1/2)*Vx'*Yc;   % Whitening 
Xf = flipud(Xf);
Xf = Xf(3:r+2,:);     
Xf = Xf';

Yf = Vx'*Yc;                % Project Y into space spanned by V1
% Yf = Dy.^(-1/2)*Vy'*Yc;   % Whitening 
Yf = flipud(Yf);
Yf = Yf(3:r+2,:);
Yf = Yf';

[matching_pics,dis] = knnsearch(Xf,Yf,'k',k,'distance','seuclidean'); % Knn search

matching_people = gnd(elem(matching_pics))';  % person numbers of k closest faces

[M,F,H] = mode(matching_people);    % mode of matching people
H = cell2mat(H);

[Lia,Locb] = ismember(H,matching_people);   % if more than one person is mode choose person 
                                            % whose closest face is nearest match to test image
            
closest_match = matching_people(1);      % closest match person number
knn_match = matching_people(Locb(1));    % knn match person number

close all                                            % Show test image 
hold on
A = reshape(fea(s,:),[32 32]);
I1 = mat2gray(A); 
subplot(1,3,1)
imshow(I1)
title('Test Face')

B = reshape(fea(elem(matching_pics(1)),:),[32 32]);        % Show image of closest matching face
I2 = mat2gray(B); 
subplot(1,3,2)
imshow(I2)
title('Closest Match')

C = reshape(fea(elem(matching_pics(Locb(1))),:),[32 32]);  % Show image of person with knn match
% Note that we show the closest matching face of the knn matching person
I3 = mat2gray(C); 
subplot(1,3,3)
imshow(I3)
title('k-NN Match')
shg

end
