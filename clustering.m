function [clustering_result,class_accuracy,overall_accuracy]  = clustering(gnd,fea,p,l,r)

% Inputs
% gnd & fea: data
% p: number of people in set
% l: number of pictures of each person in set
% r: dimension of space spanned by eigenvector of X*X'(length of feature vector)

% Outputs
%     clustering_result: p x l matrix representing result of k-means clustering algorithm.
% Each row represents a different class as result of the algorithm. The
% numbers in each row represent different people. If the algorithm works
% perfecly each row will contain the same number.
%      class_accuracy: the accuracy of k-means algorithm for each class.
%      overall_accuracy: the overall accuracy of the algorthm (the mean of.
% class_accuracy).

elem = choice_test_ppl(p,l,gnd);  % Retrieve row numbers of gnd required for test set
X = fea(elem,:);                  % Retrieve test set X
X = X';

[V D] = eig(X*X');         % Eigendecompoistion 
Xf = V'*X;                 % Project X into space spanned by V1
% Xf = D.^(-1/2)*V'*X;  % Whitening 
Xf = flipud(Xf);
Xf = Xf(1:r,:);     
Xf = Xf';

[idx,C] = kmeans(Xf,p);                 % k-means algorithm with p classes
clustering_result = reshape(idx, p, l); % reshape result into matrix
[M,F] = mode(clustering_result'); 
class_accuracy = (F'-1)./(l-1);             % class accuracy
overall_accuracy = mean(class_accuracy);    % overall accuracy

end