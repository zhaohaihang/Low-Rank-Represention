function varargout = mainUI(varargin)

% MAINUI MATLAB code for mainUI.fig
%      MAINUI, by itself, creates a new MAINUI or raises the existing
%      singleton*.
%
%      H = MAINUI returns the handle to a new MAINUI or the handle to
%      the existing singleton*.
%
%      MAINUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINUI.M with the given input arguments.
%
%      MAINUI('Property','Value',...) creates a new MAINUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mainUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mainUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mainUI

% Last Modified by GUIDE v2.5 24-May-2019 15:28:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mainUI_OpeningFcn, ...
                   'gui_OutputFcn',  @mainUI_OutputFcn, ...
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


% --- Executes just before mainUI is made visible.
function mainUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mainUI (see VARARGIN)

% Choose default command line output for mainUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mainUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mainUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Button_LRR.
%————————————————————————————————————————选择LRR算法
function Button_LRR_Callback(hObject, eventdata, handles)
% hObject    handle to Button_LRR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%global LRR_result ;
%全局变量在界面间传值更方便
global class_num;%类数
global sample_num;%样本数
sample_num=get(handles.sample_num,'String');%string类型，
class_num=get(handles.class_num,'String');%string类型，

LRRUI;%从Main界面调用LRR界面

function LRR_ACC_Callback(hObject, eventdata, handles)
% hObject    handle to LRR_ACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LRR_ACC as text
%        str2double(get(hObject,'String')) returns contents of LRR_ACC as a double


% --- Executes during object creation, after setting all properties.
function LRR_ACC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LRR_ACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LRR_NMI_Callback(hObject, eventdata, handles)
% hObject    handle to LRR_NMI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LRR_NMI as text
%        str2double(get(hObject,'String')) returns contents of LRR_NMI as a double


% --- Executes during object creation, after setting all properties.
function LRR_NMI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LRR_NMI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in LRR_save.
%————————————————————————————————————————保存LRR结果
function LRR_save_Callback(hObject, eventdata, handles)
% hObject    handle to LRR_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LRR_result ;%如果未计算，则默认是0
set(handles.LRR_ACC,'String',num2str(LRR_result(1,1)));%将LRR界面得到的数据显示在主界面
set(handles.LRR_NMI,'String',num2str(LRR_result(1,2)));
set(handles.LRR_purity,'String',num2str(LRR_result(1,3)));



function LRR_purity_Callback(hObject, eventdata, handles)
% hObject    handle to LRR_purity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LRR_purity as text
%        str2double(get(hObject,'String')) returns contents of LRR_purity as a double


% --- Executes during object creation, after setting all properties.
function LRR_purity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LRR_purity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function file_path_Callback(hObject, eventdata, handles)
% hObject    handle to file_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_path as text
%        str2double(get(hObject,'String')) returns contents of file_path as a double


% --- Executes during object creation, after setting all properties.
function file_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in select_data.
%————————————————————————————————————————选择数据集的路径，并显示及保为全局变量
function select_data_Callback(hObject, eventdata, handles)
% hObject    handle to select_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
folder_name = uigetdir;
set(handles.file_path,'String',folder_name);
 
global data_path;%数据集路径
data_path=folder_name;
%————————————————————————————
%[filename,filepath]=uigetfile('*.*','请选择文件');
%set(handles.file_path,'String',strcat(filepath,filename));
%global data_path;
%data_path=strcat(filepath,filename);



function sample_num_Callback(hObject, eventdata, handles)
% hObject    handle to sample_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sample_num as text
%        str2double(get(hObject,'String')) returns contents of sample_num as a double


% --- Executes during object creation, after setting all properties.
function sample_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sample_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function class_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sample_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in LatLLRR_save.
function class_num_Callback(hObject, eventdata, handles)
% hObject    handle to LatLLRR_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in Button_LatLRR.


%-—————————————————————————————————————选择LatLRR算法
function Button_LatLRR_Callback(hObject, eventdata, handles)
% hObject    handle to Button_LatLRR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global LatLRR_result ;
global class_num;
global sample_num;
class_num=get(handles.class_num,'String');
sample_num=get(handles.sample_num,'String');
LatLRRUI;%调用LatLRR界面


