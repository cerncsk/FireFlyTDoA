function END=Second_testt(x)
%%
% B=[x(1),x(2),x(3)];
% 
% First=B;
%%
% First=[a,b,c];
NumbVars = 2;
RangeVars = [-300000,300000];
NumbPop = 40;     

P=[0, 10000,-10000,0;...
            0,-10000,-10000,10000];
MaxIter = 3000;

Beta0 = 1;
Gamma = 1;
Alpha = 0.2;
m = 2;

% Damping Equation
Damp = 0.99;

    function Calcc
    FireFly(i).Cost=0;       
    for j=2:4

           FireFly(i).Cost = FireFly(i).Cost+(1/4)*(((((FireFly(i).Position(1)-P(1,1))^2+(FireFly(i).Position(2)-P(2,1))^2)^0.5)-...
                (((FireFly(i).Position(1)-P(1,j))^2+(FireFly(i).Position(2)-P(2,j))^2)^0.5))/299792458-...
                (((((x(1)-P(1,1))^2+(x(2)-P(2,1))^2)^0.5)-...
                (((x(1) -P(1,j))^2+(x(2)-P(2,j))^2)^0.5))/299792458)+3e-9)^2;       
    end  
        
    end


    function Calc_2
        NewFireFly(i).Cost=0;      
        for j=2:4

               NewFireFly(i).Cost = NewFireFly(i).Cost+(1/4)*(((((NewFireFly(i).Position(1)-P(1,1))^2+(NewFireFly(i).Position(2)-P(2,1))^2)^0.5)-...
                    (((NewFireFly(i).Position(1)-P(1,j))^2+(NewFireFly(i).Position(2)-P(2,j))^2)^0.5))/299792458-...
                    (((((x(1)-P(1,1))^2+(x(2)-P(2,1))^2)^0.5)-...
                    (((x(1) -P(1,j))^2+(x(2)-P(2,j))^2)^0.5))/299792458)+3e-9)^2;       
        end  

        end
%     %% Initializing the FireFly Algorithm
SampleFireFly.Position = [];
SampleFireFly.Cost = [];
FireFly = repmat(SampleFireFly,NumbPop,1);
BestFireFly.Cost = inf;
    for i = 1:NumbPop

          FireFly(i).Position = ...
                   unifrnd(RangeVars(1),RangeVars(2),[1,NumbVars]);  
          Calcc
          if FireFly(i).Cost <= BestFireFly.Cost
                   AllFireFly = FireFly(i);
                   
          end
    %END=BestFireFly;   
    end


      %% MainLoop of FireFly Algorithm
    
    AllFireFlyPosition = zeros(MaxIter,2);
     for Iter = 1:MaxIter
        NewFireFly = FireFly;
        for i = 1:NumbPop
           for n = 1:NumbPop 
            if FireFly(n).Cost <= FireFly(i).Cost

                Distance = norm(FireFly(i).Position - FireFly(n).Position);

                Beta = Beta0*exp(-Gamma*Distance^m);

                e = unifrnd(-0.05*(RangeVars(2)-RangeVars(1))...
                    ,0.05*(RangeVars(2)-RangeVars(1))...
                    ,[1,NumbVars]);

                NewFireFly(i).Position = FireFly(i).Position...
                    +Beta*(FireFly(n).Position - FireFly(i).Position)...
                    +Alpha*e;

                NewFireFly(i).Position = max(NewFireFly(i).Position...
                    ,RangeVars(1));
                NewFireFly(i).Position = min(NewFireFly(i).Position...
                    ,RangeVars(2));
                Calc_2
                if NewFireFly(i).Cost <= BestFireFly.Cost
                    AllFireFly = NewFireFly(i);
                    %1. iterasyon sonucu işaretlenecek,2. iterasyon sonucu
                    %işaretlenecek vs...
                    
                end
                
                
                    %1. iterasyon sonucu işaretlenecek,2. iterasyon sonucu
                    %işaretlenecek vs...
                    
            end
           end
        end
    
           FireFly = [NewFireFly
                       FireFly
                       AllFireFly];
           [~,SortOrder] = sort([FireFly.Cost]);
           FireFly = FireFly(SortOrder);
           FireFly = FireFly(1:NumbPop);

           Alpha = Alpha * Damp;

           AllFireFlyPosition(Iter,:) = AllFireFly.Position;
           disp(['Iteration',num2str(Iter)]);
           END=AllFireFlyPosition;   
     end
     
end
    
    
    
    
    
    
    
    


