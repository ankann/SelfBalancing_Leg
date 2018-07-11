clear variables
n=100;
A=1;B=5;C=10;D=0.5;
shi_s=deg2rad(30);
shi_f=pi/2;
t_s=2*asin(B*cos(shi_s)/(2*A));
theta_s=pi-asin(D/A);
theta_f=asin(D/A);
i=1:n;
theta=theta_s+(theta_f-theta_s)*(i-1)/(n-1);
shi=shi_s+(shi_f-shi_s)*((i-1)/(n-1)).^2;
D=ones(1,n);
phi =asin((A*sin(theta)+ B*sin(shi)-D)/C);
X=A*cos(theta)+B*cos(shi)-C*cos(phi);
P1 = zeros(2,n);
P2 = A*[cos(theta);sin(theta)];
P3 = P2 + B*[cos(shi);sin(shi)];
P4 = [X;D];


t=theta;
for i=1:length(t) 
    ani = subplot(1,1,1);
    %A_bar = line([P1(1) P2(1,i)],[P1(2) P2(2,i)]);
    B_bar = line([P2(1,i) P3(1,i)],[P2(2,i) P3(2,i)]);
    %C_bar = line([P3(1,i) P4(1,i)],[P3(2,i) P4(2,i)]);
    P4_circle = viscircles(P4(:,i)',0.05);
    axis(ani,'equal');
   set(gca,'XLim',[-5 20],'YLim',[-5 20]);
    str1 = 'P3';
   str3='o';
   str4='.';
   str2 = ['Time elapsed: '  num2str(t(i)) ' s'];
   P3_text = text(P3(1,i),P3(2,i)+0.6,str1);
    P3_text1 = text(P3(1,i),P3(2,i),str4,'color','red');
    P2_text1 = text(P2(1,i),P2(2,i),str4,'color','blue');
   str_1 = 'P4';
   str_3='o';
   str_4='.';
   P4_text = text(P4(1,i),P4(2,i)+0.6,str_1);
   Time = text(-2,6,str2);
   pause(0.5);
   if i<length(t)
        %delete(A_bar);
        delete(B_bar);
        %delete(C_bar);
        delete(P3_text);
        delete(P4_text);
        delete(Time);
        delete(P4_circle);
   end
end
% xx=1:10;
% yy=spline(theta,P3(2,:),xx);
% plot(xx,yy);
