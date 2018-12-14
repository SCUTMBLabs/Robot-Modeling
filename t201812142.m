syms a b c;
Q=[a,b,c,0];
L1=Link([a 0 0 0],'modified');%notice the form of the function Link(theta d a alpha)
L2=Link([b 0 4 0],'modified');
L3=Link([c 0 3 0],'modified');
LH=Link([0 0 2 0],'modified');
robot=SerialLink([L1 L2 L3 LH]);%notice the sequence of variable in the function SerialLink()
T0H=fkine(robot,Q);%notice that Q is the vector contaning all the theta;

% qn=[0 pi/3 0 0];%radian,and notice the number of the elements which represent the origin position of the links
% robot.teach(qn);%execute the function will report error!!!It is because the links contain variable(a,b,and c)!!! 


%%%check out the result above, making sure the accuracy of the grammar.
T01=[cos(a),-sin(a),0,0;
     sin(a),cos(a),0,0;
     0,0,1,0;
     0,0,0,1];
 T12=[cos(b),-sin(b),0,4;
     sin(b),cos(b),0,0;
     0,0,1,0;
     0,0,0,1];
 T23=[cos(c),-sin(c),0,3;
     sin(c),cos(c),0,0;
     0,0,1,0;
     0,0,0,1];
 T3H=[1,0,0,2;
     0,1,0,0;
     0,0,1,0;
     0,0,0,1];
 t0h=T01*T12*T23*T3H;
 t0h=simplify(t0h);%simplify the expression of the result