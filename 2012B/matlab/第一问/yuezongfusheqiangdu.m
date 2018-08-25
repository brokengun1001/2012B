function [s] = yuezongfusheqiangdu(H00,m,gam,b)%H00为全部数据,m为需要求的某月总辐射强度,fi为纬度,b为斜面倾角,gam为斜面朝向
q = 0;
x = startday(m);
y = endday(m);
len = y-x+1;
for j= 1:len
    p = rizongfusheqiangdu(H00,x+j-1,gam,b);
    q = q + p;
end
s = q;
