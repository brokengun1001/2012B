function [s] = renyijiaofusheqiangdu(H0,n,gam,b)       %H0为辐射强度矩�?包括三列(水平总\水平散\法向直射)
                                                        %n为日期序�?fi为纬�?b为斜面�?�?gam为斜面朝�?
for i=1:24                                              %确定日落太阳时为ts
    if H0(25-i,1) ~= 0
        ts = 25-i;
        break
    end
end

fi = 0.2228*pi;

ws = 15*(ts-12)*pi/180;                                        %确定水平面日落时角为ws

det = 23.45*sin(2*pi*(284+n)/365)*pi/180;                      %确定赤纬角为det

aa = sin(det)*(sin(fi)*cos(b)-cos(fi)*sin(b)*cos(gam));
bb = cos(det)*(cos(fi)*cos(b)+sin(fi)*sin(b)*cos(gam));
cc = cos(det)*sin(b)*sin(gam);

D = sqrt(bb^2+cc^2);
wwsr = [ws;abs(-acos(-aa/D)+asin(cc/D))];           %确定斜面上日出日落时�?
wwss = [ws;acos(-aa/D)+asin(cc/D)];
wsr = -min(wwsr);
wss = min(wwss);



Rb = (pi/180*(wss-wsr)*sin(det)*(sin(fi)*cos(b)-cos(fi)*sin(b)*cos(gam))...
    +cos(det)*(sin(wss)-sin(wsr))*(cos(fi)*cos(b)+sin(fi)*sin(b)*cos(gam))-(cos(wss)-cos(wsr)*cos(det)*sin(b)*cos(gam)))...
    /(2*(cos(fi)*cos(det)*sin(ws)+pi/180*ws*sin(fi)*sin(det)));
Rs = (1+cos(b))/2;
Hd = H0(:,2);
Hb = H0(:,1)-H0(:,2);
if abs(aa)<=abs(D)
    s = Rb*Hb+Rs*Hd;
else
    aaa = 1;
    s = Rs*Hd;
end
