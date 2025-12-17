# game-vault-database
# 🎮 GameVault Database

**GameVault Database**, bir dijital oyun platformu (Steam / Epic Games benzeri) için tasarlanmış, **PostgreSQL uyumlu** bir veritabanı modelidir.
Bu proje; oyun geliştiricileri, oyunlar ve oyun türleri arasındaki ilişkileri doğru ve ölçeklenebilir şekilde yönetmeyi amaçlar.

---

## 📌 Proje İçeriği

* PostgreSQL uyumlu **SQL tablo tasarımları**
* **Primary Key (PK)** ve **Foreign Key (FK)** ilişkileri
* **ER Diyagramı** (drawSQL)
* Çoktan çoğa (**Many-to-Many**) ilişki modellemesi

---

## 🗂️ Veritabanı Tabloları

### 🔹 developers

Oyun geliştirici firmalara ait bilgileri tutar.

### 🔹 games

Platformda yer alan oyunlara ait bilgileri içerir.

### 🔹 genres

Oyun türlerini (Aksiyon, RPG, Strateji vb.) saklar.

### 🔹 games_genres

Oyunlar ile türler arasındaki **çoktan çoğa ilişkiyi** yönetir.

---

## 🔗 İlişkiler

* Bir **developer**, birden fazla **game** geliştirebilir.
* Bir **game**, birden fazla **genre**’a ait olabilir.
* Bir **genre**, birden fazla **game** ile ilişkilendirilebilir.
* Bu ilişki **games_genres** ara tablosu ile sağlanır.

---

## 🧩 ER Diyagramı

Veritabanı modeli, **drawSQL** kullanılarak görselleştirilmiştir.
ER diyagramı tablolar arasındaki ilişkileri açık şekilde göstermektedir.

---

## 🛠️ Kullanılan Teknolojiler

* **PostgreSQL**
* **SQL**
* **drawSQL**

---

## 🚀 Amaç

Bu proje, ilişkisel veritabanı tasarımı, normalizasyon ve çoktan çoğa ilişkilerin doğru modellenmesini göstermek amacıyla hazırlanmıştır.

---

