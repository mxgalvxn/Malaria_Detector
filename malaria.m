%Fernanda Monserrat Galván Romero A00344712
%Santiago González de Cosío Romero A01640329
%Javier Alejandro Morales Rivadeneyra A01632535
%Sofia del Pilar Batiz Martinez A01634125


function varargout = RetoMAlaria_util(varargin)
% RetoMAlaria_util MATLAB code for RetoMAlaria_util.fig
%      RetoMAlaria_util, by itself, creates a new RetoMAlaria_util or raises the existing
%      singleton*.
%
%      H = RetoMAlaria_util returns the handle to a new RetoMAlaria_util or the handle to
%      the existing singleton*.
%
%      RetoMAlaria_util('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RetoMAlaria_util.M with the given input arguments.
%
%      RetoMAlaria_util('Property','Value',...) creates a new RetoMAlaria_util or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RetoMAlaria_util_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RetoMAlaria_util_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RetoMAlaria_util

% Last Modified by GUIDE v2.5 02-May-2021 17:35:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RetoMAlaria_util_OpeningFcn, ...
                   'gui_OutputFcn',  @RetoMAlaria_util_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before RetoMAlaria_util is made visible.
function RetoMAlaria_util_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RetoMAlaria_util (see VARARGIN)

% Choose default command line output for RetoMAlaria_util
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RetoMAlaria_util wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RetoMAlaria_util_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
rotate3d on
global Contador
Contador = 0;
set(handles.pushbutton1,'Enable','on');
global globuloi;
globuloi = 0;
set(handles.text14,'string','');
set(handles.text14,'BackgroundColor',[.94 .94 .94]);
global GLOBULO1
global GLOBULO2
global GLOBULO3
global GLOBULO4
global GLOBULO5 
GLOBULO1 = {'' '' '' '' '' '' ''};
GLOBULO2 = {'' '' '' '' '' '' ''};
GLOBULO3 = {'' '' '' '' '' '' ''};
GLOBULO4 = {'' '' '' '' '' '' ''};
GLOBULO5 = {'' '' '' '' '' '' ''};

datos  = [GLOBULO1' GLOBULO2' GLOBULO3' GLOBULO4' GLOBULO5'];
set(handles.uitable1,'data',datos);

cla;
largo1 = get(handles.slider3,'Value');
Q=20e-8;
v = 0.5;
ancho = .5;
largo = get(hObject,'Value');
movX = get(handles.slider4,'Value');

%VERTICES Y CARAS DE LÁMINA (+)
           % x               y        z
vertices = [-v*ancho-movX  -v*largo  -v; %v1
            -v*ancho-movX   v*largo  -v; %v2
             v*ancho-movX   v*largo  -v; %v3
             v*ancho-movX  -v*largo  -v; %v4
            -v*ancho-movX  -v*largo   v; %v5
            -v*ancho-movX   v*largo   v; %v6
             v*ancho-movX   v*largo   v; %v7
             v*ancho-movX  -v*largo   v]; %v8
         
caras = [1 5 8 4; %c1
         1 5 6 2; %c2
         2 3 7 6; %c3
         3 4 8 7; %c4
         5 6 7 8; %c5
         1 2 3 4]; %c6

V1 = -v*ancho-movX;
V2= -v*ancho+movX;
%VERTICES Y CARAS DE LÁMINA (-)
           % x               y        z
vertices2 = [-v*ancho+movX  -v*largo1  -v; %v1
            -v*ancho+movX   v*largo1  -v; %v2
             v*ancho+movX   v*largo1  -v; %v3
             v*ancho+movX  -v*largo1  -v; %v4
            -v*ancho+movX  -v*largo1   v; %v5
            -v*ancho+movX   v*largo1   v; %v6
             v*ancho+movX   v*largo1   v; %v7
             v*ancho+movX  -v*largo1   v]; %v8

%Crear grid
N=15;
minX=-5;maxX=+5;
minY=-5;maxY=+5;
minX2=-5;maxX2=+5;
minY2=-5;maxY2=0;
x=linspace(minX,maxX,N);
y=linspace(minY,maxY,N);
[xG,yG]=meshgrid(x,y);
zGrid = xG * 0;


%posicion de la particula negativa
xCn=movX; yCn =largo/2; 
xCn2=movX; yCn2 =-largo/2;
xCn3 = movX; yCn3 =0;
xCn4 = movX; yCn4 =largo/4;
xCn5 = movX; yCn5 =-largo/4;
%posicion de la particula postitiva
xCp=-movX; yCp=(largo/2);
xCp2=-movX; yCp2=(-largo/2);
xCp3=-movX; yCp3 =0;
xCp4=-movX; yCp4=(largo/4);
xCp5=-movX; yCp5=(-largo/4);
%campo electrico
Qn=-Q;
Qp=+Q;
kC = 9e9;
%CAMPO ELECTRICO 
%C1
Rx = xG - xCp;
Ry = yG - yCp;
Rz = zGrid;
R = sqrt(Rx.^2 + Ry.^2+Rz.^2).^3;
Ex = kC .* Qp .* Rx ./ R;
Ey = kC .* Qp .* Ry ./ R;
Ez = kC .* Qn .* Rz ./ R;

%C4
Rx = xG - xCn;
Ry = yG - yCn;
Rz = zGrid;
R = sqrt(Rx.^2 + Ry.^2+Rz.^2).^3;
Ex = Ex + kC .* Qn .* Rx ./ R;
Ey = Ey + kC .* Qn .* Ry ./ R;
Ez = Ez + kC .* Qn .* Rz ./ R;

%CAMPO ELECTRICO 2
%C2
Rx3 = xG - xCp3;
Ry3 = yG - yCp3;
Rz3 = zGrid;
R3 = sqrt(Rx3.^2 + Ry3.^2+ Rz3.^2).^3;
Ex3 = Ex + kC .* Qp .* Rx3 ./ R3;
Ey3 = Ey + kC .* Qp .* Ry3 ./ R3;
Ez3 = Ez + kC .* Qn .* Rz3 ./ R3;

%C5
Rx3 = xG - xCn3;
Ry3 = yG - yCn3;
Rz3 = zGrid;
R3 = sqrt(Rx3.^2 + Ry3.^2 + Rz3.^2 ).^3;
Ex3 = Ex3 + kC .* Qn .* Rx3 ./ R3;
Ey3 = Ey3 + kC .* Qn .* Ry3 ./ R3;
Ez3 = Ez3 + kC .* Qn .* Rz3 ./ R3;

%campo electrico 3
Rx2 = xG - xCp2;
Ry2 = yG - yCp2;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2 + Rz2.^2).^3;
Ex2 = Ex3 + kC .* Qp .* Rx2 ./ R2;
Ey2 = Ey3 + kC .* Qp .* Ry2 ./ R2;
Ez2 = Ez3 + kC .* Qn .* Rz2 ./ R2;

%C6
Rx2 = xG - xCn2;
Ry2 = yG - yCn2;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2+Rz.^2).^3;
Ex2 = Ex2 + kC .* Qn .* Rx2 ./ R2;
Ey2 = Ey2 + kC .* Qn .* Ry2 ./ R2;
Ez2 = Ez2 + kC .* Qn .* Rz2 ./ R2;

