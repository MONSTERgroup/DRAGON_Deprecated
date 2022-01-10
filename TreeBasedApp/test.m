% Create two axes
f = uifigure;
ax = uiaxes('Parent',f);
ax.Title.String = 'track mouse';


% Set up crosshairs on each axis at the edges
gobj(1,1) = xline(ax,min(xlim(ax)), 'k-');
gobj(1,2) = yline(ax,min(ylim(ax)), 'k-');

ax.UserData; % hlink must be stored here so mouseMove() has access to it
% Assign windowbuttonmotion fcn on axis #1
set(ax.Parent,'windowbuttonmotionfcn', {@mouseMove, ax, gobj});
% Assign mouse button functions to start/stop tracking
WindowButtonMotionFcnInput = {@mouseMove, ax, gobj};
set(ax.Parent,'windowbuttondownfcn', {@startStopMouseMove, WindowButtonMotionFcnInput})

% function mouseMove(~, ~, ax, gobj)
% % Responds to mouse movement in axis #1
% % ax is a vector of subplot handles; ax(1) tracks mouse movement, ax(2) follows.
% % gobj(1,1) is xline in ax 1
% % gobj(1,2) is yline in ax 1
% % Get mouse coordinate
% C = ax.CurrentPoint;
% x = C(1,1);
% y = C(1,2);
% % If mouse isn't on axis #1, do nothing.
% if x < ax.XLim(1) || x > ax.XLim(2) || y < ax.YLim(1) || y > ax.YLim(2)
%     return
% end
% % Update crosshairs (cross hairs in ax 2 are yoked).
% gobj(1,1).Value = x;
% gobj(1,1).Label = x;
% gobj(1,2).Value = y;
% gobj(1,2).Label = y;
% end

function startStopMouseMove(hobj,~,WindowButtonMotionFcnInput)
% Turns mouse tracking off (right mouse button) and on (left mouse button)
buttonID = hobj.SelectionType;
switch buttonID
    case 'normal'  %left mouse button
        % Start interactivity
        set(hobj,'windowbuttonmotionfcn', WindowButtonMotionFcnInput);
    case 'alt'     % right mouse button
        % Stop interactivity
        set(hobj,'windowbuttonmotionfcn', []);
end
end