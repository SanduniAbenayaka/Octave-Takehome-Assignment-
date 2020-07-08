clc
clear
clear all

#1. wavelets

#a
x= linspace(-2,2,100);
for a=1:100
  
  if 0<=x(a) && x(a)<1/2
    y(a)= 1;
    
  elseif 1/2<=x(a) && x(a)<1
    y(a)=-1;
  else
    y(a)=0;
  end
  
end
plot(x,y)

#b
x= linspace(-2,2,100);
y= ((sin(pi.*x))./(pi.*x)).*((cos(3*pi.*x))./2);
plot(x,y)

#c
x = linspace (-5, 5, 100);
sigma=1
y = ((2./(sqrt(2.*sigma).*pi.^(0.25))).*(1-(x./sigma).^2).*(e.^ (-(x.^2)./(2.*sigma.^2))))
plot(x,y);
xlabel ("x");
ylabel ("y");
title ("1-D Mexican Hat Wavelet");


#d
x = y = linspace (-6, 6, 100);
[xx, yy] = meshgrid (x, y);
sigma=1
z = ((1./(pi.*sigma.^2)).*(1- 0.5.*((xx.^2.+yy.^2)./(sigma.^2))).*(e.^(-1.*((xx.^2.+yy.^2)./(2.*sigma.^2)))));
mesh (x, y, z);
xlabel ("x");
ylabel ("y");
zlabel ("z");
title ("2-D Mexican Hat Wavelet");

#2. image manipulation

#a
A=imread("test.png");
MO= imshow(A);

#b
M=rgb2gray(A);
imshow(M);
#c
size(M)
Me=M(180:500,400:850);
figure
imshow(Me);
title('Sanduni');
print("sanduni.png","-dpng");

#d
round(M);
r =1.6
M2=min(255,r*M)
figure
imshow(M2)


#e

for R=1:rows(M)
    for C=1:columns(M)
        if M(R,C)<127 
          pixel=0;
        else
          M(R,C)=255;
        endif
    endfor
endfor
figure
imshow(M);

#f
M_v=[M;M;M];
M_h=[M M M];
M_t=[Me Me;Me Me];
figure
imshow(M_v)
figure
imshow(M_h)
figure
imshow(M_t)

#g
rank(M)
rank(M_v)
rank(M_h)
rank(M_t)

