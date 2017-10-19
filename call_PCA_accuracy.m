% This script allows to see the accuracy of the PCA method in the problem
% of recognizing faces.
%
% This script works on the Yale database which consists of 38 people and
% 2414 pictures as a whole.
%
% The user of the script can choose:
%
%   -l := number of images per person that are included in the training 
%         test (the remaining pictures are considered as the test set);
%
%   -k := is the number of nearest data that the k-nearest neighbours
%         algorithm will use;
%
%   -r := is the number of characteristics that are going to be considered
%

l=51;
k=4;
r=200;

PCA_accuracy(l,k,r);