%c7
Rx2 = xG - xCp4;
Ry2 = yG - yCp4;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2 + Rz2.^2).^3;
Ex2 = Ex2 + kC .* Qp .* Rx2 ./ R2;
Ey2 = Ey2 + kC .* Qp .* Ry2 ./ R2;
Ez2 = Ez2 + kC .* Qn .* Rz2 ./ R2;

%C8
Rx2 = xG - xCn4;
Ry2 = yG - yCn4;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2+Rz.^2).^3;
Ex2 = Ex2 + kC .* Qn .* Rx2 ./ R2;
Ey2 = Ey2 + kC .* Qn .* Ry2 ./ R2;
Ez2 = Ez2 + kC .* Qn .* Rz2 ./ R2;

Rx2 = xG - xCp5;
Ry2 = yG - yCp5;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2 + Rz2.^2).^3;
Ex2 = Ex2 + kC .* Qp .* Rx2 ./ R2;
Ey2 = Ey2 + kC .* Qp .* Ry2 ./ R2;
Ez2 = Ez2+ kC .* Qn .* Rz2 ./ R2;

%C10
Rx2 = xG - xCn5;
Ry2 = yG - yCn5;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2+Rz.^2).^3;
Ex2 = Ex2 + kC .* Qn .* Rx2 ./ R2;
Ey2 = Ey2 + kC .* Qn .* Ry2 ./ R2;
Ez2 = Ez2 + kC .* Qn .* Rz2 ./ R2;


