function preProcessCTP_test()

imagePath = 'C:\Users\alex\Desktop\168project\mRsPredictionAnonymized\3\Mr_Stroke_Wo+W_Contrast_Brief_Interventional - 131291846\ep2d_Perf_Post_40/';
options.fileExtension = '.dcm';

[img, meta] = preProcessCTP2(imagePath, options);

g=1;

imagePath20 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/20/Mri_Brain_Ww_ConDwi_Perfusion - 7726856/ep2d_perf_p2_12/';
imagePath21 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/21/Mri_Brain_Ww_ConDwi_Perfusion - 8669989/ep2d_Perfusion_16/';
imagePath22 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/22/Mri_Brain_Wo_ConDwi - 8694046/ep2d_Perf_Post_38/';
imagePath23 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/23/Mri_Brain_Ww_ConDwi_Perfusion - 8101015/ep2d_perf_p2_40/';
imagePath24 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/24/Mr_Brain_Wo+W_Contrast - 8353439/ep2d_Perfusion_45/';
imagePath25 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/25/Mri_Brain_Ww_ConDwi_Perfusion - 8191052/ep2d_perf_p2_31/';
imagePath26 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/26/Mri_Brain_Ww_ConDwi_Perfusion - 7728809/ep2d_Perf_Post_23/';
imagePath27 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/27/Mri_Brain_Ww_ConDwi_Perfusion - 8236866/ep2d_perf_p2_43/';
imagePath28 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/28/Mri_Brain_Ww_ConDwi_Perfusion - 8375773/ep2d_Perfusion_44/';
imagePath29 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/29/Mri_Brain_Ww_ConDwi_Perfusion - 7796905/ep2d_perf_p2_22/';
imagePath30 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/30/Mri_Brain_Ww_ConDwi_Perfusion - 8320973/ep2d_perf_p2_21/';
imagePath31 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/31/Mri_Brain_Ww_ConDwi_Perfusion - 8411412/ep2d_perf_42/';
imagePath32 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/32/Mri_Brain_Ww_ConDwi_Perfusion - 7657615/ep2d_Perf_Post_17/';
imagePath33 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/33/Mr_Stroke_Wo+W_Contrast_Brief_Interventional - 127723038/ep2d_Perf_Post_41/';
imagePath34 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/34/Mri_Brain_Ww_ConDwi_Perfusion - 8693641/ep2d_Perf_Post_41/';
imagePath35 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/35/Mri_Brain_Ww_ConDwi_Perfusion - 8286179/ep2d_Perf_Post_32/';
imagePath36 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/36/Mri_Brain_Ww_ConDwi_Perfusion - 8092039/ep2d_perf_40/';
imagePath37 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/37/Mri_Brain_Ww_ConDwi_Perfusion - 8022175/ep2d_perf_p2_21/';
imagePath38 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/38/Mri_Brain_Ww_ConDwi_Perfusion - 8214657/ep2d_perf_42/';
imagePath39 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/39/Mri_Brain_Ww_ConDwi_Perfusion - 8526033/ep2d_Perf_Post_39/';
imagePath40 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/40/Mri_Brain_Ww_ConDwi_Perfusion - 8142599/ep2d_perf_p2_70/';
imagePath41 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/41/Mri_Brain_Ww_ConDwi_Perfusion - 8655195/ep2d_Perfusion_41/';
imagePath42 = 'C:/Users/alex/Desktop/168project/mRsPredictionAnonymized/42/Mri_Brain_Ww_ConDwi_Perfusion - 8314709/ep2d_perf_44/';
imagePath43 = 'C:\Users\alex\Desktop\168project\mRsPredictionAnonymized\43\Mri_Brain_Ww_ConDwi_Perfusion - 7692745\ep2d_perf_p2_21/';
imagePath44 = 'C:\Users\alex\Desktop\168project\mRsPredictionAnonymized\44\Mri_Brain_Ww_ConDwi_Perfusion - 8637142\ep2d_Perfusion_38/';
imagePath45 = 'C:\Users\alex\Desktop\168project\mRsPredictionAnonymized\45\Mri_Brain_Ww_ConDwi_Perfusion - 7896713\ep2d_perf_72/';
imagePath46 = 'C:\Users\alex\Desktop\168project\mRsPredictionAnonymized\46\Mri_Brain_Ww_ConDwi_Perfusion - 8485132\ep2d_Perf_Post_30/';
