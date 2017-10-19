Our repository contains the functions:
face_recog.m
PCA_accuracy.m
clustering.m

face_recog.m is a function which uses the PCA method with k-NN search to match a test face to a training set of faces. One inputs p, the number of people in the training set, l, the number of faces for each person in the training set, r, the dimension of the feature vector, and k, the number of nearest neighbours in k-NN search. 

The function face_recog.m calls the function choice_test_people.m to randomly select a training set with the given parameters and also randomly select a test face. The test face is chosen such different faces of the same person are in the training set.

The function outputs the person number of the test face, the person number of the closest matching face using the standardised euclidian norm and the person number of the k-NN matching using the standard euclidian norm. The test image and closest match and k-NN matching face are all shown. Note that the k-NN matching face is the face of the person which matches closest the test face.

The matlab file call_face_recog.m shows an example of calling this function with apprioriate parameter values.



clustering.m is a function which using the k-means clustering algorithm to clustering groups of faces. One inputs p, the number of people in the training set, l, the number of faces for each person in the training set, and r, the dimension of the feature vector.

The function outputs a matrix represnting the classification of different faces and also the accuracy of each class and the overall accuracy of the clustering.

The matlab file call_clustering.m shows an example of calling this function with apprioriate parameter values.



The function PCA_accuracy.m calculate the accuracy of the PCA method with k-NN search. One inputs l,r and k as for face_recog.m. The function displays in the command window the accuracy of the method. 

The matlab file call_PCA_method.m shows an example of calling this function with apprioriate parameter values.