E = sqrt(Ex2.^2 + Ey2.^2 + Ez2.^2);

%componentes x, y
u = Ex2./E;
v = Ey2./E;
k=Ez2 ./E *0;
hold on;

h=quiver3(xG,yG,zGrid,u,v,k);

set(h,'Color','blue')


patch('Faces',caras,'Vertices',vertices,'FaceColor','r');
patch('Faces',caras,'Vertices',vertices2,'FaceColor','b');
axis([-5 5 -5 5 -5 5]);
xlabel('x');
ylabel('y');
zlabel('z');
%view(30,30); %Establecer la vista de el espacio 3D

text(movX-.2,0,1,'-','Color','white','FontSize',20);
text(-movX-.2,0,1,'+','Color','white','FontSize',20);

hold off;

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)



% Hint: place code in OpeningFcn to populate axes1


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
rotate3d 
global Contador
Contador = 0;
set(handles.pushbutton1,'Enable','on');
global globuloi;
globuloi = 0;
set(handles.text14,'string','');
set(handles.text14,'BackgroundColor',[.94 .94 .94]);
global GLOBULO1
global GLOBULO2
global GLOBULO3
global GLOBULO4
global GLOBULO5 
GLOBULO1 = {'' '' '' '' '' '' ''};
GLOBULO2 = {'' '' '' '' '' '' ''};
GLOBULO3 = {'' '' '' '' '' '' ''};
GLOBULO4 = {'' '' '' '' '' '' ''};
GLOBULO5 = {'' '' '' '' '' '' ''};
datos  = [GLOBULO1' GLOBULO2' GLOBULO3' GLOBULO4' GLOBULO5'];
set(handles.uitable1,'data',datos);

cla;
largo1 = get(hObject,'Value');
Q=20;
v = 0.5;
ancho = .5;
largo = get(handles.slider1,'Value');
movX = get(handles.slider4,'Value');
%VERTICES Y CARAS DE LÁMINA (+)
           % x               y        z
vertices = [-v*ancho-movX  -v*largo  -v; %v1
            -v*ancho-movX   v*largo  -v; %v2
             v*ancho-movX   v*largo  -v; %v3
             v*ancho-movX  -v*largo  -v; %v4
            -v*ancho-movX  -v*largo   v; %v5
            -v*ancho-movX   v*largo   v; %v6
             v*ancho-movX   v*largo   v; %v7
             v*ancho-movX  -v*largo   v]; %v8
         
caras = [1 5 8 4; %c1
         1 5 6 2; %c2
         2 3 7 6; %c3
         3 4 8 7; %c4
         5 6 7 8; %c5
         1 2 3 4]; %c6

V1 = -v*ancho-movX;
V2= -v*ancho+movX;
%VERTICES Y CARAS DE LÁMINA (-)
           % x               y        z
vertices2 = [-v*ancho+movX  -v*largo1  -v; %v1
            -v*ancho+movX   v*largo1  -v; %v2
             v*ancho+movX   v*largo1  -v; %v3
             v*ancho+movX  -v*largo1  -v; %v4
            -v*ancho+movX  -v*largo1   v; %v5
            -v*ancho+movX   v*largo1   v; %v6
             v*ancho+movX   v*largo1   v; %v7
             v*ancho+movX  -v*largo1   v]; %v8

%Crear grid
N=15;
minX=-5;maxX=+5;
minY=-5;maxY=+5;
x=linspace(minX,maxX,N);
y=linspace(minY,maxY,N);
[xG,yG]=meshgrid(x,y);
zGrid = xG * 0;


%posicion de la particula negativa
xCn=movX; yCn =largo1/2; 
xCn2=movX; yCn2 =-largo1/2;
xCn3 = movX; yCn3 =0;
xCn4 = movX; yCn4 =largo1/4;
xCn5 = movX; yCn5 =-largo1/4;
%posicion de la particula postitiva
xCp=-movX; yCp=(largo/2);
xCp2=-movX; yCp2=(-largo/2);
xCp3=-movX; yCp3 =0;
xCp4=-movX; yCp4=(largo/4);
xCp5=-movX; yCp5=(-largo/4);
%campo electrico
Qn=-Q;
Qp=+Q;
kC = 9e9;
%CAMPO ELECTRICO 
%C1
Rx = xG - xCp;
Ry = yG - yCp;
Rz = zGrid;
R = sqrt(Rx.^2 + Ry.^2+Rz.^2).^3;
Ex = kC .* Qp .* Rx ./ R;
Ey = kC .* Qp .* Ry ./ R;
Ez = kC .* Qn .* Rz ./ R;

%C4
Rx = xG - xCn;
Ry = yG - yCn;
Rz = zGrid;
R = sqrt(Rx.^2 + Ry.^2+Rz.^2).^3;
Ex = Ex + kC .* Qn .* Rx ./ R;
Ey = Ey + kC .* Qn .* Ry ./ R;
Ez = Ez + kC .* Qn .* Rz ./ R;

%CAMPO ELECTRICO 2
%C2
Rx3 = xG - xCp3;
Ry3 = yG - yCp3;
Rz3 = zGrid;
R3 = sqrt(Rx3.^2 + Ry3.^2+ Rz3.^2).^3;
Ex3 = Ex + kC .* Qp .* Rx3 ./ R3;
Ey3 = Ey + kC .* Qp .* Ry3 ./ R3;
Ez3 = Ez + kC .* Qn .* Rz3 ./ R3;

%C5
Rx3 = xG - xCn3;
Ry3 = yG - yCn3;
Rz3 = zGrid;
R3 = sqrt(Rx3.^2 + Ry3.^2 + Rz3.^2 ).^3;
Ex3 = Ex3 + kC .* Qn .* Rx3 ./ R3;
Ey3 = Ey3 + kC .* Qn .* Ry3 ./ R3;
Ez3 = Ez3 + kC .* Qn .* Rz3 ./ R3;

%campo electrico 3
Rx2 = xG - xCp2;
Ry2 = yG - yCp2;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2 + Rz2.^2).^3;
Ex2 = Ex3 + kC .* Qp .* Rx2 ./ R2;
Ey2 = Ey3 + kC .* Qp .* Ry2 ./ R2;
Ez2 = Ez3 + kC .* Qn .* Rz2 ./ R2;

