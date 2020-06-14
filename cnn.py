#Load all the required packages
import numpy as np
import matplotlib.pyplot as plt
from keras.models import Model
from keras.layers import Concatenate, Conv2D, Conv1D, Reshape, Dropout, Dense, Flatten, MaxPooling2D, MaxPooling1D
from keras import Input
from keras.utils import to_categorical
from keras.optimizers import Adam, SGD, RMSprop
import scipy.io
import pandas as pd
from sklearn.model_selection import train_test_split

# Load preprocessed CT perfusion scan matrices for each patient. We skip some patients since their data could not be processed.
# The file paths must point to the folder where the preprocessed data is located.
data = []
for x in range(45):
  if x == 0:
    data += [scipy.io.loadmat('Data/' + str(x+2) + '.mat')["resampledImg"]]
  elif x != 5:
    data += [scipy.io.loadmat('Data/' + str(x+2) + '.mat')["r" + str(x+2)]]

# Read in the mRS for each patient
# The file path must point to the folder where the labels for the patients are located.
df = pd.read_excel('labels.xlsx')
labels = pd.DataFrame.to_numpy(df)[:,1]
labels = list(labels[1:7]) + list(labels[8:])
# Generate train and test data sets
(train_data, test_data, t_train, t_test) = train_test_split(data, labels, test_size=0.2)
train_data = np.array(train_data)
test_data = np.array(test_data)
t_train = np.array(t_train)
t_test = np.array(t_test)
print(train_data.shape)
print(test_data.shape)
print(t_train.shape)
print(t_test.shape)

from keras.utils import to_categorical
# Binarize the class matrices for Class 1: mRS 0-3 and Class 2: mRS 4-7. This is what the base model uses
targets_train = []
for target in t_train:
    if target < 3:
        targets_train += [[1,0]]
    else:
        targets_train += [[0,1]]
targets_test = []
for target in t_test:
    if target < 3:
        targets_test += [[1,0]]
    else:
        targets_test += [[0,1]]
# Create 8 classes for mRS 0-7. This is used in one of the tests.
#targets_train = to_categorical(t_train, num_classes=8).astype(np.integer)
#targets_test = to_categorical(t_test, num_classes=8).astype(np.integer)
# One of the tests required continuous outputs. Do not use the above classification code in that case.
targets_train = np.array(targets_train)
targets_test = np.array(targets_test)
print(targets_train.shape)
print(targets_test.shape)

''' Code adapted from TA Abdullah-Al-Zubear Imran's discussion in CS 168 at UCLA'''
# Build our cnn model

def build_model():
    #input layer: prepare for convolutions in different directions 
    inputs = Input((x,y,z,d))
    inp_xy = Reshape(((x, y, z*d)))(inputs) #(x,y)
    inp_z = Reshape(((x*y*d, z)))(inputs) #z
    inp_d = Reshape(((x*y*z, d)))(inputs) #d

    # Convolutional layer: The base filter count for this layer is 8. Tests were performed with 4 and 16 filiters.
    #2D conv: (x,y)
    conv_xy = Conv2D(8, 3, activation='relu')(inp_xy)
    conv_xy = MaxPooling2D(pool_size=(4,4))(conv_xy)
    
    #1D conv: (z)
    conv_z = Conv1D(8, 3, activation='relu')(inp_z)
    conv_z = MaxPooling1D(pool_size=4)(conv_z)
    #1D conv: (d)
    conv_d = Conv1D(8, 3, activation='relu')(inp_d)
    conv_d = MaxPooling1D(pool_size=4)(conv_d)
    
    # Additional convolutional layer for one of the tests
    #2D conv: (x,y)
    #conv_xy = Conv2D(8, 3, activation='relu')(conv_xy)
    #conv_xy = MaxPooling2D(pool_size=(2,2))(conv_xy)
    conv_xy = Reshape((conv_xy.shape[1]*conv_xy.shape[2], conv_xy.shape[3]))(conv_xy)
    print(conv_xy.shape)
    
    #1D conv: (z)
    #conv_z = Conv1D(8, 3, activation='relu')(conv_z)
    #conv_z = MaxPooling1D(pool_size=2)(conv_z)
    #1D conv: (d)
    #conv_d = Conv1D(8, 3, activation='relu')(conv_d)
    #conv_d = MaxPooling1D(pool_size=2)(conv_d)
    print(conv_z.shape, conv_d.shape)

    #Collect from all three and concatenate
    cat1 = Concatenate(axis=1)([conv_xy, conv_z])
    cat2 = Concatenate(axis=1)([cat1, conv_d])
    print(cat2.shape)

    drop1 = Dropout(0.25)(cat2)
    flat1 = Flatten()(drop1)
    # Fully Connected Layer: The base neuron count for this layer is 64. Tests were performed with 128 and 256 neurons.
    dense1 = Dense(64)(flat1)
    drop2 = Dropout(0.25)(dense1)
    
    # Ouptut layer: 2 softmax probabilities for 2 classes. Tests were performed with modifications to the output for 8 classes and continuous mRS.
    out = Dense(2, activation='softmax')(drop2)
    
    return Model(inputs=inputs, outputs=out)

x, y, z, d = (128, 128, 20, 60)
batch_size = 8

# Compile the model: select loss, optimizer, and metric
# The base loss function categorical cross-entropy. Tests were performed with mean squared error and mean absolute error.
# The base optimizer is Adam. Tests were performed with SGD and RMSprop.
# If we are testing continuous output, we must use mean_squared_error since categorical_crossentropy is for classification
model = build_model()
model.compile(loss='categorical_crossentropy',
              optimizer=Adam(0.001), metrics=['accuracy'])
model.summary()

# Fit the model for training 
history = model.fit(train_data, targets_train,
            batch_size=batch_size,
            epochs=20,
            verbose=1,
            validation_split=0.1)

# Generate generalization metrics
score = model.evaluate(test_data, targets_test, verbose=0)
print(f'Test loss: {score[0]} / Test accuracy: {score[1]}')

# Plot history: Categorical crossentropy & Accuracy
plt.plot(history.history['loss'], label='Categorical crossentropy (training data)')
plt.plot(history.history['val_loss'], label='Categorical crossentropy (validation data)')
plt.plot(history.history['accuracy'], label='Accuracy (training data)')
plt.plot(history.history['val_accuracy'], label='Accuracy (validation data)')
plt.title('Model performance for 4D input Keras with Conv2D-1D-1D example')
plt.ylabel('Loss value')
plt.xlabel('No. epoch')
plt.legend(loc="upper left")
plt.show()