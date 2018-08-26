for i = 1:24
    for k = 1:6
        Ha(i,k) = 0;
    end
end

for i = 1:6
    for j = 1:8760
        for k = 1:6
            if H(j,k)<=200
                H0 = H(j,k)*a(i,2)*0.05;
            else
                H0 = H(j,k)*a(i,2);
            end
            Ha(i,k) = Ha(i,k)+H0;
        end
    end
end
for i = 7:13
    for j = 1:8760
        for k = 1:6
            H0 = H(j,k)*a(i,2);
            Ha(i,k) = Ha(i,k)+H0;
        end
    end
end
for i = 14:24
    for j = 1:8760
        for k = 1:6
            if H(j,k)<=200
                H0 = H(j,k)*a(i,2)*1.01;
            else
                H0 = H(j,k)*a(i,2);
            end
            Ha(i,k) = Ha(i,k)+H0;
        end
    end
end