%C6
Rx2 = xG - xCn2;
Ry2 = yG - yCn2;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2+Rz.^2).^3;
Ex2 = Ex2 + kC .* Qn .* Rx2 ./ R2;
Ey2 = Ey2 + kC .* Qn .* Ry2 ./ R2;
Ez2 = Ez2 + kC .* Qn .* Rz2 ./ R2;

%c7
Rx2 = xG - xCp4;
Ry2 = yG - yCp4;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2 + Rz2.^2).^3;
Ex2 = Ex2 + kC .* Qp .* Rx2 ./ R2;
Ey2 = Ey2 + kC .* Qp .* Ry2 ./ R2;
Ez2 = Ez2 + kC .* Qn .* Rz2 ./ R2;

%C8
Rx2 = xG - xCn4;
Ry2 = yG - yCn4;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2+Rz.^2).^3;
Ex2 = Ex2 + kC .* Qn .* Rx2 ./ R2;
Ey2 = Ey2 + kC .* Qn .* Ry2 ./ R2;
Ez2 = Ez2 + kC .* Qn .* Rz2 ./ R2;

Rx2 = xG - xCp5;
Ry2 = yG - yCp5;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2 + Rz2.^2).^3;
Ex2 = Ex2 + kC .* Qp .* Rx2 ./ R2;
Ey2 = Ey2 + kC .* Qp .* Ry2 ./ R2;
Ez2 = Ez2 + kC .* Qn .* Rz2 ./ R2;

