for i = 1:365
    H = rifusheqiangdu(H00,i,0,0.01852);
    for j = 1:24
        HH((i-1)*24+j,1) = H(j,1);
    end
end

for i = 1:365
    HD(i,1) = rizongfusheqiangdu(H00,i,0,0.1852);
end
for i = 1:12
    HM(i,1) = yuezongfusheqiangdu(H00,i,0,0.1852);
end
