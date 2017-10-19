function [elem,random_test] = choice_test_ppl(k,l,gnd)

% function which returns the row numbers of fea relating to k different
% persons

% counting number of images per person
for i=1:max(unique(gnd))
    count(i)=sum(gnd==i);
end

n_pe=max(unique(gnd));   % number of people in the whole pool

pe=randperm(n_pe,k);    % people chosen as test set

l = l+1;
elem=zeros(k*l,1);

for i=1:k
    elem((i-1)*l+[1:l]')=sum(count(1:pe(i)-1))+randperm(count(pe(i)),l)';
end

random_test = elem(1); % choose random face as test

for i = 1:k
    elem((i-1)*l +1) = 0;
end

elem(elem==0) = [];
