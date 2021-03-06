function ds = displaystruct(parameters)
%DISPLAYSTRUCT
%
% displaystruct contains all the necessary information to display a
% stimulus after loading
%
%     makeClip:     Should we use a clipping region (that is, a mask region)?
%                   if makeClip==0, then no mask/clipping region is applied
%                   if makeClip==1, then the points in clipRect specify a rectangle
%                   if makeClip==2, then the points in clipRect specify an oval
%                   if makeClip==3, then clipRect specifies a polygon
%                   if makeClip==4, then clipRect is a mask texture to be applied
%
% Steve Van Hooser
%

if nargin==0,
    temp_dS_p = {'displayType', 'CLUTanim', 'displayProc', 'standard', ...
        'offscreen', 0, 'frames', 1, 'depth', 8, 'userfield',[],...
        'clut_usage', [], 'clut_bg', [], 'clut', []};
    ds = displaystruct(temp_dS_p);
    return
end

params = struct( ...
    'displayProc',         '',                          ...
    'displayType',         '',                          ...
    'frames',               0,                          ...
    'offscreen',           [],                          ...
    'clut',                [],                          ...
    'clut_usage',          [],                          ...
    'clut_bg',             [],                          ...
    'depth',                0,                          ...
    'makeClip',             0,                          ...
    'clipRect',         [0 0 0 0],                      ...
    'userfield',            []                          ...
    );

[good,errormsg] = verify(parameters);

if good
    for i=1:2:length(parameters)
        eval(['params.' parameters{i} ' = parameters{i+1};']);
    end
else
    error(['Could not create displaystruct: ' errormsg]);
end

ds = class(params,'displaystruct');
