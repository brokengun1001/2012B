for i = 1:365
    a = 0;
    for j = 1:24
        a = a+beimian1((i-1)*24+j,1);
    end
    HD(i,1) = a;
end

for i = 1:12
    a = 0;
    for j = startday(i):endday(i)
        a = a + HD(j,1);
    end
    HM(i,1) = a;
end
