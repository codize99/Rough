Hi  Hi
test
hi
a)
What are the key applications of SVD?
b)
What is the use of the Cophenetic correlation coefficient in clustering.
c)
What is Density-Based Clustering? Explain DBSCAN advantages and its working steps.
d)
How do you decide the appropriate number of clusters in Agglomerative Hierarchical Clustering?
### **a) What are the key applications of SVD?**

**Singular Value Decomposition (SVD)** is a mathematical technique used to decompose a matrix into three matrices, helping to analyze and simplify data.

Key applications:

1. **Dimensionality reduction** – Reduces the number of features while retaining important information.
2. **Data compression** – Stores data efficiently by keeping significant singular values.
3. **Noise reduction** – Removes unwanted noise from datasets or images.
4. **Recommendation systems** – Used in movie, product, and user recommendation systems.
5. **PCA** – Helps perform Principal Component Analysis for identifying important patterns in data.
6. **Solving linear equations** – Used to solve complex or least-squares problems.

### **b) What is the use of the Cophenetic Correlation Coefficient in clustering?**

The **Cophenetic Correlation Coefficient (CCC)** measures how well a hierarchical clustering dendrogram represents the original distances between data points.

- It compares original pairwise distances with distances represented by the dendrogram.
- A value closer to **1** indicates a better representation.
- A lower value indicates that the dendrogram may not represent the original data distances well.
- It helps evaluate the quality of hierarchical clustering.

### **c) What is Density-Based Clustering? Explain DBSCAN advantages and its working steps.**

**Density-Based Clustering** is a clustering technique that groups data points based on their density in a region. Dense regions form clusters, while sparse regions are treated as noise or outliers.

**DBSCAN** stands for *Density-Based Spatial Clustering of Applications with Noise*.

**Advantages:**

1. It can identify clusters of irregular shapes.
2. It does not require specifying the number of clusters in advance.
3. It can detect noise and outliers.
4. It works well when clusters are separated by low-density regions.

**Working steps:**

1. Select two parameters: Epsilon (ε) and MinPts.
2. Find neighbouring points within the ε radius.
3. Identify core points that have at least MinPts neighbours.
4. Connect density-reachable points to form clusters.
5. Points that cannot be assigned to any cluster are classified as noise.

### **d) How do you decide the appropriate number of clusters in Agglomerative Hierarchical Clustering?**

The appropriate number of clusters can be decided using a **Dendrogram**.

1. Build the hierarchical clustering dendrogram.
2. Observe the vertical distances between successive cluster merges.
3. Identify a large gap or sudden increase in merge distance.
4. Draw a horizontal line across the dendrogram at that gap.
5. Count the number of branches intersected by the line; this gives the selected number of clusters.

Other methods include the **Silhouette Score** and **Cophenetic Correlation Coefficient**.

If you want, I can also make these into **short 5-mark exam answers with simpler wording for easy memorization**.

2
Note: ● Use fetal_health.csv for all the clustering and dimensionality reduction questions. ● Use bread_basket.csv for Association rule mining questions. ● Use BX-Book-Ratings.csv for recommendation system questions.
(a) Conduct exploratory data analysis (EDA) and apply necessary pre-processing steps to prepare the data for PCA and clustering, (7 marks) How many eigenvectors are needed to retain 90% of the variance of the original data? (3 marks) and Display the top 5 eigenvalues and their corresponding eigenvectors. (4 marks) Note: Don't consider target column fetal_health in PCA and clustering.
14
(b) Identify the ideal number of K-means clusters based on principal components retaining 90% explained variance, and visualize the results with the SilhouetteVisualizer..
6
(c) Generate dendrograms for the top 20 clusters using five different linkage methods. Use principal components explaining 90% of the variance, compute the cophenetic correlation coefficient for each method, and print the results for comparison.
6
SRN
(d) Partition the data into three clusters and evaluate the quality of each cluster by ranking them based on their within-cluster sum of squares (WCSS). Use PCA-transformed data that retains 90% of the variance.
6
(e) Perform clustering on the data using both K-Means and Agglomerative methods without applying PCA, and compare their performance.


===================
This is a **PCA and Clustering practical assignment** using `fetal_health.csv`. The assignment has five parts (a–e), covering EDA, preprocessing, PCA, K-Means, hierarchical clustering, dendrograms, and cluster evaluation.

Since the actual dataset is needed to calculate the eigenvalues, number of principal components, silhouette scores, and cluster results, I can give you the Python code for each part first. The code will calculate the actual results when you run it with the CSV file.

We should exclude the `fetal_health` target column from PCA and clustering, as mentioned in your question.

## **(a) EDA, preprocessing, PCA, eigenvalues and eigenvectors**

