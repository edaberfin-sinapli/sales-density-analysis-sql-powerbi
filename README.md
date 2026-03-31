# Sales Density Analysis (SQL & Power BI)

## Proje Özeti

Bu projede, satış ve işlem yoğunluğu günlük ve haftalık zaman kırılımlarında analiz edilmiştir.  
Veri hazırlama ve hesaplama süreçleri SQL kullanılarak gerçekleştirilmiş, elde edilen veriler Power BI ile görselleştirilerek raporlanmıştır.  
Projenin amacı; satış işlemlerinin hangi günlerde ve hangi dönemlerde yoğunlaştığını analiz etmek, tekrar eden desenleri belirlemek ve operasyonel süreçlerin daha verimli yönetilmesine katkı sağlamaktır.

---

## Cevaplanan İş Soruları

Bu proje kapsamında aşağıdaki iş ve operasyon odaklı sorulara yanıt aranmıştır:  

- Hangi günlerde müşteri işlem yoğunluğu artmaktadır?  
- Haftalık bazda işlem hacmi nasıl değişmektedir?  
- Şube operasyonları için en yoğun günler hangileridir?  
- İşlem yükü haftaya dengeli mi dağılmaktadır, yoksa belirli günlerde yoğunlaşmakta mıdır?  
- Günlük ortalama işlem sayısı operasyonel kapasite ile uyumlu mudur?  
- İşlem başına düşen ortalama ürün adedi (işlem büyüklüğü) stabil midir?

---

## Veri Seti

**Kaynak:** Kaggle – Adidas Sales Dataset  

Orijinal veri seti analiz öncesinde temizlenmiş ve dönüştürülmüştür.  
Projede kullanılan tüm SQL sorguları ve Power BI raporları aşağıdaki temiz veri seti üzerinden oluşturulmuştur:

- `adidas_sales_cleaned.csv`

---

## Kullanılan Araçlar

- **SQL (MySQL)** – Veri temizleme, agregasyon ve raporlama tabloları  
- **Power BI** – Dashboard tasarımı ve veri görselleştirme  
- **GitHub** – Proje sunumu ve versiyon kontrolü

---

## Dashboardlar

### 1. Sales Density Overview – Daily & Weekly Patterns (Satış Yoğunluğu Genel Görünüm – Günlük & Haftalık Analiz)

Bu dashboard, haftanın günlerine ve haftalara göre işlem yoğunluğunu genel seviyede göstermektedir.  

**İçerdiği görseller:**
- Order Density by Day of Week (Haftanın Günlerine Göre İşlem Yoğunluğu)  
- Weekly Order Density Trend (Haftalık İşlem Yoğunluğu Trendi)  
- Daily Order Density – Summary Table (Günlük İşlem Özeti Tablosu)  
- Weekly Units Sold Trend (Haftalık Satılan Ürün Adedi Trendi)

**Amaç:**  
Gün bazlı tekrar eden satış davranışlarını ve haftalık dalgalanmaları analiz etmek.

**Görsel:**  
`powerbi/sales_density_overview_daily_weekly_patterns.png`

---

### 2. Sales Density Analysis – Day & Week Overview (Satış Yoğunluk Analizi – Gün & Hafta Bazlı Detay)

Bu dashboard, KPI ve dağılım odaklı analizlerle işlem yoğunluğunu detaylı şekilde incelemektedir.  

**İçerdiği görseller:**
- Total Transactions (Toplam İşlem Sayısı)  
- Average Transactions per Day (Günlük Ortalama İşlem Sayısı)  
- Average Units per Transaction (İşlem Başına Ortalama Ürün Adedi)  
- Sales Volume by Day of Week (Haftanın Günlerine Göre Satış Hacmi)  
- Total Transactions by Day of Week (Haftanın Günlerine Göre Toplam İşlem Sayısı)  
- Weekly Sales Volume Trend (Haftalık Satış Hacmi Trendi)  
- Distribution of Days by Transaction Volume Category (İşlem Yoğunluğuna Göre Gün Dağılımı)

**Amaç:**  
İşlem yoğunluğunu, satış hacmini ve operasyonel yük dağılımını analiz etmek.

**Görsel:**  
`powerbi/sales_density_analysis_day_week_overview.png`

---

## Temel Çıkarımlar

- İşlem yoğunluğu hafta geneline dengeli dağılmış olsa da, Salı ve Cuma günlerinde nispeten daha yüksek yoğunluk gözlemlenmiştir.  
- Haftalık analizlerde tekrarlayan artış ve düşüşler görülmüş, bu da satışların dönemsel bir yapıya sahip olduğunu göstermektedir.  
- Günlerin büyük çoğunluğu orta seviyede işlem hacmine sahiptir, bu da operasyonel süreçlerin genel olarak stabil ilerlediğini göstermektedir.  
- İşlem başına düşen ortalama ürün adedi sabit kalmış, bu da müşteri alışveriş davranışının tutarlı olduğunu göstermektedir.

---

## Proje Yapısı

<pre>
sales-density-analysis-sql-powerbi/
│
├── data/
│ └── adidas_sales_cleaned.csv
│
├── powerbi/
│ ├── sales_density_overview_daily_weekly_patterns.png
│ └── sales_density_analysis_day_week_overview.png
│
├── sql/
│ └── sales_density_views.sql
│
└── README.md
</pre>
