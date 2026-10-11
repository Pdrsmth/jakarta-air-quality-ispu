# Jakarta Air Quality (ISPU) Analysis

> **ID:** Analisis Indeks Standar Pencemar Udara (ISPU) DKI Jakarta, Jan 2024 – Nov 2025 — 3.500 hari × 5 stasiun pemantau.

An original portfolio project analyzing Jakarta's Air Pollutant Standard Index (ISPU) — not a course rebuild. Built end-to-end: data sourcing → cleaning → EDA → insight.

## Key Findings

- **Kebon Jeruk (West Jakarta) is Jakarta's air pollution hotspot**: 16.3% of days rated *Tidak Sehat* (Unhealthy) — **3.3× worse** than Jagakarsa (4.9%).
- **PM2.5 dominates** as the critical pollutant on **86.0%** of polluted days.
- **Strong dry-season pattern**: average ISPU peaks at **90.2 in June** vs **55.0 in January** — pollution is ~64% worse in the dry season (May–Sep).
- **9.8%** of all monitored days (342 of 3,500) exceeded the *Sedang* (Moderate) category.

## Recommendation

Targeted emission controls in West Jakarta ahead of the dry season (May–Sep), plus public health advisories on predicted high-ISPU days — the pattern repeats yearly, so it can be anticipated.

## Data Quality Notes

Real-world data, real-world mess — documented, not hidden:

1. **Inconsistent station names** in the official source: a typo (`BUNDERAN HI`), 3 name variants for DKI1, 2 for DKI5 → standardized to 5 stations.
2. **Fake `.xls`**: the portal serves an HTML table with an `.xls` extension → parsed with `pd.read_html`.
3. **1 invalid date** (31 Sept 2024 — September has 30 days) → dropped and documented.
4. Missing pollutant readings (sensor gaps) left as NaN — never imputed.

## Pipeline

`Satu Data Jakarta portal → Excel → Python/pandas (Colab) → EDA → Insight`
Planned: SQL aggregation → Power BI dashboard → 10-page portfolio deck.

## Files

| File | Description |
|---|---|
| `ISPU_JAKARTA.ipynb` | Full analysis notebook (cleaning + EDA) |
| `ispu_jakarta_eda.png` | 4-panel EDA chart (Python/matplotlib) |
| `ispu_analysis.sql` | 4 SQL queries (MySQL) — cross-validated against pandas |
| `ispu_jakarta_dashboard.pbix` | Power BI dashboard (3 KPI cards + bar/donut/line + slicer) |
| `dashboard-ispu-jakarta.pdf` | Dashboard PDF export |
| `data/ispu_jakarta.xls` | Raw dataset (as downloaded) |

## Data Source

Data Indeks Standar Pencemar Udara (ISPU) di Provinsi DKI Jakarta — Dinas Lingkungan Hidup, via [Satu Data Jakarta](https://satudata.jakarta.go.id/open-data/detail?kategori=dataset&page_url=data-indeks-standar-pencemar-udara-ispu-di-provinsi-dki-jakarta&data_no=1). Accessed Oct 2026.

---

## Temuan Utama (ID)

- **Kebon Jeruk (Jakarta Barat) adalah hotspot polusi udara Jakarta**: 16,3% hari berkategori *Tidak Sehat* — **3,3× lebih buruk** dari Jagakarsa (4,9%).
- **PM2.5 dominan** sebagai parameter kritis pada **86,0%** hari berpolusi.
- **Pola musim kemarau yang kuat**: rata-rata ISPU memuncak **90,2 pada Juni** vs **55,0 pada Januari**.
- **9,8%** dari seluruh hari terpantau (342 dari 3.500) melampaui kategori *Sedang*.

## Rekomendasi

Intervensi pengendalian emisi yang ditargetkan di Jakarta Barat menjelang musim kemarau (Mei–Sep), plus imbauan kesehatan publik pada hari-hari dengan ISPU diprediksi tinggi.
