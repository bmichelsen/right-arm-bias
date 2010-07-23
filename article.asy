if(!settings.multipleView)
 settings.batchView=false;

// Beginning of Asymptote Figure 1
eval(quote{
defaultfilename='article-1';
if(settings.render < 0) settings.render=4;
settings.inlineimage=true;
settings.embed=true;
settings.outformat='';
settings.toolbar=false;
viewportmargin=(1,1);

import three;
usepackage("bm");
texpreamble("\def\V#1{\bm{#1}}");

size(4cm,0);
pen colour1=red;
pen colour2=green;

pair z0=(0,0);
pair z1=(-1,0);
pair z2=(1,0);
real r=1.5;
path c1=circle(z1,r);
path c2=circle(z2,r);
fill(c1,colour1);
fill(c2,colour1);

picture intersection=new picture;
fill(intersection,c1,colour1);
clip(intersection,c2,colour1);

add(intersection);

draw(c1);
draw(c2);

draw("$S$",box,z1);
draw("$\V{T}$",box,z2);

pair z=(0,-2);
real m=3;
margin BigMargin=Margin(0,m*dot(unit(z1-z),unit(z0-z)));

draw(Label("$S\cup T$",0),z--z0,Arrow,BigMargin);
draw(z--z1,Arrow,Margin(0,m));
draw(z--z2,Arrow,Margin(0,m));

shipout(bbox(0.25cm));
viewportsize=(237.13594pt,0);
});
// End of Asymptote Figure 1

// Beginning of Asymptote Figure 2
eval(quote{
defaultfilename='article-2';
if(settings.render < 0) settings.render=4;
settings.inlineimage=true;
settings.embed=true;
settings.outformat='';
settings.toolbar=false;
viewportmargin=(1,1);

import three;
usepackage("bm");
texpreamble("\def\V#1{\bm{#1}}");

size(4cm,0);
pen colour1=red;
pen colour2=white;

pair z0=(0,0);
pair z1=(-1,0);
pair z2=(1,0);
real r=1.5;
path c1=circle(z1,r);
path c2=circle(z2,r);
fill(c1,colour2);
fill(c2,colour2);

picture intersection=new picture;
fill(intersection,c1,colour1);
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
viewportsize=(237.13594pt,0);
});
// End of Asymptote Figure 2

// Beginning of Asymptote Figure 3
eval(quote{
defaultfilename='article-3';
if(settings.render < 0) settings.render=4;
settings.inlineimage=true;
settings.embed=true;
settings.outformat='';
settings.toolbar=false;
viewportmargin=(1,1);

import three;
usepackage("bm");
texpreamble("\def\V#1{\bm{#1}}");

size(4cm,0);
pen colour1=red;
pen colour2=white;

pair z0=(0,0);
pair z1=(-1,0);
pair z2=(1,0);
real r=1.5;
path c1=circle(z1,r);
path c2=circle(z2,r);
fill(c1,colour1);
fill(c2,colour2);

picture intersection=new picture;
fill(intersection,c1,colour2);
clip(intersection,c2);

add(intersection);

draw(c1);
draw(c2);

draw("$S$",box,z1);
draw("$\V{T}$",box,z2);

pair z=(0,-2);
real m=3;
margin BigMargin=Margin(0,m*dot(unit(z1-z),unit(z0-z)));

draw(Label("$S - T$",0),z--z0,Arrow,BigMargin);
draw(z--z1,Arrow,Margin(0,m));
draw(z--z2,Arrow,Margin(0,m));

shipout(bbox(0.25cm));
viewportsize=(237.13594pt,0);
});
// End of Asymptote Figure 3

// Beginning of Asymptote Figure 4
eval(quote{
defaultfilename='article-4';
if(settings.render < 0) settings.render=4;
settings.inlineimage=true;
settings.embed=true;
settings.outformat='';
settings.toolbar=false;
viewportmargin=(1,1);

import three;
usepackage("bm");
texpreamble("\def\V#1{\bm{#1}}");

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

draw(Label("$S \Delta T$",0),z--z0,Arrow,BigMargin);

shipout(bbox(0.25cm));
viewportsize=(237.13594pt,0);
});
// End of Asymptote Figure 4
