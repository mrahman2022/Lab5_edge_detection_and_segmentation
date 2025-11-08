# 🧠 Lab 5: Edge Detection and Segmentation
**Course:** Mathematical Algorithms (DSP) — Image Processing Labs  
**Student:** Mahfuzur Rahaman  
**Department:** B.Sc. in Information Technology  
**Institution:** Savonia University of Applied Sciences
**Date:** November 2025  

---

## 🎯 Learning Outcomes
- Relate image edges to high-frequency components.  
- Apply gradient-based and zero-crossing edge detection operators.  
- Perform automatic thresholding (Otsu’s method) for segmentation.  

---

## 🧩 Overview
This lab explores the relationship between **spatial gradients** and **frequency content** in digital images.  
Different edge detectors (Sobel, Prewitt, Canny, and Laplacian of Gaussian) were implemented, and **Otsu thresholding** was used for basic image segmentation.

---

## ⚙️ Methods and Steps
1. **Load Image & Setup Folder**  
   Load `peppers.png` → convert to grayscale → create `figures/` folder.

2. **Edge Detection Operators**  
   - **Sobel & Prewitt:** Detect first-order gradients (horizontal + vertical).  
   - **Canny:** Multi-stage detector → Gaussian smoothing + gradient + hysteresis thresholding.  
   - **Laplacian of Gaussian (LoG):** Detects zero-crossings in the second derivative.

3. **Segmentation (Otsu Thresholding)**  
   - Automatically computes the intensity threshold that minimizes intra-class variance.  
   - Produces a binary mask separating foreground from background.

4. **Region Labeling & Visualization**  
   - Connected components labeled via `bwlabel`.  
   - Displayed using `label2rgb` for unique region colors.

---

## 📈 Observations & Reflections
| Concept | Explanation |
|----------|--------------|
| **Cleanest edges** | The **Canny detector** gives thin, continuous, noise-resistant edges. |
| **Why Canny outperforms others** | It combines smoothing, gradient detection, and threshold linking, reducing false positives. |
| **Otsu’s method** | Uses histogram statistics to automatically pick a threshold → effective for bi-modal intensity images. |

---

## 📂 Output Files (in `/figures`)
- `edges_sobel_prewitt.png` → Sobel & Prewitt comparison  
- `edges_canny.png` → Canny edge map  
- `edges_log.png` → Laplacian of Gaussian edges  
- `otsu_threshold.png` → Otsu segmentation  
- `labeled_regions.png` → Labeled connected components visualization  

---

## ✅ Conclusion
This lab demonstrated how edges correspond to **high-frequency image features** and how combining spatial and statistical methods (like Otsu) enables effective segmentation. The Canny and Otsu methods proved most robust for clean, automatic edge detection and region separation.
