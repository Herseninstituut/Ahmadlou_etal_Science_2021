function default_p = default

% default_p = struct( ...
%     'imageType', 		1, ...
%     'animType', 		4, ...
%     'flickerType', 		1, ...
%     'angle', 		   0:30:360-30, ...
%     'chromhigh',		[255 255 255], ...
%     'chromlow',			[0 0 0 ], ...
%     'sFrequency',		0.05, ...
%     'sPhaseShift',		0, ...
%     'distance',			24, ...
%     'tFrequency',		2,...
%     'barWidth',		    0.5, ...
%     'rect',		      [200 200 400 400], ...
%     'nCycles',			4, ...
%     'contrast',			0.9, ...
%     'background',		0.5, ...
%     'backdrop',		0.5, ...
%     'barColor',			1, ...
%     'nSmoothPixels',	2, ...
%     'fixedDur',			0, ...
%     'windowShape',		0, ...
%     'loops',			0, ...
%     'size',             NaN ... % size in degrees, when NaN it is ignored
%     );
% default_p.dispprefs = {'BGpretime',1};

default_p = getparameters(onedottwodots('default'));
%default_p.size = [1 5 10 20];