% --- Executes on button press in LatLLRR_save.
%____________________________________________________________________保存LatLRR结果
function LatLLRR_save_Callback(hObject, eventdata, handles)
% hObject    handle to LatLLRR_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LatLRR_result ;
set(handles.LatLRR_ACC,'String',num2str(LatLRR_result(1,1)));
set(handles.LatLRR_NMI,'String',num2str(LatLRR_result(1,2)));
set(handles.LatLRR_purity,'String',num2str(LatLRR_result(1,3)));


function LatLRR_ACC_Callback(hObject, eventdata, handles)
% hObject    handle to LatLRR_ACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LatLRR_ACC as text
%        str2double(get(hObject,'String')) returns contents of LatLRR_ACC as a double


% --- Executes during object creation, after setting all properties.
function LatLRR_ACC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LatLRR_ACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LatLRR_NMI_Callback(hObject, eventdata, handles)
% hObject    handle to LatLRR_NMI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LatLRR_NMI as text
%        str2double(get(hObject,'String')) returns contents of LatLRR_NMI as a double


% --- Executes during object creation, after setting all properties.
function LatLRR_NMI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LatLRR_NMI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LatLRR_purity_Callback(hObject, eventdata, handles)
% hObject    handle to LatLRR_purity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LatLRR_purity as text
%        str2double(get(hObject,'String')) returns contents of LatLRR_purity as a double


% --- Executes during object creation, after setting all properties.
function LatLRR_purity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LatLRR_purity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_LapLRR.
%————————————————————————————————————————选择LapLRR算法
function button_LapLRR_Callback(hObject, eventdata, handles)
% hObject    handle to button_LapLRR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LapLRR_result ;
global class_num;
global sample_num;
class_num=get(handles.class_num,'String');
sample_num=get(handles.sample_num,'String');
LapLRRUI;


% --- Executes on button press in LapLRR_save.
%————————————————————————————————————————保存LapLRR结果
function LapLRR_save_Callback(hObject, eventdata, handles)
% hObject    handle to LapLRR_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LapLRR_result ;
set(handles.LapLRR_UI_ACC,'String',num2str(LapLRR_result(1,1)));
set(handles.LapLRR_UI_NMI,'String',num2str(LapLRR_result(1,2)));
set(handles.LapLRR_UI_purity,'String',num2str(LapLRR_result(1,3)));


function LapLRR_UI_ACC_Callback(hObject, eventdata, handles)
% hObject    handle to LapLRR_UI_ACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LapLRR_UI_ACC as text
%        str2double(get(hObject,'String')) returns contents of LapLRR_UI_ACC as a double


% --- Executes during object creation, after setting all properties.
function LapLRR_UI_ACC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LapLRR_UI_ACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LapLRR_UI_NMI_Callback(hObject, eventdata, handles)
% hObject    handle to LapLRR_UI_NMI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LapLRR_UI_NMI as text
%        str2double(get(hObject,'String')) returns contents of LapLRR_UI_NMI as a double


% --- Executes during object creation, after setting all properties.
function LapLRR_UI_NMI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LapLRR_UI_NMI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LapLRR_UI_purity_Callback(hObject, eventdata, handles)
% hObject    handle to LapLRR_UI_purity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LapLRR_UI_purity as text
%        str2double(get(hObject,'String')) returns contents of LapLRR_UI_purity as a double


% --- Executes during object creation, after setting all properties.
function LapLRR_UI_purity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LapLRR_UI_purity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_LapLRR.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to button_LapLRR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in LRRAGR_save.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to LRRAGR_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to LapLRR_UI_ACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LapLRR_UI_ACC as text
%        str2double(get(hObject,'String')) returns contents of LapLRR_UI_ACC as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LapLRR_UI_ACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to LapLRR_UI_NMI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LapLRR_UI_NMI as text
%        str2double(get(hObject,'String')) returns contents of LapLRR_UI_NMI as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LapLRR_UI_NMI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to LapLRR_UI_purity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LapLRR_UI_purity as text
%        str2double(get(hObject,'String')) returns contents of LapLRR_UI_purity as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LapLRR_UI_purity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_LRRAGR.
%————————————————————————————————————————选择LRRAGR
function button_LRRAGR_Callback(hObject, eventdata, handles)
% hObject    handle to button_LRRAGR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global LRRAGR_result ;
global class_num;
global sample_num;
class_num=get(handles.class_num,'String');
sample_num=get(handles.sample_num,'String');
LRRAGRUI;