%C10
Rx2 = xG - xCn5;
Ry2 = yG - yCn5;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2+Rz.^2).^3;
Ex2 = Ex2 + kC .* Qn .* Rx2 ./ R2;
Ey2 = Ey2 + kC .* Qn .* Ry2 ./ R2;
Ez2 = Ez2 + kC .* Qn .* Rz2 ./ R2;


E = sqrt(Ex2.^2 + Ey2.^2 + Ez2.^2);

%componentes x, y
u = Ex2./E;
v = Ey2./E;
k=Ez2 ./E *0;
hold on;

h=quiver3(xG,yG,zGrid,u,v,k);

set(h,'Color','blue')


patch('Faces',caras,'Vertices',vertices,'FaceColor','r');
patch('Faces',caras,'Vertices',vertices2,'FaceColor','b');
axis([-5 5 -5 5 -5 5]);
xlabel('x');
ylabel('y');
zlabel('z');
%view(30,30); %Establecer la vista de el espacio 3D

text(movX-.2,0,1,'-','Color','white','FontSize',20);
text(-movX-.2,0,1,'+','Color','white','FontSize',20);

hold off;

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
rotate3d on
global Contador
Contador = 0;
set(handles.pushbutton1,'Enable','on');
global globuloi;
globuloi = 0;
set(handles.text14,'string','');
set(handles.text14,'BackgroundColor',[.94 .94 .94]);

