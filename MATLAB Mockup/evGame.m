function evGame()
clc
close all
format long
dm = 0.01;
score = 100;
f = figure('name','Game');

betVal = 0;
back = newTxt(0,0);
back.Position = [0,0,1000,1000];
button = newBtn(20,20);
started = false;
stop();
mult = -1;
pl = 1;
p = 1;
x = 0;
houseEdge = 0;
maxMult = 5;


exitButton = newBtn(400,20);
exitButton.Callback = @exit;
exitButton.String = "Exit";

yourScore = newTxt(20,300);
curBet = newTxt(20,280);


betText = newTxt(250,300);
betText.String = "Bet:";

betField = newTxt(400,300);
betField.Position(3) = 100;
betField.Style = 'edit';
betField.Callback = @bet;



errorMsg = newTxt(0,0);
errorMsg.ForegroundColor = [1 0 0];
errorMsg.Position = [300,250,240,20];

game = newTxt(0,0);
game.Position = [150,150,240,90];

updateText;
playing = true;
dt = 0.05;
    while (playing && ishandle(f))
        pause(dt)
        update();
   end


   
   
   
   
   
   
   
   
   
   
   %functions start here
   
    function update()
        if betVal > score
            betVal = score;
            updateText;
        end
        if started
            roll()
        end

    function roll()
         

        
     if mult < 1
         check((1-houseEdge)/(1+dm));
     else
         check(mult/(mult+dm));   
     end
     updateText();
     end
    end

    function check(pt)
        if mult>maxMult   
            stop();
            winAnim;
            return;
        end
        pt = pt - houseEdge;
        r = rand(1);
         if r<pt
             if mult<1
                mult = 1;
             end
             mult = mult+dm;
         else
             bust();
         end
    end

    function bust()
        score = score-betVal;
        updateText;
        started = false;
        stop(1,1);
        bustAnim;
 
    end
    function winAnim()
                game.String = "Winner!";
        game.FontSize = 40;
        game.ForegroundColor = [0 0 1];
        button.Enable = 'off';
        n = 50;
        adt = 1/2/n;
        for j = 1:5
            for i = 1:n/2
                pause(adt)
               game.FontSize = game.FontSize-40/n;
               game.ForegroundColor = rand(1,3);
            end
            for i = n/2+1:n
                pause(adt)
               game.FontSize = game.FontSize+40/n;
               game.ForegroundColor = rand(1,3);
            end
        end
        updateText;
    end

    function bustAnim()
        game.String = "Busted!";
        game.FontSize = 1;
        game.ForegroundColor = [0 0 0];
        button.Enable = 'off';
        n = 50;
        adt = 1/n;
        for i = 1:n
            pause(adt)
           game.FontSize = game.FontSize+40/n;
           game.ForegroundColor(1) = game.ForegroundColor(1)+1/(n+1);
        end
        updateText;
    end

function  stop(src,event)
    
    
button.String = "Start";
button.Callback = @start;
button.ForegroundColor = [0,0,0];
button = scale(button,1);
if started
    score = score-betVal+betVal*mult;
end
mult = -1;
started = false;
updateText;
end

    function start(src,event)
        if betVal<=0
            errorMsg.String = "You must bet First!";
            updateText;
            return;
        end
        updateText;
        started = true;
        button.String = "Stop";
        button.Callback = @stop;
        button.ForegroundColor = [1,0.3,0.3];
        button = scale(button,1.2);
    end
    function scoreAnim(win)
        if win
        else
        end
        
    end

function exit(src,event)
close;
playing = false;
clc;
fprintf("Final Score: %d",score);
end


    function updateText()
        yourScore.String = "You Have: " + num2str(score,5);
        curBet.String = "Current Bet: " + num2str(betVal,5);
        
        if mult >= 1
            game.String = num2str(mult,3);
            game.FontSize = min(20*mult,50);
            if game.FontSize >49
                game.ForegroundColor(2) = max(game.ForegroundColor(2)-0.01,0);
                game.ForegroundColor(1) = min(game.ForegroundColor(1)+0.01,1);
            else
                game.ForegroundColor = [0 1 0];
            end
        else
            game.String = "---";
            game.FontSize = 30;
            game.ForegroundColor = [0 1 0];
        end
        button.Enable = 'on';
    end

    function out =  newBtn(x,y)
        out = uicontrol;
        out.BackgroundColor = [1 1 1];
        out.Position = [x,y,120,40];
    end

    function out = newTxt(x,y)
        out = uicontrol('Style','text');
        out.BackgroundColor = [1 1 1];
        out.Position = [x,y,200,20];
        out.ForegroundColor = [0,0,1];
        out.FontWeight = 'bold';
        out.FontSize = 10;
    end
    function bet(src,event)
        str = get(src,'String');
        if str == ""
            errorMsg.String = '';
            return;
        end
        if isempty(str2num(str))
            errorMsg.String = 'Value must be numeric';
            return;
        end
        n = str2num(str);
        if n<=0
            errorMsg.String = 'Value must be greater than zero';
            return
        end
        
      
        
        errorMsg.String = '';
        betVal = n;
        updateText;
    end

    function btn = scale(x,scalefactor)
        btn = x;
        p = x.Position;
        p(3:4) = [120,40];
        btn.Position = [p(1),p(2),p(3)*scalefactor,p(4)*scalefactor];
    end
end