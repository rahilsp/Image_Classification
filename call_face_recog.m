%% Call face_recog

s = randi([1 2414]);        % Index of test image corresponding to fea
l = 5;                      % Number of pictures of each person in training set
r = 100;                    % Dimension of space spanned by eigenvector of X*X'
k = 10;                     % number of nearest neighbours in knnsearch

[test_person,closest_match,knn_match] = face_recog(gnd,fea,s,l,r,k)
