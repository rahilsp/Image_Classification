function elem=choice_test_ppl(k,l,gnd);

% function which returns the row numbers of fea relating to k different
% persons

% counting number of images per person
for i=1:max(unique(gnd))
    count(i)=sum(gnd==i);
end

% number of people in the whole pool
n_pe=max(unique(gnd));
% people chosen as test set
pe=randperm(n_pe,k);

elem=zeros(k*l,1);

for i=1:k
    elem((i-1)*l+[1:l]')=sum(count(1:pe(i)-1))+randperm(count(pe(i)),l)';
end

