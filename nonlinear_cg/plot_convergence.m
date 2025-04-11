function plot_convergence(iter, f, method_name, line_style, line_color)
    figure; % 创建一个新的图形窗口
    plot(iter, f, [line_style ' ' line_color], 'LineWidth', 2); % 绘制收敛曲线
    hold on; % 保持当前图形，以便在同一图上绘制下一组数据
    % 添加图例和标题
    legend(method_name);
    title('Convergence of Nonlinear Conjugate Gradient Methods');
    xlabel('Iteration');
    ylabel('Objective Function Value');
    % 设置坐标轴刻度和范围
    set(gca, 'XTick', 0:5000:50000); % 根据迭代次数设置合适的X轴刻度
    grid on; % 显示网格
end