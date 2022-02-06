from sklearn.datasets import load_breast_cancer as breast_cancer_sk
from sklearn.model_selection import train_test_split
from sklearn import tree
from six import StringIO
import numpy as np
import matplotlib.pyplot as plt
import pydot
import string


def DT_to_PNG(model, feature_names, file_name):
    """ Exports a DT to a PNG image file for inspection.
    
    Parameters
    ----------
        - model: a decision tree (class sklearn.tree.DecisionTreeClassifier)
        - feature_names: a list of feature names
        - file_name: name of file to be produced (without '.png' extension)
    
    Notes
    -----
    This function requires the pydot Python package and the Graphviz library.
    
    For more information about tree export, see http://scikit-learn.org/stable/
    modules/generated/sklearn.tree.export_graphviz.html#sklearn.tree.export_graphviz
    """

    dot_data = StringIO()
    tree.export_graphviz(model, out_file=dot_data, feature_names=feature_names)
    graph = pydot.graph_from_dot_data(dot_data.getvalue())[0]
    graph.write_png("%s.png" % file_name)

if __name__ == "__main__":

    bc_data = breast_cancer_sk()
    X_train, X_test, labels_train, labels_test = train_test_split(bc_data.data, bc_data.target, random_state=42, test_size=0.33)
    
    leaf_nodes = []
    training_score = []
    testing_score = []
    ims = 0
    
    for i in range(2, 31):
        decision_tree = tree.DecisionTreeClassifier(criterion="gini", max_leaf_nodes=i)
        decision_tree.fit(X_train, labels_train)
        leaf_nodes.append(i)
        training_score.append(decision_tree.score(X_train, labels_train))
        testing_score.append(decision_tree.score(X_test, labels_test))
        ims = i-2 if (testing_score[ims] - testing_score[i-2]) < 0 else ims
        if i in (2,30):
            DT_to_PNG(decision_tree, bc_data['feature_names'], 'dt' + str(i))
            print("Score for " + str(i) + " leaf nodes :")
            print("Training set : " + str(decision_tree.score(X_train, labels_train)))
            print("Testing set : " + str(decision_tree.score(X_test, labels_test)) + "\n")

    print("Best testing score : " + str(testing_score[ims]) + " for model with " + str(ims+2) + " leaf nodes")
    leaf_nodes = np.array(leaf_nodes)
    training_score = np.array(training_score)
    testing_score = np.array(testing_score)
    
    fig, ax = plt.subplots()
    ax.plot(leaf_nodes, training_score, c='r', label="Training score")
    ax.plot(leaf_nodes, testing_score, 'b', label="Testing score")
    plt.xlabel('Max leaf nodes')
    plt.ylabel('Score')
    ax.legend()

    plt.show()