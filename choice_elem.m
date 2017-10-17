function elem=choice_elem(gnd,k)

% function which returns the row numbers of fea relating to k different
% images of each person

% counting number of images per person
for i=1:max(unique(gnd))
    count(i)=sum(gnd==i);
end

n_pe=max(unique(gnd));

elem=zeros(n_pe*k,1);

elem([1:k])=[1:k];

for i=2:n_pe
    for j=1:k
        elem(k*(i-1)+j)=j+sum(count(1:i-1));
    end
end

