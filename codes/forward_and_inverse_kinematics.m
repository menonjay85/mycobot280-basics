%MATLAB code: R _|_ R || R

clear all clc

syms a1 a2 a3 t1 t2 t3 the1 the2 the3

% Forward
H01 = [cos(t1) 0 sin(t1) 0;...
       sin(t1) 0 -cos(t1) 0;...
       0       1    0     a1;...
       0       0    0       1]
H12= [cos(t2) -sin(t2) 0 a2*cos(t2);...
      sin(t2)  cos(t2) 0 a2*sin(t2);...
      0         0      1    0;...
      0         0      0    1]
H23= [cos(t3) -sin(t3) 0 a3*cos(t3);...
      sin(t3)  cos(t3) 0 a3*sin(t3);...
      0         0      1    0;...
      0         0      0    1]

H03 = simplify(H01*H12*H23)

%Computing Forward Solution


a1 = 135, a2 = 165, a3 = 170 % sample values

 Px = cos(the1)*(a3*cos(the2 + the3) + a2*cos(the2))

 Py = sin(the1)*(a3*cos(the2 + the3) + a2*cos(the2))

 Pz = a1 + a3*sin(the2 + the3) + a2*sin(the2)

t1=0/180*pi;

t2=35/180*pi;

t3=-60/180*pi;

 px_new=vpa(subs(Px,[the1,the2,the3],[t1,t2,t3]))

 py_new=vpa(subs(Py,[the1,the2,the3],[t1,t2,t3]))
 
 pz_new=vpa(subs(Pz,[the1,the2,the3],[t1,t2,t3]))
 
%Computing IK Solution

[t1,t2,t3] = solve(Px==px_new,Py==py_new,Pz==pz_new,the1,the2,the3)

Theta1=vpa((t1)*180/pi)

Theta2=vpa((t2)*180/pi)

Theta3=vpa((t3)*180/pi)

Solution=[Theta1 Theta2 Theta3]