function realTimePlot(abs_ltibia)


    for i = 1:length(abs_ltibia)
        plot(1:i, abs_ltibia(1, 1:i), 'b', 'Marker', '+');
        xlabel('Time (s)'); 
        ylabel('Data'); 
        title('real time plot'); 
        drawnow;
        pause(0);
    end
end
