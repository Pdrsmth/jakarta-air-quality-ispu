-- 1. % hari TIDAK SEHAT per stasiun
SELECT stasiun,
       SUM(tidak_sehat) AS hari_tidak_sehat,
       COUNT(*) AS total_hari,
       ROUND(SUM(tidak_sehat) / COUNT(*) * 100, 1) AS pct_tidak_sehat
FROM ispu_harian
GROUP BY stasiun
ORDER BY pct_tidak_sehat DESC;

-- 2. Parameter pencemar kritis dominan
SELECT parameter_pencemar_kritis,
       COUNT(*) AS jumlah_hari
FROM ispu_harian
WHERE parameter_pencemar_kritis IS NOT NULL
GROUP BY parameter_pencemar_kritis
ORDER BY jumlah_hari DESC;

-- 3. % hari di atas SEDANG (keseluruhan)
SELECT ROUND(SUM(tidak_sehat) / COUNT(*) * 100, 1) AS pct_di_atas_sedang,
       SUM(tidak_sehat) AS hari_tidak_sehat,
       COUNT(*) AS total_hari
FROM ispu_harian;

-- 4. Rata-rata ISPU per bulan (pola musiman)
SELECT bulan_angka,
       ROUND(AVG(ispu_max), 1) AS rata_rata_max
FROM ispu_harian
GROUP BY bulan_angka
ORDER BY bulan_angka;