% --- Executes on button press in LRRAGR_save.
%————————————————————————————————————————保存LRRAGR结果
function LRRAGR_save_Callback(hObject, eventdata, handles)
% hObject    handle to LRRAGR_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LRRAGR_result ;
set(handles.LRRAGR_UI_ACC,'String',num2str(LRRAGR_result(1,1)));
set(handles.LRRAGR_UI_NMI,'String',num2str(LRRAGR_result(1,2)));
set(handles.LRRAGR_UI_purity,'String',num2str(LRRAGR_result(1,3)));


function LRRAGR_UI_ACC_Callback(hObject, eventdata, handles)
% hObject    handle to LRRAGR_UI_ACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LRRAGR_UI_ACC as text
%        str2double(get(hObject,'String')) returns contents of LRRAGR_UI_ACC as a double


% --- Executes during object creation, after setting all properties.
function LRRAGR_UI_ACC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LRRAGR_UI_ACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LRRAGR_UI_NMI_Callback(hObject, eventdata, handles)
% hObject    handle to LRRAGR_UI_NMI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LRRAGR_UI_NMI as text
%        str2double(get(hObject,'String')) returns contents of LRRAGR_UI_NMI as a double


% --- Executes during object creation, after setting all properties.
function LRRAGR_UI_NMI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LRRAGR_UI_NMI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LRRAGR_UI_purity_Callback(hObject, eventdata, handles)
% hObject    handle to LRRAGR_UI_purity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LRRAGR_UI_purity as text
%        str2double(get(hObject,'String')) returns contents of LRRAGR_UI_purity as a double


% --- Executes during object creation, after setting all properties.
function LRRAGR_UI_purity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LRRAGR_UI_purity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in main_UI_gen_result_charts.
%—————————————————————————————————————    —绘制簇状图
function main_UI_gen_result_charts_Callback(hObject, eventdata, handles)
% hObject    handle to main_UI_gen_result_charts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

K_means_ACC=str2double(get(handles.K_means_ACC,'String'));
K_means_NMI=str2double(get(handles.K_means_NMI,'String'));
K_means_purity=str2double(get(handles.K_means_purity,'String'));
K_means=[K_means_ACC,K_means_NMI,K_means_purity];

LRR_ACC=str2double(get(handles.LRR_ACC,'String'));
LRR_NMI=str2double(get(handles.LRR_NMI,'String'));
LRR_purity=str2double(get(handles.LRR_purity,'String'));
LRR=[LRR_ACC,LRR_NMI,LRR_purity];

LatLRR_ACC=str2double(get(handles.LatLRR_ACC,'String'));
LatLRR_NMI=str2double(get(handles.LatLRR_NMI,'String'));
LatLRR_purity=str2double(get(handles.LatLRR_purity,'String'));
LatLRR=[LatLRR_ACC,LatLRR_NMI,LatLRR_purity];

LapLRR_ACC=str2double(get(handles.LapLRR_UI_ACC,'String'));
LapLRR_NMI=str2double(get(handles.LapLRR_UI_NMI,'String'));
LapLRR_purity=str2double(get(handles.LapLRR_UI_purity,'String'));
LapLRR=[LapLRR_ACC,LapLRR_NMI,LapLRR_purity];

LRRAGR_ACC=str2double(get(handles.LRRAGR_UI_ACC,'String'));
LRRAGR_NMI=str2double(get(handles.LRRAGR_UI_NMI,'String'));
LRRAGR_purity=str2double(get(handles.LRRAGR_UI_purity,'String'));
LRRAGR=[LRRAGR_ACC,LRRAGR_NMI,LRRAGR_purity];

Y_result=[K_means;LRR;LatLRR;LapLRR;LRRAGR];

bar(Y_result);
axis([0 7 0 1.2]);  
set(gca,'XTick',[1 2 3 4 5]);
set(gca,'XTickLabel',{'Kmeans','LRR','LatLRR','LapLRR','LRRAGR'});
legend('ACC','NMI','purity','Location','SouthEast'); 

