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
