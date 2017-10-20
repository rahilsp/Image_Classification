function elem2=choice_elem_tes(gnd,l)

% function which returns the row numbers of fea relating to the images
% which have not yet been considered in the training set

% counting number of images per person
for i=1:max(unique(gnd))
    count(i)=sum(gnd==i);
end

n_pe=max(unique(gnd));

missing=count-l;
elem=zeros(sum(missing),1);


for j=1:missing(i)
        elem(j)=-(j-1)+sum(count(1));
end

for i=2:n_pe
    for j=1:missing(i)
        elem(sum(missing(1:i-1))+j)=-(j-1)+sum(count(1:i));
    end
end

elem2=elem;

