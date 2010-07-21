% Venn diagram, showing the symmetric difference of two sets

\def\S{S}
\def\T{\V{T}}

\begin{center}
\begin{asy}
size(4cm,0);
pen colour1=red;
pen colour2=green;
pen colour3=white;

pair z0=(0,0);
pair z1=(-1,0);
pair z2=(1,0);
real r=1.5;
path c1=circle(z1,r);
path c2=circle(z2,r);
fill(c1,colour1);
fill(c2,colour1);

picture intersection=new picture;
fill(intersection,c1,colour3);
clip(intersection,c2);

add(intersection);

draw(c1);
draw(c2);

draw("$S$",box,z1);            
draw("$\V{T}$",box,z2);

pair z=(0,-2);
real m=3;
margin BigMargin=Margin(0,m*dot(unit(z1-z),unit(z0-z)));

draw(Label("$S\cap T$",0),z--z0,Arrow,BigMargin);

shipout(bbox(0.25cm));
\end{asy}
\end{center}
