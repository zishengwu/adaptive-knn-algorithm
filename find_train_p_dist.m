function d_label=find_train_p_dist(train_U, train_label)
% %% 直接算训练样本之间的（概率）距离，并排序
size_train=size(train_U,2);
p_train_dist=zeros(size_train,size_train);%
p_train_idx=zeros(size_train,size_train);%
 new_train_idx_=zeros(size_train,size_train-1);%
for i=1:size_train
    for j=i:size_train      
       p_train_dist(i,j)=norm(train_U(:,i)-train_U(:,j));
    end
end
p_train_dist=p_train_dist+p_train_dist';

for i=1:size_train
    [~,p_train_idx(i,:)]=sort(p_train_dist(i,:));
end

new_train_idx=p_train_idx(:,2:end); %概率距离

for i=1:size_train
     for j=1:size_train-1
         new_train_idx_(i,j)=train_label(new_train_idx(i,j),1);
     end
end 

d_label=new_train_idx_;