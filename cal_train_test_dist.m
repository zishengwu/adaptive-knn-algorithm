function real_label=cal_train_test_dist(train,test,train_label)
%注意输入的参数要去掉标签！
% 算训练和测试样本的（实际）距离 ，并排序，然后给出对应的标签
size_train=size(train,1);
size_test=size(test,1);
for i=1:size_train
    for j=1:size_test      
       real_test_dist(i,j)=norm(train(i,:)-test(j,:));
    end
end
real_test_dist=real_test_dist';
for i=1:size_test 
    [real_test_sort_u(i,:),real_test_idx(i,:)]=sort(real_test_dist(i,:));
end

 for i=1:size_test 
     for j=1:size_train
         real_label(i,j)=train_label(real_test_idx(i,j),1);
     end
 end