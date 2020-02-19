function [p_dist,k_test]=find_k_test(c,train_label,test,train_v,train_U,train_k)

m=1.5;
size_test=size(test,1);
size_train=size(train_U,2);
test_U =zeros(c,size_test);%
test_dist=zeros(size_train,size_test);%
test_idx=zeros(size_test,size_train);%
k_test=zeros(size_test,1);%
for i = 1:c
    for j = 1: size_test
        test_U(i,j) = 1/sum((euclidean(test(j, :),train_v(i, :))./euclidean(test(j, :),train_v)).^(2/(m-1)));
    end
end
% �������������ѵ�����ݵģ����ʣ�����
for i=1:size_train
    for j=1:size_test     
       test_dist(i,j)=norm(train_U(:,i)-test_U(:,j));
    end
end
test_dist=test_dist';
for i=1:size_test
%     [test_sort_u(i,:),test_idx(i,:)]=sort(test_dist(i,:));
        [~,test_idx(i,:)]=sort(test_dist(i,:));
end
% %% ����������Ӧ��kֵ�����Ըĳɸ�����������ɸ���kֵ��������һ����ͨ���Ż����ң�
for i=1:size_test
      k_test(i,1)=train_k(test_idx(i,1));
end

for i=1:size_test
     for j=1:size_train
         p_dist(i,j)=train_label(test_idx(i,j),1);
     end
end 
end

 
