%% Call clustering

p = 3;                     % number of people in set
l = 5;                     % Number of pictures of each person in set
r = 1000;                  % dimension of space spanned by eigenvector of X*X'(length of feature vector)

[clustering_result,class_accuracy,overall_accuracy] = clustering(gnd,fea,p,l,r)


