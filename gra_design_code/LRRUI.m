function varargout = LRRUI(varargin)
% LRRUI MATLAB code for LRRUI.fig
%      LRRUI, by itself, creates a new LRRUI or raises the existing
%      singleton*.
%
%      H = LRRUI returns the handle to a new LRRUI or the handle to
%      the existing singleton*.
%
%      LRRUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LRRUI.M with the given input arguments.
%
%      LRRUI('Property','Value',...) creates a new LRRUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LRRUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LRRUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LRRUI

% Last Modified by GUIDE v2.5 24-May-2019 17:35:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LRRUI_OpeningFcn, ...
                   'gui_OutputFcn',  @LRRUI_OutputFcn, ...
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


% --- Executes just before LRRUI is made visible.
function LRRUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LRRUI (see VARARGIN)

% Choose default command line output for LRRUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LRRUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LRRUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function LRR_file_path_Callback(hObject, eventdata, handles)
% hObject    handle to LRR_file_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LRR_file_path as text
%        str2double(get(hObject,'String')) returns contents of LRR_file_path as a double


% --- Executes during object creation, after setting all properties.
function LRR_file_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LRR_file_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in LRR_button_select.%                     
% 选择文件路径
function LRR_button_select_Callback(hObject, eventdata, handles)
% hObject    handle to LRR_button_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
folder_name = uigetdir;
set(handles.LRR_file_path,'String',folder_name);



function LRR_result_path_Callback(hObject, eventdata, handles)
%————————————————————————————————————————聚类文件的保存路径
% hObject    handle to LRR_result_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LRR_result_path as text
%        str2double(get(hObject,'String')) returns contents of LRR_result_path as a double
folder_name = uigetdir;
set(handles.result_path,'String',folder_name);

% --- Executes during object creation, after setting all properties.
function LRR_result_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LRR_result_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in LRR_button_save.
% %选择结果保存路径
function LRR_button_save_Callback(hObject, eventdata, handles)
% hObject    handle to LRR_button_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
folder_name = uigetdir;
set(handles.LRR_result_path,'String',folder_name);





% --- Executes during object creation, after setting all properties.
function LRR_lambda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LRR_lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LRR_kmeans_iter_Callback(hObject, eventdata, handles)
% hObject    handle to LRR_kmeans_iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LRR_kmeans_iter as text
%        str2double(get(hObject,'String')) returns contents of LRR_kmeans_iter as a double


% --- Executes during object creation, after setting all properties.
function LRR_kmeans_iter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LRR_kmeans_iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LRR_lambda_Callback(hObject, eventdata, handles)
% hObject    handle to LRR_lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LRR_lambda as text
%        str2double(get(hObject,'String')) returns contents of LRR_lambda as a double


% --- Executes on button press in LRR_run.
%————————————————————————————————————————运行：LRR
function LRR_run_Callback(hObject, eventdata, handles)               
% hObject    handle to LRR_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LRR_result ;
addpath('LRR_code');
addpath('public_code');
disp('开始...');
global sample_num;
global class_num;
LRR_class_num=int32(str2double(class_num));%样本种类数量
LRR_sample_num=int32(str2double(sample_num));

disp('加载数据集...');
global data_path;
[fea]=get_data2(data_path,LRR_sample_num);%读取数据
global LRR_fea;%用于将样本分相应文件夹
LRR_fea=fea;


disp('数据归一化...');
X=data2one(fea);%归一化

lambda=str2double(get(handles.LRR_lambda,'String'));%lambda值

if (get(handles.LRR_self_dic,'value'))%是否自身字典
    self_dic=1;
else
    self_dic=0;
end

if (get(handles.LRR_L1_norm,'value'))%范数
    norm=1;
else
    norm=21;
end

disp('获取低秩表示...');
[Z,E]=LRR_main(X,lambda,self_dic,norm);%LRR的核心函数

disp('绘制亲和矩阵...');
L=get_affinity(Z,LRR_class_num);
axes(handles.axes2);%创建坐标去，显示亲和矩阵
imshow(L);


disp('执行谱聚类...');
K_iter=int32(str2double(get(handles.LRR_kmeans_iter,'String')));%K_means迭代次数
idx=spe_clust(L,K_iter,LRR_class_num);%谱聚类
global LRR_idx;
LRR_idx=idx;%用于下文中，分类文件

disp('绘制散点图...');
axes(handles.axes3);
[COEFF,SCORE,latent] = pca(Z);
SCORE = SCORE(:,1:30);
mappedX = tsne(SCORE,'Algorithm','exact','NumDimensions',2);
axes(handles.axes3);%使用图像，操作在坐标2
scatter(mappedX(:,1),mappedX(:,2),5,idx,'*');
disp('计算指标...');

global labal_path;
if (isempty(labal_path))%如果没有专家标签，则不计算指标
     msgbox('未选择专家标签','确定');
     disp('计算指标失败');
else
    data=load(labal_path);
    gnd=data.gnd(1:LRR_sample_num);
    size(gnd)
    size(idx)
    LRR_result = ClusteringMeasure(gnd,idx);%指标
    set(handles.LRR_ACC,'String',num2str(LRR_result(1,1)));
    set(handles.LRR_NMI,'String',num2str(LRR_result(1,2)));
    set(handles.LRR_purity,'String',num2str(LRR_result(1,3)));
end
disp('程序结束');

function LRR_class_num_Callback(hObject, eventdata, handles)
% hObject    handle to LRR_class_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LRR_class_num as text
%        str2double(get(hObject,'String')) returns contents of LRR_class_num as a double


% --- Executes during object creation, after setting all properties.
function LRR_class_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LRR_class_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function LRR_info_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LRR_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



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



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in LRR_save.
function LRR_save_Callback(hObject, eventdata, handles)
% hObject    handle to LRR_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%LRR_result(1,1)=str2double(get(handles.LRR_ACC,'String'));
%LRR_result(1,2)=str2double(get(handles.LRR_NMI,'String'));
%LRR_result(1,3)=str2double(get(handles.LRR_purity,'String'));


% --- Executes on button press in LRR_UI_save_rep.
function LRR_UI_save_rep_Callback(hObject, eventdata, handles)
% hObject    handle to LRR_UI_save_rep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
new_f_handle=figure('visible','off'); %新建一个不可见的figure
new_axes=copyobj(handles.axes2,new_f_handle); %axes2是GUI界面内要保存图线的Tag，将其copy到不可见的figure中
set(new_axes,'Units','normalized','Position',[0.1 0.1 0.8 0.8]);%将图片缩放
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


% --- Executes on button press in LRR_UI_save_point.
function LRR_UI_save_point_Callback(hObject, eventdata, handles)
% hObject    handle to LRR_UI_save_point (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
new_f_handle=figure('visible','off'); %新建一个不可见的figure
new_axes=copyobj(handles.axes3,new_f_handle); %axes1是GUI界面内要保存图线的Tag，将其copy到不可见的figure中
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



function result_path_Callback(hObject, eventdata, handles)
% hObject    handle to result_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result_path as text
%        str2double(get(hObject,'String')) returns contents of result_path as a double


% --- Executes during object creation, after setting all properties.
function result_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in LRR_save_file_result.
function LRR_save_file_result_Callback(hObject, eventdata, handles)
% hObject    handle to LRR_save_file_result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LRR_fea;
global LRR_idx;
global class_num;
global sample_num;
result_path=get(handles.result_path,'String');
save_result(LRR_fea,LRR_idx,class_num,sample_num,result_path);
msgbox('          已成功保存！','完成！');
disp('保存完毕');
