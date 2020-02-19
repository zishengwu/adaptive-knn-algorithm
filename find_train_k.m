function train_k=find_train_k(c,train_label,new_train_idx_)
train_k=zeros(size(train_label,1),1);%
for i=1:size(train_label,1)
    num=zeros(c,1);
%     jj=1;
    %[~,INDEX]=max(num);错误，应该把index初始化为0！！
    INDEX=0;
    
%        while  ( INDEX~=train_label(i,1) ) 
       for jj=1:size(train_label,1)-1
         num(new_train_idx_(i,jj),1)=num(new_train_idx_(i,jj),1)+1;
%         jj=jj+1;
            [~,INDEX]=max(num);
            train_k(i,1)=sum(num);   
        if jj==size(train_label,1)-1         
            break;
        end
        
        if INDEX==train_label(i,1)
            if train_label(i,1)==1
                if num(train_label(i,1)+1,1)~=num(train_label(i,1),1)  %还是有错误
                %if (num(train_label(i,1)+1,1)~=num(train_label(i,1),1) )&&(num(train_label(i,1)+c-1,1)~=num(train_label(i,1),1) )
                    break
                end
            elseif train_label(i,1)==c %其实可以不用这句
                if num(train_label(i,1)-1,1)~=num(train_label(i,1),1) 
                    break
                end
            else              
               if (num(train_label(i,1)+1,1)~=num(train_label(i,1),1) ) && (num(train_label(i,1)-1,1)~=num(train_label(i,1),1))
                break
               end        
            end
        end       
       end

   
end

end
