function mouseClick(obj, src, ~, ax)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

C = ax.CurrentPoint;
x = C(1,1); %round(C(1,1));
y = C(1,2); %round(C(1,2));
% If mouse isn't on axis, do nothing.
if x < ax.XLim(1) || x > ax.XLim(2) || y < ax.YLim(1) || y > ax.YLim(2)
    return
end

obj.mousepos(:, end+1) = [x y];
obj.buttondown{end+1} = checkSelectionType(src);
ax.UserData = ax.UserData+1;

end

function t = checkSelectionType(src)
switch src.SelectionType
    case 'normal'
        t = 'lmb';
    case 'extend'
        t = 'mmb';
    case 'alt'
        t = 'rmb';
    case 'open'
        t = 'double';
end
end