global GLOBULO1
global GLOBULO2
global GLOBULO3
global GLOBULO4
global GLOBULO5 
GLOBULO1 = {'' '' '' '' '' '' ''};
GLOBULO2 = {'' '' '' '' '' '' ''};
GLOBULO3 = {'' '' '' '' '' '' ''};
GLOBULO4 = {'' '' '' '' '' '' ''};
GLOBULO5 = {'' '' '' '' '' '' ''};
datos  = [GLOBULO1' GLOBULO2' GLOBULO3' GLOBULO4' GLOBULO5'];
set(handles.uitable1,'data',datos);

cla;
largo1 = get(handles.slider3,'Value');
Q=20;
v = 0.5;
ancho = .5;
largo = get(handles.slider1,'Value');
movX = get(hObject,'Value');

%VERTICES Y CARAS DE LÁMINA (+)
           % x               y        z
vertices = [-v*ancho-movX  -v*largo  -v; %v1
            -v*ancho-movX   v*largo  -v; %v2
             v*ancho-movX   v*largo  -v; %v3
             v*ancho-movX  -v*largo  -v; %v4
            -v*ancho-movX  -v*largo   v; %v5
            -v*ancho-movX   v*largo   v; %v6
             v*ancho-movX   v*largo   v; %v7
             v*ancho-movX  -v*largo   v]; %v8
         
caras = [1 5 8 4; %c1
         1 5 6 2; %c2
         2 3 7 6; %c3
         3 4 8 7; %c4
         5 6 7 8; %c5
         1 2 3 4]; %c6

V1 = -v*ancho-movX;
V2= -v*ancho+movX;
%VERTICES Y CARAS DE LÁMINA (-)
           % x               y        z
vertices2 = [-v*ancho+movX  -v*largo1  -v; %v1
            -v*ancho+movX   v*largo1  -v; %v2
             v*ancho+movX   v*largo1  -v; %v3
             v*ancho+movX  -v*largo1  -v; %v4
            -v*ancho+movX  -v*largo1   v; %v5
            -v*ancho+movX   v*largo1   v; %v6
             v*ancho+movX   v*largo1   v; %v7
             v*ancho+movX  -v*largo1   v]; %v8

%Crear grid
N=15;
minX=-5;maxX=+5;
minY=-5;maxY=+5;
x=linspace(minX,maxX,N);
y=linspace(minY,maxY,N);
[xG,yG]=meshgrid(x,y);
zGrid = xG * 0;


%posicion de la particula negativa
xCn=movX; yCn =largo/2; 
xCn2=movX; yCn2 =-largo/2;
xCn3 = movX; yCn3 =0;
xCn4 = movX; yCn4 =largo/4;
xCn5 = movX; yCn5 =-largo/4;
%posicion de la particula postitiva
xCp=-movX; yCp=(largo/2);
xCp2=-movX; yCp2=(-largo/2);
xCp3=-movX; yCp3 =0;
xCp4=-movX; yCp4=(largo/4);
xCp5=-movX; yCp5=(-largo/4);
%campo electrico
Qn=-Q;
Qp=+Q;
kC = 9e9;
%CAMPO ELECTRICO 
%C1
Rx = xG - xCp;
Ry = yG - yCp;
Rz = zGrid;
R = sqrt(Rx.^2 + Ry.^2+Rz.^2).^3;
Ex = kC .* Qp .* Rx ./ R;
Ey = kC .* Qp .* Ry ./ R;
Ez = kC .* Qn .* Rz ./ R;

%C4
Rx = xG - xCn;
Ry = yG - yCn;
Rz = zGrid;
R = sqrt(Rx.^2 + Ry.^2+Rz.^2).^3;
Ex = Ex + kC .* Qn .* Rx ./ R;
Ey = Ey + kC .* Qn .* Ry ./ R;
Ez = Ez + kC .* Qn .* Rz ./ R;

%CAMPO ELECTRICO 2
%C2
Rx3 = xG - xCp3;
Ry3 = yG - yCp3;
Rz3 = zGrid;
R3 = sqrt(Rx3.^2 + Ry3.^2+ Rz3.^2).^3;
Ex3 = Ex + kC .* Qp .* Rx3 ./ R3;
Ey3 = Ey + kC .* Qp .* Ry3 ./ R3;
Ez3 = Ez + kC .* Qn .* Rz3 ./ R3;

%C5
Rx3 = xG - xCn3;
Ry3 = yG - yCn3;
Rz3 = zGrid;
R3 = sqrt(Rx3.^2 + Ry3.^2 + Rz3.^2 ).^3;
Ex3 = Ex3 + kC .* Qn .* Rx3 ./ R3;
Ey3 = Ey3 + kC .* Qn .* Ry3 ./ R3;
Ez3 = Ez3 + kC .* Qn .* Rz3 ./ R3;

%campo electrico 3
Rx2 = xG - xCp2;
Ry2 = yG - yCp2;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2 + Rz2.^2).^3;
Ex2 = Ex3 + kC .* Qp .* Rx2 ./ R2;
Ey2 = Ey3 + kC .* Qp .* Ry2 ./ R2;
Ez2 = Ez3 + kC .* Qn .* Rz2 ./ R2;

