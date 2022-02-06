import numpy
import matplotlib.pyplot as plt
from numpy.core.fromnumeric import reshape
from tsne import tsne
from sklearn.cluster import KMeans
from utils import imscatter, load_data

def display_tsne(data, mod_data):
    for i in range (5, 50):        
        sol = tsne(mod_data, perplexity=i)
        x_coords = []
        y_coords = []
        for coords in sol:
            x_coords.append(coords[0])
            y_coords.append(coords[1])
        imscatter(x_coords, y_coords, data)
        plt.show()

if __name__ == '__main__':
    data = load_data()
    reshape_param = 1
    for i in range(1, len(data.shape)):
        reshape_param *= data.shape[i]
    mod_data = data.reshape((data.shape[0], reshape_param))
    display_tsne(data, mod_data)
    kmeans = KMeans()
    kmeans.fit(mod_data)
    plt.scatter()
