# Hava Durumu Uygulaması 🌤️

Bu proje Flutter ile geliştirilmiş basit bir hava durumu uygulamasıdır.  
Uygulama **API keysiz** servisler kullanılarak geliştirilmiştir.  

## Özellikler
- IP tabanlı konum alma (`http://ip-api.com/json/`)
- Open-Meteo API üzerinden anlık hava durumu verisi çekme
- Rüzgar hızı, rüzgar yönü, sıcaklık, enlem-boylam ve timezone bilgisi gösterme
- Flutter SmartDialog ile kullanıcıya bilgi sunma

## Kullanılan Servisler
- [ip-api.com](http://ip-api.com/json/) → Kullanıcının IP adresinden enlem-boylam bilgisi almak için
- [Open-Meteo](https://open-meteo.com/) → API keysiz hava durumu verisi almak için

## Neden API keysiz?
Projeyi GitHub üzerinde paylaşırken herkesin kolayca çalıştırabilmesi için **API key gerektirmeyen servisler** tercih edilmiştir.  
Bu sayede ek bir kayıt veya anahtar gerekmeden uygulama doğrudan çalışır.
## Kullanılan sistem
Buj proje 100mb'nin üstünde bir dosya olduğu için github lfs sistemi kullanılmıştır.

## Kurulum
1. Flutter SDK kurulu olmalı
2. Projeyi klonla:
   ```bash
   git clone https://github.com/ouabiaga/havadurumuprojesi.git

    ```
3.çalıştır
```bash
   cd havadurumuprojesi
   cd havadurumu
   flutter run
```
