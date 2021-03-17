% Random mouse code generator
f = input('How many mice need a code? A = ');

for q = 1:f
LnN = char([48:57,65:90]);
Code = randsample(LnN,4);
disp(sprintf('Code nr %d:   %s',q,Code))
end