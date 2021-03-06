%% Soal 1 
exptheta =  ureal('exptheta',1.0526,'PlusMinus',[-0.0526,0.0526]);
sys = tf(exptheta ,[1 1])
sys0= tf(exptheta.NominalValue ,[1 1])
W = tf([1],[0.8 0.8]) 
W1 = makeweight(1.2,0.67 ,0)
norm=sys/sys0 - 1
bodemag(sys, 'b' , sys.NominalValue ,'g', W, 'k', W1, 'r')
% bode(sys1)

%% Soal 2
t1 = ureal('t1', 0.1, 'PlusMinus',[-0.1,0.1]);
t2 = ureal('t2', 2.25 ,'PlusMinus',[-0.25,0.25]);
sys = tf([1],[t1*t2 t1+t2 1])
sys0 = tf([1],[t1.NominalValue*t2.NominalValue t1.NominalValue+t2.NominalValue 1])
norm=sys/sys0 - 1
W = tf([-0.7 -0.6 0.02],[1/28 -1 1])
W2= makeweight(0,2,28);

bodemag(norm, 'b', W, 'k', W2,'r')

%% Soal 3
% $   \frac{\omega ^2}{s^3+(2 \zeta   \omega +1)s^2+(2 \zeta   \omega + \omega ^2)s+\omega ^2} $
% 
w = ureal ('w', 100, 'PlusMinus',[-10,10]);
z = ureal ('z',0.15 , 'PlusMinus',[-0.05,0.05]);
sys= tf([w^2],[1 2*z*w+1 2*z*w+w^2 w^2])
sys0= tf([w.NominalValue^2],[1 2*z.NominalValue*w.NominalValue+1 2*z.NominalValue*w.NominalValue+w.NominalValue^2 w.NominalValue^2])
norm=sys/sys0 - 1
W3= makeweight(0,102,-5);
bodemag(norm, 'b' , W3 ,'r')

%% no1
clear
clc

% d = ureal('d',1,'range',[0,0.1]);
exptheta =  ureal('exptheta',1.0526,'PlusMinus',[-0.0526,0.0526]);
L = tf(exptheta ,[1 1])
% L = tf(1,[1 1],'InputDelay',0.1);
%A = makeweight(0.1,5,0);
S = 1/1+L;
T = L/1+L;
loops = loopsens(T,1);
Wh = makeweight(0.4,1,20);
wl = makeweight(10,10,.20);
%bode(loops.So,'r', loops.To,'b')
figure(1)
bodemag(Wh,loops.So)
figure(2)
bodemag(wl,loops.To)

%% no2
clear
clc

T1 = ureal('T1',1,'range',[0,0.2]);
T2 = ureal('T2',1,'range',[2,2.5]);
sys1 = tf(1,[T1 1]);
sys2 = tf(1,[T2 1]);
L = sys1*sys2;
C = 1;
S = 1/1+L;
T = L/1+L;
loops = loopsens(T,C);
Wh = makeweight(0.4,0.1,10);
wl = makeweight(10,10,.20);
%bode(loops.So,'r', loops.To,'b')
figure(1)
bodemag(Wh,loops.So)
figure(2)
bodemag(wl,loops.To)

%% no3
clear
clc

z = ureal('z',1,'range',[0.1,0.2]);
w = ureal('w',1,'range',[90,110]);
sys2 = tf(w^2,[1 2*z*w w^2]);
sys1 = tf(1,[1 1]);
L = sys1*sys2;
C = 1;
S = 1/1+L;
T = L/1+L;
loops = loopsens(T,C);
Wh = makeweight(0.4,3,15);
wl = makeweight(10,10,.20);
%bode(loops.So,'r', loops.To,'b')
figure(1)
bodemag(Wh,loops.So)
figure(2)
bodemag(wl,loops.To)