X_result=[1 2 3 4 5];
temp=[-0.25 0 0.25];
for i = 1:5
    for j=1:3
    text(X_result(i)+temp(j),Y_result(i,j),num2str(roundn(Y_result(i,j),-2)),...
    'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','FontSize',5)
    end
end

xlabel('算法');  
ylabel('指标');  
global class_num;
class_num=get(handles.sample_num,'String');
title(strcat('样本类数：',class_num));  



% --- Executes on button press in main_UI_save_chart.
%————————————————————————————————————————保存簇状图
function main_UI_save_chart_Callback(hObject, eventdata, handles)
% hObject    handle to main_UI_save_chart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
new_f_handle=figure('visible','off'); %新建一个不可见的figure
new_axes=copyobj(handles.axes2,new_f_handle); %axes1是GUI界面内要保存图线的Tag，将其copy到不可见的figure中
set(new_axes,'Units','normalized','Position',[0.1 0.1 0.8 0.8]);%将图线缩放
%set(new_axes,'Units','normalized','Position',[1 1 1 1]);%将图线缩放
[filename pathname fileindex]=uiputfile({'*.png';'*.bmp';'*.jpg';'*.eps';},'图片保存为');
if  filename~=0%未点“取消”按钮或未关闭
        file=strcat(pathname,filename);
        switch fileindex %根据不同的选择保存为不同的类型        
            case 1
                print(new_f_handle,'-dpng',file);% print(new_f_handle,'-dpng',filename);效果一样，将图像打印到指定文件中
                fprintf('>>已保存到：%s\n',file);
            case 2
                print(new_f_handle,'-dbmp',file);
                fprintf('>>已保存到：%s\n',file);
            case 3
                print(new_f_handle,'-djpg',file);
                fprintf('>>已保存到：%s\n',file);
            case 4
                print(new_f_handle,'-depsc',file);
                fprintf('>>已保存到：%s\n',file);
        end 
        msgbox('          图片已成功保存！','完成！');
end


% --- Executes on button press in K_means_button.
%————————————————————————————————————————选择Kmeans算法
function K_means_button_Callback(hObject, eventdata, handles)
% hObject    handle to K_means_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global K_means_result ;
global class_num;
global sample_num;
class_num=get(handles.class_num,'String');
sample_num=get(handles.sample_num,'String');
K_meansUI;

% --- Executes on button press in K_means_save.
%————————————————————————————————————————保存Kmeans结果
function K_means_save_Callback(hObject, eventdata, handles)
% hObject    handle to K_means_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global K_means_result ;
set(handles.K_means_ACC,'String',num2str(K_means_result(1,1)));
set(handles.K_means_NMI,'String',num2str(K_means_result(1,2)));
set(handles.K_means_purity,'String',num2str(K_means_result(1,3)));






function K_means_ACC_Callback(hObject, eventdata, handles)
% hObject    handle to K_means_ACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of K_means_ACC as text
%        str2double(get(hObject,'String')) returns contents of K_means_ACC as a double


% --- Executes during object creation, after setting all properties.
function K_means_ACC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to K_means_ACC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function K_means_NMI_Callback(hObject, eventdata, handles)
% hObject    handle to K_means_NMI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of K_means_NMI as text
%        str2double(get(hObject,'String')) returns contents of K_means_NMI as a double


% --- Executes during object creation, after setting all properties.
function K_means_NMI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to K_means_NMI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function K_means_purity_Callback(hObject, eventdata, handles)
% hObject    handle to K_means_purity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of K_means_purity as text
%        str2double(get(hObject,'String')) returns contents of K_means_purity as a double


% --- Executes during object creation, after setting all properties.
function K_means_purity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to K_means_purity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function labal_Callback(hObject, eventdata, handles)
% hObject    handle to labal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of labal as text
%        str2double(get(hObject,'String')) returns contents of labal as a double


% --- Executes during object creation, after setting all properties.
function labal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to labal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in select_labal.
%———————————————————————————————   ———————专家标签的路径
function select_labal_Callback(hObject, eventdata, handles)
% hObject    handle to select_labal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[labalname,labalpath]=uigetfile('*.mat','请选择文件');
set(handles.labal,'String',strcat(labalpath,labalname));
global labal_path;
labal_path=strcat(labalpath,labalname);