%C6
Rx2 = xG - xCn2;
Ry2 = yG - yCn2;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2+Rz.^2).^3;
Ex2 = Ex2 + kC .* Qn .* Rx2 ./ R2;
Ey2 = Ey2 + kC .* Qn .* Ry2 ./ R2;
Ez2 = Ez2 + kC .* Qn .* Rz2 ./ R2;

%c7
Rx2 = xG - xCp4;
Ry2 = yG - yCp4;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2 + Rz2.^2).^3;
Ex2 = Ex2 + kC .* Qp .* Rx2 ./ R2;
Ey2 = Ey2 + kC .* Qp .* Ry2 ./ R2;
Ez2 = Ez2 + kC .* Qn .* Rz2 ./ R2;

%C8
Rx2 = xG - xCn4;
Ry2 = yG - yCn4;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2+Rz.^2).^3;
Ex2 = Ex2 + kC .* Qn .* Rx2 ./ R2;
Ey2 = Ey2 + kC .* Qn .* Ry2 ./ R2;
Ez2 = Ez2 + kC .* Qn .* Rz2 ./ R2;

Rx2 = xG - xCp5;
Ry2 = yG - yCp5;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2 + Rz2.^2).^3;
Ex2 = Ex2 + kC .* Qp .* Rx2 ./ R2;
Ey2 = Ey2 + kC .* Qp .* Ry2 ./ R2;
Ez2 = Ez2 + kC .* Qn .* Rz2 ./ R2;

%C10
Rx2 = xG - xCn5;
Ry2 = yG - yCn5;
Rz2 = zGrid;
R2 = sqrt(Rx2.^2 + Ry2.^2+Rz.^2).^3;
Ex2 = Ex2 + kC .* Qn .* Rx2 ./ R2;
Ey2 = Ey2 + kC .* Qn .* Ry2 ./ R2;
Ez2 = Ez2 + kC .* Qn .* Rz2 ./ R2;


E = sqrt(Ex2.^2 + Ey2.^2 + Ez2.^2);

%componentes x, y
u = Ex2./E;
v = Ey2./E;
k=Ez2 ./E *0;
hold on;

h=quiver3(xG,yG,zGrid,u,v,k);

set(h,'Color','blue')


patch('Faces',caras,'Vertices',vertices,'FaceColor','r');
patch('Faces',caras,'Vertices',vertices2,'FaceColor','b');
axis([-5 5 -5 5 -5 5]);
xlabel('x');
ylabel('y');
zlabel('z');
%view(30,30); %Establecer la vista de el espacio 3D

text(movX-.2,0,1,'-','Color','white','FontSize',20);
text(-movX-.2,0,1,'+','Color','white','FontSize',20);

hold off;


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global Contador
global GLOBULO1
global GLOBULO2
global GLOBULO3
global GLOBULO4
global GLOBULO5 
global xG
global yG
global zGrid
Contador = Contador+1;
rotate3d on
global globuloi;
  
valorX = get(handles.slider4,'Value')-.3;
valorY1 = get(handles.slider1,'Value');
valorY2 = get(handles.slider3,'Value');
valorY = 0;
valorX = round(valorX)*100;


if valorY1<valorY2
    valorY = valorY1;
elseif valorY1 >valorY2 
    valorY = valorY2;
else 
    valorY = valorY1;
end    
valorY = round(valorY)*100;
PosX = randi([-valorX,valorX],1,1)/100;

PosY = randi([-valorY,valorY],1,1)/100

PosZ=0;

hold on;
Radioesfera = .5;
[x,y,z] = sphere(10);
x = x*Radioesfera;
y = y*Radioesfera;
z = z*Radioesfera;

surf(x+PosX,y+PosY,z,'FaceColor','r','EdgeColor','r','FaceAlpha',.3);

