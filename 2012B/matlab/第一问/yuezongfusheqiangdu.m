function [s] = yuezongfusheqiangdu(H00,m,gam,b)%H00为全部数�?m为需要求的某月�?辐射强度,fi为纬�?b为斜面�?�?gam为斜面朝�?
q = 0;
x = startday(m);
y = endday(m);
len = y-x+1;
for i= 1:len
    p = rizongfusheqiangdu(H00,x+i-1,gam,b);
    q = q + p;
end
s = q;
