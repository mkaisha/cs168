from scipy.io import loadmat
from scipy.io import savemat
import skimage
from skimage import transform
from skimage.transform import rescale
for i in range(2,47):
    if i != 7: #img7.mat was broken
        index = str(i)
        modified = 'modified'
        format = ".mat"
        imputf = index+format
        outputf = index+modified+format
        img_name= "img"+index
        loaded_img = loadmat(c)
        img = skimage.transform.resize(loaded_img[img_name], (128,128,20,loaded_img['img'].shape[3]))
        savemat((outputf),{'img': img})
