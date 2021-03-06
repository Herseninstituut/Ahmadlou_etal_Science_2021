function [me] = multiextractor(parameters,arg2)

% ME = MULTIEXTACTOR(PARAMETERS)
%
% filtermethod (0,1,2)        :   Method of filtering (none, convolution, or
%                             :      Chebyshev type I)
% filterarg                   :   Argument to filter method above.  It is
%                             :      required but ignored in the 'none' case,
%                             :      and it is the stencil with which to
%                             :      convolve the data in the 'convolution'
%                             :      case.  In the Cheby I case, it is the
%                             :      high and low cut-off frequencies in hertz
%                             :      (e.g. [300 5000],[0 5000], [300 Inf],etc.)
% thresh                      :   Fraction of noise data must exceed to be
%                             :      considered a spike by chi-square criteria(e.g.,0.99999).
% thresh2                     :   Fraction of noise data must exceed to be
%                             :      considered a secondary peak (e.g., 0.999).
% thresh3                     :   Fraction of noise data must exceed to be considered an
%                             :      unresolvable spike (must be < thresh,thresh2).  Used w/
%                             :      remove_unresolved mode below
% normalize                   :   normalize=0 => don't transform data in any way (not
%                             :      recommended), normalize=1 => use covariance matrix
%                             :      to normalize, normalize=2 => use each channel's variance
%                             :      to normalize.
% threshcov                   :   Fraction of noise data must exceed to be considered a
%                             :      spike which is removed to calculate the covariance
% remove_unresolved           :   If 1, remove unresolvable spikes and count them as overlaps
%                             :      if they are close to resolvable spikes using thresh3
%                             :      criteria above
% useabs                      :   Use absolute value to locate spike (1) or find positive and
%                             :      negative peaks separately (0, default)
% peak_sep                    :   Minimum separation allowed between two local
%                             :      maxima for them to be counted as spikes
%                             :      (otherwise they are assumed to be noise)
%                             :      (e.g., 90e-6 s)
% event_sep                   :   Minimum separation allowed between two
%                             :      independent spikes (e.g., 0.2e-3s)
% overlap_sep                 :   ?
% datadir                     :   Determines thresholds for peak finding if useabs==0.
%                             :      If enabled (not equal to 0), then thresh will be used
%                             :      for the major spike direction (use 1 if spikes are
%                             :      negative, 2 if they are positive), and thresh2 will be
%                             :      used for the minor spike direction.  In addition, all
%                             :      spikes will be required to be made of sequences of peaks
%                             :      which include a peak going in the major direction.  If
%                             :      disabled, thresh1 is used in both positive and negative
%                             :      cases, and spikes can have components in either
%                             :      direction.
% pre_time                    :   Amount to save before each spike
% post_time                   :   Amount to save after each spike
% oversampling                :   Amount to oversample
% scratchfile                 :   String to append to scratch files
%                             :     (use if want to use diff. extractors on
%                             :          same data)
% event_type_string           :   The string that will be used as part of the
%                             :     output object's name (e.g. cell)
% output_object (0 or 1)      :   Type of output object to make.  Must be
%                                   cksmultiunit (0) or ckssingleunit (1).

data.input_type={'tetrode'};
data.output_type={'cksmultipleunit', 'ckssingleunit'};

default_p = struct('filtermethod',2,'filterarg',[300 10000]/15719,'thresh',200,...
		'useabs',0,'datadir',1,'thresh3',33,'threshcov',18,...
                'normalize',2,...
		'thresh2',38,'pre_time',0.300e-3,'post_time',0.600e-3, ...
		'oversampling',1,'remove_unresolved',1,...
		'peak_sep',90e-6,'overlap_sep',501e-6,'event_sep',0.2e-3,...
		'scratchfile','','event_type_string','cell','output_object',1);

me = [];
finish = 1;

if ischar(parameters),
	if strcmp(parameters,'graphical'),
		myme = multiextractor('default');
		finish = 0;
		me = edit_graphical(myme);
	elseif strcmp(parameters,'default'),
		parameters = default_p;
	else, error('Unknown string input to multiextractor.');
	end;
else,
	[good,err]=verifymultiextractor(parameters);
	if ~good,error(['Could not create multiextractor: ' err]); end;
end;

if finish,
	exop = extractoperator(5);
	me = class(struct('MEparams',parameters),'multiextractor',exop);
end;
