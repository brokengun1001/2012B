function [s] = rifusheqiangdu(H00,n,gam,b)
for i = 1:24
    H0(i,:) = H00(24*(n-1)+i,:);
end
H = renyijiaofusheqiangdu(H0,n,gam,b);
m = 0;
for i = 1:24
    m = m+H(i);
end
s = H;