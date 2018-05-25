clc
clear
close all
edge = 0:0.1:1;
n = length(edge);
eVal = zeros(1,n);
for i = 1:n
    eVal(i) = simGame(edge(i),1000);
end
plot(edge,eVal)
xlabel('House Edge');
ylabel('Players expected value')
