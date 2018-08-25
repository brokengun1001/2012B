function [s] = renyijiaofusheqiangdu(H0,n,gam,b)       %H0为辐射强度矩阵,包括三列(水平总\水平散\法向直射)
                                                        %n为日期序号,fi为纬度,b为斜面倾角,gam为斜面朝向
for i=0:23                                              %确定日落太阳时为ts
    if H0(23-i,3) ~= 0
        ts = 23-i;
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
wwsr = [ws;abs(-acos(-aa/D)+asin(cc/D))];           %确定斜面上日出日落时角
wwss = [ws;acos(-aa/D)+asin(cc/D)];
wsr = -min(wwsr);
wss = min(wwss);



Rb = ((wss-wsr)*sin(det)*(sin(fi)*cos(b)-cos(fi)*sin(b)*cos(gam))...
    +cos(det)*(sin(wss)-sin(wsr))*(cos(det)*cos(b)+sin(fi)*sin(b)*cos(gam))-(cos(wss)-cos(wsr)*cos(det)*sin(b)*cos(gam)))...
    /(2*(cos(fi)*cos(det)*sin(ws)+ws*sin(fi)*sin(det)));
Rs = (1+cos(b))/2;
Hd = H0(:,2);
Hb = H0(:,1)-H0(:,2);

s = Rb*Hb+Rs*Hd;
