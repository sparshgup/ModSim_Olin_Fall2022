function M_pods = makePods(n1,w1,n2,w2,n3,w3,n4,w4,n5,w5,n6,w6)

% Inputs:
% Input two vectors instead of 12 variables and reframe the
% function to parse the vectors
%
% 6 pods:
% two construction sites --> assign outbreak to one
% mall --> assign outbreak
% two dorms --> overcrowded has outbreak
% isolation center --> everyone would be infected but are not capable of
% spreading infection
%
% n1...6  =  people in each pod
% w1...6  = Edge weights for each pod
%
% Returns:
% M_pods = matrix with all pods

%Creating individual pods with their respective edge weights

M_n1 = w1*(ones(n1, n1) - eye(n1));  
M_n2 = w2*(ones(n2, n2) - eye(n2));
M_n3 = w3*(ones(n3, n3) - eye(n3));
M_n4 = w4*(ones(n4, n4) - eye(n4));
M_n5 = w5*(ones(n5, n5) - eye(n5));
M_n6 = w6*(ones(n6, n6) - eye(n6));

%outting individual pods into one large matrix
n_total = n1 + n2 + n3 + n4 + n5 + n6;
M_total = ones(n_total, n_total);

%sums of the pod matrix dimensions to make syntax for next part simpler
sum1 = n1 + n2;
sum2 = sum1 + n3;
sum3 = sum2 + n4;
sum4 = sum3 + n5;
sum5 = sum4 + n6;

%redefining the respective parts of the large matrix to be equal to the
%pods defined prior
M_total(       1:n1     ,        1:n1    ) = M_n1;
M_total(  (n1+1):(sum1) ,   (n1+1):(sum1)) = M_n2;
M_total((sum1+1):(sum2) , (sum1+1):(sum2)) = M_n3;
M_total((sum2+1):(sum3) , (sum2+1):(sum3)) = M_n4;
M_total((sum3+1):(sum4) , (sum3+1):(sum4)) = M_n5;
M_total((sum4+1):(sum5) , (sum4+1):(sum5)) = M_n6;

M_pods = M_total;

end