#h
[a,b]= meshgrid(1:size(Me,1),1:size(Me,2));
mesh( a,b,double(Me'));

#3.Fourier Analysis on Elephant Audio (Rumbles vs. Trumpet)

[X1,Fs] = audioread("elephan6.wav") ;
Y1 = fft(X1) ; 
L1 = size(Y1,1 ) ;
P2 = abs (Y1/L1) ; 
P1 = P2 ( 1:L1/2+1) ;
P1( 2:end-1) = 2*P1(2:end-1) ;
f1 = Fs*( 0:(L1/2))/L1; 

[X2,Fs] = audioread("elephant3.wav") ;
Y2 = fft(X2);
L2 = size(Y2,1 ) ;
P3 = abs (Y2/L2) ;
P4 = P3( 1:L2/2+1) ;
P4( 2:end-1) = 2*P4(2:end-1) ;
f2 = Fs*( 0:(L2/2))/L2;
plot(f1 ,P1)
hold on
plot(f2,P4)
hold off
title( 'Single-Sided Amplitude Spectrum of X(t)' )
xlabel('f(Hz)')
ylabel('|P1(f)|')
axis([0,1000]) ;
print("Single-Sided Amplitude Spectrum of X(t).png","-dpng");

#
sl,sw ,pl ,pw,v ] = textread( 'iris.csv' ,'%f,%f,%f,%f,%s') ;

sl=sl ( 2: end  );
sw=sw ( 2: end );
pl=pl ( 2 :end );
pw= pw( 2 : end );
v=v ( 2: end );

subplot(3,4,1)
scatter(sl(v="Setosa"),sw( v="Setosa") ," r" ,"filled") ;
hold on
scatter(sl(v="Virginica"),sw( v="Virginica") ," b","filled" ) ;
scatter(sl(v="Versicolor"),sw( v="Versicolor") ," g" ,"filled") ;
hold off
xlabel('sepal lenght');
ylabel('sepal width');

subplot(3,4,5)
scatter(sl(v="Setosa"),pl( v="Setosa") ," r" ,"filled") ;
hold on
scatter(sl(v="Virginica"),pl( v="Virginica") ," b","filled" ) ;
scatter(sl(v="Versicolor"),pl( v="Versicolor") ," g" ,"filled") ;
hold off
xlabel('sepal lenght');
ylabel('patel lenght');

subplot(3,4,9)
scatter(sl(v="Setosa"),pw( v="Setosa") ," r" ,"filled") ;
hold on
scatter(sl(v="Virginica"),pw( v="Virginica") ," b","filled" ) ;
scatter(sl(v="Versicolor"),pw( v="Versicolor") ," g" ,"filled") ;
hold off
xlabel('sepal lenght');
ylabel('patel width');

subplot(3,4,2)
scatter(sw(v="Setosa"),sl( v="Setosa") ," r" ,"filled") ;
hold on
scatter(sw(v="Virginica"),sl( v="Virginica") ," b","filled" ) ;
scatter(sw(v="Versicolor"),sl( v="Versicolor") ," g" ,"filled") ;
hold off
xlabel('sepal width');
ylabel('sepal lenght');

subplot(3,4,6)
scatter(sw(v="Setosa"),pl( v="Setosa") ," r" ,"filled") ;
hold on
scatter(sw(v="Virginica"),pl( v="Virginica") ," b","filled" ) ;
scatter(sw(v="Versicolor"),pl( v="Versicolor") ," g" ,"filled") ;
hold off
xlabel('sepal width');
ylabel('patel lenght');

subplot(3,4,10)
scatter(sw(v="Setosa"),pw( v="Setosa") ," r" ,"filled") ;
hold on
scatter(sw(v="Virginica"),pw( v="Virginica") ," b","filled" ) ;
scatter(sw(v="Versicolor"),pw( v="Versicolor") ," g" ,"filled") ;
hold off
xlabel('sepal width');
ylabel('patel width');
subplot(3,4,3)
scatter(pl(v="Setosa"),sl( v="Setosa") ," r" ,"filled") ;
hold on
scatter(pl(v="Virginica"),sl( v="Virginica") ," b","filled" ) ;
scatter(pl(v="Versicolor"),sl( v="Versicolor") ," g" ,"filled") ;
hold off
xlabel('patel lenght');
ylabel('sepal lenght');

subplot(3,4,7)
scatter(pl(v="Setosa"),sw( v="Setosa") ," r" ,"filled") ;
hold on
scatter(pl(v="Virginica"),sw( v="Virginica") ," b","filled" ) ;
scatter(pl(v="Versicolor"),sw( v="Versicolor") ," g" ,"filled") ;
hold off
xlabel('patel lenght');
ylabel('sepal width');

subplot(3,4,11)
scatter(pl(v="Setosa"),pw( v="Setosa") ," r" ,"filled") ;
hold on
scatter(pl(v="Virginica"),pw( v="Virginica") ," b","filled" ) ;
scatter(pl(v="Versicolor"),pw( v="Versicolor") ," g" ,"filled") ;
hold off
xlabel('patel lenght');
ylabel('patel width');

subplot(3,4,4)
scatter(pw(v="Setosa"),sl( v="Setosa") ," r" ,"filled") ;
hold on
scatter(pw(v="Virginica"),sl( v="Virginica") ," b","filled" ) ;
scatter(pw(v="Versicolor"),sl( v="Versicolor") ," g" ,"filled") ;
hold off
xlabel('patel width');
ylabel('sepal lenght');

subplot(3,4,8)
scatter(pw(v="Setosa"),sw( v="Setosa") ," r" ,"filled") ;
hold on
scatter(pw(v="Virginica"),sw( v="Virginica") ," b","filled" ) ;
scatter(pw(v="Versicolor"),sw( v="Versicolor") ," g" ,"filled") ;
hold off
xlabel('patel width');
ylabel('sepal width');

subplot(3,4,12)
scatter(pw(v="Setosa"),pl( v="Setosa") ," r" ,"filled") ;
hold on
scatter(pw(v="Virginica"),pl( v="Virginica") ," b","filled" ) ;
scatter(pw(v="Versicolor"),pl( v="Versicolor") ," g" ,"filled") ;
hold off
xlabel('patel width');
ylabel('patel lenght');