### **Step 1: Import libraries and load dataset**

```
import pandas as pdimport numpy as npimport matplotlib.pyplot as pltimport seaborn as snsfrom sklearn.preprocessing import StandardScalerfrom sklearn.impute import SimpleImputerfrom sklearn.decomposition import PCAdf = pd.read_csv("fetal_health.csv")print(df.head())print(df.shape)print(df.info())print(df.describe())print(df.isnull().sum())print(df.duplicated().sum())
```

### **Step 2: Exploratory Data Analysis (EDA)**

```
# Distribution of featuresdf.hist(figsize=(18, 15), bins=20)plt.tight_layout()plt.show()# Correlation heatmapplt.figure(figsize=(14, 10))sns.heatmap(df.corr(), annot=True, cmap="coolwarm", fmt=".2f")plt.title("Correlation Heatmap")plt.show()# Target distribution (EDA only; exclude from PCA)sns.countplot(data=df, x="fetal_health")plt.title("Fetal Health Distribution")plt.show()
```

### **Step 3: Data preprocessing**

```
# Remove target columnX = df.drop(columns=["fetal_health"])# Keep numerical featuresX = X.select_dtypes(include=np.number)# Replace infinite valuesX = X.replace([np.inf, -np.inf], np.nan)# Handle missing valuesimputer = SimpleImputer(strategy="median")X_imputed = imputer.fit_transform(X)# Standardize datascaler = StandardScaler()X_scaled = scaler.fit_transform(X_imputed)print("Preprocessed shape:", X_scaled.shape)
```

### **Step 4: Apply PCA and retain 90% variance**

```
# PCA with all componentspca_full = PCA()X_pca_full = pca_full.fit_transform(X_scaled)# Cumulative explained variancecumulative_variance = np.cumsum(    pca_full.explained_variance_ratio_)plt.figure(figsize=(8, 5))plt.plot(range(1, len(cumulative_variance) + 1),         cumulative_variance, marker="o")plt.axhline(y=0.90, color="red", linestyle="--")plt.xlabel("Number of Principal Components")plt.ylabel("Cumulative Explained Variance")plt.title("PCA Explained Variance")plt.grid()plt.show()# Number of components required for 90%n_components_90 = np.argmax(cumulative_variance >= 0.90) + 1print("Components required for 90% variance:",      n_components_90)# PCA with 90% variancepca_90 = PCA(n_components=0.90)X_pca_90 = pca_90.fit_transform(X_scaled)print("Reduced data shape:", X_pca_90.shape)print("Explained variance:", pca_90.explained_variance_ratio_.sum())
```

### **Step 5: Display top 5 eigenvalues and eigenvectors**

```
# Top 5 eigenvalueseigenvalues = pca_full.explained_variance_print("Top 5 Eigenvalues:")print(eigenvalues[:5])# Corresponding eigenvectorseigenvectors = pca_full.components_[:5]eigenvector_df = pd.DataFrame(    eigenvectors,    columns=X.columns,    index=["PC1", "PC2", "PC3", "PC4", "PC5"])print("\nTop 5 Eigenvectors:")print(eigenvector_df)
```

**Expected output:** The code prints the number of principal components required to retain 90% variance, the top five eigenvalues, and their corresponding eigenvectors.

## **(b) Identify ideal K-Means clusters and SilhouetteVisualizer**

Use PCA-transformed data retaining 90% variance.

```
from sklearn.cluster import KMeansfrom sklearn.metrics import silhouette_scorefrom yellowbrick.cluster import SilhouetteVisualizerscores = []for k in range(2, 11):    km = KMeans(n_clusters=k, random_state=42, n_init=10)    labels = km.fit_predict(X_pca_90)    score = silhouette_score(X_pca_90, labels)    scores.append(score)    print(f"K = {k}, Silhouette Score = {score:.4f}")# Plot silhouette scoresplt.figure(figsize=(8, 5))plt.plot(range(2, 11), scores, marker="o")plt.xlabel("Number of Clusters (K)")plt.ylabel("Silhouette Score")plt.title("Optimal K using Silhouette Score")plt.grid()plt.show()# Best Kbest_k = np.argmax(scores) + 2print("Optimal number of clusters:", best_k)# SilhouetteVisualizermodel = KMeans(n_clusters=best_k, random_state=42, n_init=10)visualizer = SilhouetteVisualizer(model, colors="yellowbrick")visualizer.fit(X_pca_90)visualizer.show()
```

The ideal number of clusters is selected based on the highest silhouette score. The SilhouetteVisualizer shows how well each data point fits into its assigned cluster.

## **(c) Dendrograms using five linkage methods and Cophenetic Correlation**

Linkage methods:

- Ward
- Complete
- Average
- Single
- Weighted

```
from scipy.cluster.hierarchy import linkage, dendrogram, cophenetfrom scipy.spatial.distance import pdistmethods = ["ward", "complete", "average", "single", "weighted"]# Original pairwise distancesdistances = pdist(X_pca_90, metric="euclidean")cophenetic_scores = {}plt.figure(figsize=(20, 15))for i, method in enumerate(methods, 1):    Z = linkage(X_pca_90, method=method, metric="euclidean")    # Cophenetic correlation coefficient    coph_corr, coph_dist = cophenet(Z, distances)    cophenetic_scores[method] = coph_corr    plt.subplot(3, 2, i)    dendrogram(        Z,        truncate_mode="lastp",        p=20    )    plt.title(f"{method.capitalize()} Linkage")    plt.xlabel("Clusters")    plt.ylabel("Distance")plt.tight_layout()plt.show()
```

### **Comparison**

The linkage method with the highest Cophenetic Correlation Coefficient provides the best representation of the original pairwise distances by the dendrogram.

## **(d) Partition into three clusters and rank based on WCSS**

WCSS (Within-Cluster Sum of Squares) measures how compact the clusters are. A lower WCSS indicates that the points within that cluster are closer to their cluster centroid.

```
from sklearn.cluster import KMeans# PCA data retaining 90% variancekmeans_3 = KMeans(n_clusters=3, random_state=42, n_init=10)labels_3 = kmeans_3.fit_predict(X_pca_90)# Calculate WCSS for each clusterwcss_values = []for cluster in range(3):    cluster_points = X_pca_90[labels_3 == cluster]    centroid = kmeans_3.cluster_centers_[cluster]    wcss = np.sum((cluster_points - centroid) ** 2)    wcss_values.append(wcss)    print(f"Cluster {cluster}: WCSS = {wcss:.4f}")# Rank clustersranking = pd.DataFrame({    "Cluster": [0, 1, 2],    "WCSS": wcss_values})ranking["Rank"] = ranking["WCSS"].rank(method="min")ranking = ranking.sort_values("WCSS")print("\nCluster Ranking:")print(ranking)
```

### **Visualization**

```
plt.figure(figsize=(8, 6))plt.scatter(    X_pca_90[:, 0],    X_pca_90[:, 1],    c=labels_3,    cmap="viridis",    s=30)plt.xlabel("PC1")plt.ylabel("PC2")plt.title("K-Means Clustering - 3 Clusters")plt.colorbar(label="Cluster")plt.show()
```

**Interpretation:** Clusters are ranked according to their WCSS values. The cluster with the lowest WCSS is the most compact, while the cluster with the highest WCSS has greater spread around its centroid.

## **(e) Compare K-Means and Agglomerative Clustering without PCA**

Here we use the original features after preprocessing and standardization, without PCA.

```
from sklearn.cluster import KMeans, AgglomerativeClusteringfrom sklearn.metrics import (    silhouette_score,    davies_bouldin_score,    calinski_harabasz_score)# Original standardized dataset (without PCA)X_original = X_scaled# K-Meanskmeans = KMeans(n_clusters=3, random_state=42, n_init=10)kmeans_labels = kmeans.fit_predict(X_original)# Agglomerative clusteringagglo = AgglomerativeClustering(n_clusters=3, linkage="ward")agglo_labels = agglo.fit_predict(X_original)# Evaluation functiondef evaluate_clustering(X, labels, name):    silhouette = silhouette_score(X, labels)    db_score = davies_bouldin_score(X, labels)    ch_score = calinski_harabasz_score(X, labels)    print(f"\n{name}")    print("Silhouette Score:", round(silhouette, 4))    print("Davies-Bouldin Score:", round(db_score, 4))    print("Calinski-Harabasz Score:", round(ch_score, 4))    return [silhouette, db_score, ch_score]# Evaluatekmeans_results = evaluate_clustering(    X_original, kmeans_labels, "K-Means")
```

### **Comparison of algorithms**

| Metric                  | Better result |
| ----------------------- | ------------- |
| Silhouette Score        | Higher        |
| Davies-Bouldin Score    | Lower         |
| Calinski-Harabasz Score | Higher        |

**Conclusion:** K-Means and Agglomerative Clustering are compared using three evaluation metrics. The algorithm with a higher Silhouette Score, lower Davies-Bouldin Score, and higher Calinski-Harabasz Score generally produces better-separated and more compact clusters.

### **Important for your assignment**

Upload your `fetal_health.csv` file here. I can help you run through the results and interpret the actual numbers for all five questions, including the eigenvalues, number of PCs, ideal K, dendrogram comparison, and final clustering metrics.
