list=fullfile('C:\Users\Administrator.USER-20190423VA\Desktop\image\test_backup\1\RL');
images = imageDatastore(list);
I1 = readimage(images, 1);
[Ricp Ticp ER T] = icp(M, D, 10);      %M��D������ά����i����������Ĭ��10������ֵRicp��Ticp������תƽ�ƹ�ϵ