d=  randi([0,400],1,1)/1000;
RadioCargasG = .05;
[x,y,z] = sphere(12);
x = x*RadioCargasG;
y = y*RadioCargasG;
z = z*RadioCargasG;
surf(x+PosX+d,y+PosY,z,'FaceColor','black','EdgeColor','black');
surf(x+PosX-d,y+PosY,z,'FaceColor','black','EdgeColor','black');
%Crear carga E1

Q=1.6e-19;
%campo electrico del globulo
Qn=-Q;
Qp=+Q;
kC = 9e9;
Rx = xG-PosX+d;
Ry = yG-PosY;
Rz = zGrid-PosZ;
R = sqrt(Rx.^2 + Ry.^2+ Rz.^2).^3;
Ex = kC .* Qn .* Rx ./ R;
Ey = kC .* Qn .* Ry ./ R;
Ez = kC .* Qn .* Rz ./ R;

Rx2 = xG-PosX-d;
Ry2 = yG-PosY;
Rz2 = zGrid -PosZ;
Ex2 = kC .* Qp .* Rx2 ./ R;
Ey2 = kC .* Qp .* Ry2 ./ R;
Ez2 = kC .* Qp .* Rz2 ./ R;
E2 = sqrt(Ex2.^2 + Ey2.^2+Ez2.^2);
E = sqrt(Ex.^2 + Ey.^2+Ez.^2);
E2 = sum(sum(E2));
E = sum(sum(E));
K = E2-E;
F = sum(sum(kC*abs(Qp*Qn)./R));
P = K/E2*100;


infectado = '';
if P > 30
    infectado = 'POSITIVO';
    globuloi = globuloi+ 1;
else
    infectado = 'NEGATIVO';
end
    

if Contador == 1
    GLOBULO1 = {PosX PosY K P d*2 infectado F};
    text(PosX+.3 , PosY,'G1','Color','black','FontSize',10);
elseif Contador == 2    
    GLOBULO2 = {PosX PosY K P d*2 infectado F};
    text(PosX+.3 , PosY,'G2','Color','black','FontSize',10);
elseif Contador == 3    
    GLOBULO3 = {PosX PosY K P d*2 infectado F};
    text(PosX+.3 , PosY,'G3','Color','black','FontSize',10);
elseif Contador == 4    
    GLOBULO4 = {PosX PosY K P d*2 infectado F}; 
    text(PosX +.3, PosY,'G4','Color','black','FontSize',10);
elseif Contador == 5   
    GLOBULO5 = {PosX PosY K P d*2 infectado F};  
    text(PosX+.3 , PosY,'G5','Color','black','FontSize',10);
    set(hObject,'Enable','off')
end

if globuloi >2 && Contador == 5 
    set(handles.text14,'string', 'EL PACIENTE ESTA INFECTADO')
    set(handles.text14,'BackgroundColor', 'r');
elseif  globuloi <2 && Contador == 5
    set(handles.text14,'string', 'EL PACIENTE ESTA SANO')
    set(handles.text14,'BackgroundColor', 'g');
end    
   
    datos  = [GLOBULO1' GLOBULO2' GLOBULO3' GLOBULO4' GLOBULO5'];
set(handles.uitable1,'data',datos);

hold off;




% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
global Contador
Contador = 0;
global GLOBULO1
global GLOBULO2
global GLOBULO3
global GLOBULO4
global GLOBULO5 
GLOBULO1 = {'' '' '' '' '' '' ''};
GLOBULO2 = {'' '' '' '' '' '' ''};
GLOBULO3 = {'' '' '' '' '' '' ''};
GLOBULO4 = {'' '' '' '' '' '' ''};
GLOBULO5 = {'' '' '' '' '' '' ''};
N=15;
minX=-5;maxX=+5;
minY=-5;maxY=+5;
x=linspace(minX,maxX,N);
y=linspace(minY,maxY,N);
global xG
global yG
global zGrid 
[xG,yG]=meshgrid(x,y);
zGrid = xG * 0;

global globuloi;
globuloi = 0;

set(hObject,'Enable','on')
