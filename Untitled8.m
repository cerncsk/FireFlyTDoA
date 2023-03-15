 clc;clear;close all;
% Uzaktaki hedefler  için iterasyonu arttırmak gerekiyor.
% targ_num=[1500 4000 1400;...
% 1700 2000 1150];
P=[0, 10000,-10000,0;...
            0,-10000,-10000,10000];
         
% targ_num=zeros(3,2);
a = -300000; %range 
b = 300000;
% for f=1:3
%     for m=1:2
%          targ_num(f,m)=(b-a).*rand(1,1)+a;
%     end
% end

targ_num=[-250000,250000;...
            -200000,250000;...
              200000,250000;...
              250000,250000;...
              -250000,0;...
              -200000,0;...
              200000,0;...
              250000,0;...
              -250000,-250000;...
               -200000,-250000;...
               200000,-250000;...
               250000,-250000];
               
A1=zeros(1000,2);A2=zeros(1000,2);A3=zeros(1000,2);A4=zeros(1000,2);A5=zeros(1000,2);A6=zeros(1000,2);
A7=zeros(1000,2);A8=zeros(1000,2);A9=zeros(1000,2);A10=zeros(1000,2);A11=zeros(1000,2);A12=zeros(1000,2);
tic
for sim_num=1:12

%      A(sim_num,:)= Second_testt(targ_num(sim_num,:)); Basındaki A
%      eşitliği structure to string hatasını verdirtiyor
%      Second_testt(100,200,300);
   END=Second_testt(targ_num(sim_num,:)); %fonksiyon outputlarını görmek için.
  
   if sim_num==1
      
          A1=END;
  
   elseif sim_num==2
      
          A2=END;

   elseif sim_num==3
     
          A3=END;
          
   elseif sim_num==4
            A4=END;
       
   elseif sim_num==5
            A5=END;
   elseif sim_num==6
            A6=END;elseif sim_num==7
            A7=END;elseif sim_num==8
            A8=END;elseif sim_num==9
            A9=END;elseif sim_num==10
            A10=END; elseif sim_num==11
            A11=END;elseif sim_num==12
            A12=END;
            
      
   end
end
   
  for s=1:1000
      grid on;
    hold on;
    plot(A1(s,1),A1(s,2),'.','color','m');
    hold on;
    plot(A2(s,1),A2(s,2),'.','color','b');
    hold on;
    plot(A3(s,1),A3(s,2),'.','color','r');
    hold on;plot(A4(s,1),A4(s,2),'.','color','y');
    hold on;plot(A5(s,1),A5(s,2),'.','color','c');
    hold on;plot(A6(s,1),A6(s,2),'.','color','g');
    hold on;plot(A7(s,1),A7(s,2),'.','color','g');
    hold on;plot(A8(s,1),A8(s,2),'.','color','k');
    hold on;plot(A9(s,1),A9(s,2),'.','color','m');
    hold on;plot(A10(s,1),A10(s,2),'.','color','b');
    hold on;plot(A11(s,1),A11(s,2),'.','color','r');
    hold on;plot(A12(s,1),A12(s,2),'.','color','g');
    hold on;
    
   end
toc
hold on;
plot(P(1,1),P(2,1),'+','LineWidth',3,'color','k');
hold on;grid on;
plot(P(1,2),P(2,2),'+','LineWidth',3,'color','k');
hold on;
plot(P(1,3),P(2,3),'+','LineWidth',3,'color','k');
hold on;
plot(P(1,4),P(2,4),'+','LineWidth',3,'color','k');
hold on;
for i=1:12
    hold on;
    plot(targ_num(i,1),targ_num(i,2),'o','LineWidth',2);
    hold on;
end


