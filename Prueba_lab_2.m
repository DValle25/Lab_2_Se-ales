clc;close all;clear;
dom=input("Ingrese el numero 1 para señal discreta o 2 para señal continua");
while dom~=1 && dom~=2
    dom=input("Opcion no valida, por favor ingrese el numero 1 para señal discreta o 2 para señal continua");
end
xcon=input("Seleccione la señal que desea anclar al eje (X)\n" + ...
    "1. Señal triangular.\n" + ...
    "2. Señal cuadrada.\n" + ...
    "3. Señal exponencial decreciente.\n" + ...
    "4. Señal exponencial creciente.");
while xcon~=1 && xcon~=2 && xcon~=3 && xcon~=4
    disp("opcion no valida.\n")
    xcon=input("Seleccione la señal que desea anclar al eje (X)\n" + ...
    "1. Señal triangular.\n" + ...
    "2. Señal cuadrada.\n" + ...
    "3. Señal exponencial decreciente.\n" + ...
    "4. Señal exponencial creciente.");
end
hcon=input("Seleccione la señal que desea anclar al eje (X)\n" + ...
    "1. Señal triangular.\n" + ...
    "2. Señal cuadrada.\n" + ...
    "3. Señal exponencial decreciente.\n" + ...
    "4. Señal exponencial creciente.");
while hcon~=1 && hcon~=2 && hcon~=3 && hcon~=4
    disp("opcion no valida.\n")
    hcon=input("Seleccione la señal que desea anclar al eje (X)\n" + ...
    "1. Señal triangular.\n" + ...
    "2. Señal cuadrada.\n" + ...
    "3. Señal exponencial decreciente.\n" + ...
    "4. Señal exponencial creciente.");
end
%-------------Variables globales--------------------
if dom==1
    delta=1;
else
    delta=0.0001;
end
%---------parametros de x------------------
pix=-1;
pfx=5;
Ax=0.5;
lx=pfx-pix+1;
tx=pix:delta:pfx;
%------Parametros de h-------------------------
pih=-1;
pfh=7;
Ah=1;
lh=pfh-pih+1;
th=pih:delta:pfh;
%-------triangular------------------
if xcon==1 
    disp("Hola x_con=1")
    if dom==1 
        disp("Hola x_con=1 stem")
        x=Ax*tripuls(tx-(pix+pfx)/2,pfx-pix,0);
        subplot(2,1,1)
        stem(tx,x)
        title("x[n]")
    end
    if dom==2
        disp("Hola x_con=1 plot")
        x=Ax*tripuls(tx-(pix+pfx)/2,pfx-pix,0);
        subplot(2,1,1)
        plot(tx,x)
        title("x(t)")
    end
end
if hcon==1
    if dom==1
        h=Ah*tripuls(th-(pih+pfh)/2,pfh-pih,0);
        subplot(2,1,2)
        stem(th,h)
        title("h[n]")
    end
   if dom==2
        h=Ah*tripuls(th-(pih+pfh)/2,pfh-pih,0);
        subplot(2,1,2)
        plot(th,h)
        title("h(t)")
    end
end
%----------Señal cuadrada----------------
if xcon==2 || hcon==2
    if xcon==2
        x=Ax*(ones(1,length(tx)));
    end
    if hcon==2
        h=Ah*(ones(1,length(th)));
    end
    if dom==1 && xcon==2
        subplot(2,1,1)
        tc=pix-delta:delta:(pfx+delta);
        xc=[zeros(1,1) x zeros(1,1)];
        stem(tc,xc)
        title("x[n]")
    elseif dom==2 && xcon==2
        subplot(2,1,1)
        tc=pix-delta:delta:(pfx+delta);
        xc=[zeros(1,1) x zeros(1,1)];
        plot(tc,xc)
        title("x(t)")
    end
     if dom==1 && hcon==2
        subplot(2,1,2)
        tc=pih-delta:delta:(pfh+delta);
        hc=[zeros(1,1) h zeros(1,1)];
        stem(tc,hc)
        title("h[n]")
    elseif dom==2 && hcon==2
        subplot(2,1,2)
        tc=pih-delta:delta:(pfh+delta);
        hc=[zeros(1,1) h zeros(1,1)];
        plot(tc,hc)
        title("h(t)")
    end
end
%----------Exponencial decreciente-------------------
if xcon==3 || hcon==3
    if dom==1 && xcon==3
        x=exp(-tx*Ax);
        subplot(2,1,1)
        stem(tx,x)
        title("x[n]")
    elseif dom==2 && xcon==3
        x=exp(-tx*Ax);
        subplot(2,1,1)
        plot(tx,x)
        title("x(t)")
    end
    if dom==1 && hcon==3
        h=exp(-th*Ah);
        subplot(2,1,2)
        stem(th,h)
        title("h[n]")
    elseif dom==2 && hcon==3
        h=exp(-th*Ah);
        subplot(2,1,2)
        plot(th,h)
        title("h(t)")
    end
end
%---------------exponencial creciente----------
if xcon==4 || hcon==4
    if dom==1 && xcon==4
        x=exp(tx*Ax);
        subplot(2,1,1)
        stem(tx,x)
        title("x[n]")
    elseif dom==2 && xcon==4
        x=exp(tx*Ax);
        subplot(2,1,1)
        plot(tx,x)
        title("x(t)")
    end
    if dom==1 && hcon==4
        h=exp(th*Ah);
        subplot(2,1,2)
        stem(th,h)
        title("h[n]")
    elseif dom==2 && hcon==4
        h=exp(th*Ah);
        subplot(2,1,2)
        plot(th,h)
        title("h(t)")
    end
end
figure (2)
eje=pix-lh:delta:pfx+lh;
pause
for i=0:lx+lh-2
    pause(0.5 )   %----defino la señal x en terminos de K o Tao
    x_k=[zeros(1,lh*1/delta) x zeros(1,lh*1/delta)];
    subplot(221)
    if dom==1
        stem(eje,x_k)
        title("x[k]")
    elseif dom==2
        plot(eje,x_k)
        title("x(tao)")
    end
    %------------defino h-k
    h_menosk=[zeros(1,(i+1)/delta) h(end:-1:1) zeros(1,(lx+lh-1-i)/delta)];
    subplot(223)
    if dom==1
        stem(eje,h_menosk)
        title("h[n-k]")
    elseif dom==2
        plot(eje,h_menosk)
        title("h(t-tao)")
    end
    %-----------defino la multiplicacion de x_k y h n-k 
    subplot(222)
    if dom==1
        stem(eje,(x_k.*h_menosk));
        title("x[k]h[n-k]")
        xlabel("k")
    else
        plot(eje,(x_k.*h_menosk));
        title("x[tao]h[t-tao]")
        xlabel("k")
    end
    %-----------defino la convolucion------------
    y(i+1)=sum(x_k.*h_menosk);
    subplot(224)
    if dom==1
        stem((pix+pih):(pfx+pfh),[y zeros(1,lx+lh-2-i)])
        title("y[n]")
    elseif dom==2
        plot((pix+pih):(pfx+pfh),([y zeros(1,lx+lh-2-i)])*delta)
        title("y(t)")
    end
end