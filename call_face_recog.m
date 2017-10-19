%% Call face_recog

p = 10;                     % number of people in training set
l = 2;                      % Number of pictures of each person in training set
r = 200;                    % Dimension of space spanned by eigenvector of X*X'
k = 4;                     % number of nearest neighbours in knnsearch

[test_person,closest_match,knn_match] = face_recog(gnd,fea,p,l,r,k)
