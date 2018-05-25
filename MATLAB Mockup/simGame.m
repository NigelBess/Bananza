function expectedValue = simGame(edge,numGames)
   
ret = 0;
guess = 0;
    eVal = zeros(1,numGames);
    dm = 0.01;
   
   
    for i = 1:numGames
             set;
             mult = 1;
             p = (1-edge)/(1 + dm);
            r = rand(1);
            if r>p
                 eVal(i) = 0;
            else
                while r<p
                        if (guess <= mult) || (mult>10)
                            ret = mult;
                            r = p+1;
                        else
                             p = mult/(mult+dm);
                             r = rand(1);
                             if r>p
                                 ret = 0;
                             else
                                 mult = mult+dm;
                             end
                         end
                end
                eVal(i) = ret;
            end
    end
    expectedValue = sum(eVal)/numGames;
    
    function set()
         guess = randi([101 10000],1)*0.01;
    end
end