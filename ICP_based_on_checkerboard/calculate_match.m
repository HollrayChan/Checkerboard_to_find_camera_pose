%load(fullfile('C:\Users\Administrator.USER-20190423VA\Desktop\image\test_backup\HIK_single\matlab.mat'));
filepath_1='C:\Users\XiChen\Documents\ICP\CP_ICP\savemat\left\';%�ļ��е�·��  %�����ļ���.mat �ļ�   ����ʹ�������ƥ��
filepath_2='C:\Users\XiChen\Documents\ICP\CP_ICP\savemat\right\';
%load([filepath '09-Sep-2019-00-00-00' '.mat'])
for i=1:3  %n��Ҫ������ļ��ĸ���
    load([filepath_1 '09-Sep-2019-00-00-00' '.mat']);
    matchedPoints1 = grid_pts';
    load([filepath_2 '08-Sep-2019-00-00-00' '.mat']);
    matchedPoints2 = grid_pts';

    %load(fullfile('C:\Users\Administrator.USER-20190423VA\Desktop\image\test_backup\HIK_single\matlab.mat')); 

    R = stereoParams.RotationOfCamera2
    t = stereoParams.TranslationOfCamera2

    camMatrix1 = cameraMatrix(stereoParams.CameraParameters2, eye(3), [0 0 0]);
    % [R, t] = cameraPoseToExtrinsics(orient, loc);
    camMatrix2 = cameraMatrix(stereoParams.CameraParameters2, R, t);

    points3D_M = triangulate(matchedPoints1, matchedPoints2, camMatrix1, camMatrix2);
    points3D_D = triangulate(matchedPoints1, matchedPoints2, camMatrix1, camMatrix2);
    [Ricp Ticp ER T] = icp(points3D_M, points3D_D, 10);  %M��D������ά����i����������Ĭ��10������ֵRicp��Ticp������תƽ�ƹ�ϵ
end