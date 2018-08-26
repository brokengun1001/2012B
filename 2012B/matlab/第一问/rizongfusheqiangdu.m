function [s] = rizongfusheqiangdu(H00,n,gam,b)%H00为全部数�?n为需要求的某天�?辐射强度,fi为纬�?b为斜面�?�?gam为斜面朝�?
for i = 1:24
    H0(i,:) = H00(24*(n-1)+i,:);
end
H = renyijiaofusheqiangdu(H0,n,gam,b);
m = 0;
for i = 1:24
    m = m+H(i);
end
s = m;
