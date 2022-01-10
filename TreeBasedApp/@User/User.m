classdef User < handle
    %UNTITLED12 Summary of this class goes here
    %   Detailed explanation goes here

    properties
        mousepos (2,:)double
        buttondown (1,:)cell
        src
        eventData
    end

    methods
        function obj = User()

        end
        mouseClick(obj, src, ~, ax)
        keyboardPress(obj,~, event, ax)
    end

    methods(Static)
        mouseMove(~, ~, ax, xhs)

    end
end