function [s] = rizongfusheqiangdu(H00,n,gam,b)%H00为全部数据,n为需要求的某天总辐射强度,fi为纬度,b为斜面倾角,gam为斜面朝向
for ii = 1:24
    H0(ii,:) = H00(24*(n-1)+ii,:);
end
H = renyijiaofusheqiangdu(H0,n,gam,b);
m = 0;
for iii = 1:24
    m = m+H(iii);
end
s = m;