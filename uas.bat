@echo off
setlocal enabledelayedexpansion

:login
cls
echo Selamat datang di Aplikasi Menu!
set "username="
set "password="

set /p "username=Username: "
set /p "password=Password: "

rem Ganti username dan password dengan kombinasi yang sesuai
if "%username%"=="admin" if "%password%"=="12345" goto menu
echo Login gagal. Silakan coba lagi.
timeout 2
goto login

:menu
cls
echo Menu Utama
echo 1. Menu Akademik
echo 2. Nilai Mahasiswa
echo 3. Laporan Nilai Mahasiswa TXT
echo 4. Aplikasi Perhitungan
echo 5. Menu Perbaikan Komputer
echo 6. Menu Jaringan Komputer
echo 7. Menu Aplikasi
echo 8. Menu Setting
echo 9. Keluar

set /p "choice=Masukkan pilihan (1-9): "

if "%choice%"=="1" goto menu_akademik
if "%choice%"=="2" goto nilai_mahasiswa
if "%choice%"=="3" goto laporan_nilai
if "%choice%"=="4" goto aplikasi_perhitungan
if "%choice%"=="5" goto menu_perbaikan_komputer
if "%choice%"=="6" goto menu_jaringan_komputer
if "%choice%"=="7" goto menu_aplikasi
if "%choice%"=="8" goto menu_setting
if "%choice%"=="9" goto keluar

echo Pilihan tidak valid. Silakan coba lagi.
timeout 2
goto menu

:menu_akademik
cls
echo Menu Akademik
echo 1. Lihat Jadwal Kuliah
echo 2. Lihat Daftar Mata Kuliah
echo 3. Lihat Nilai Mahasiswa
echo 4. Kembali ke Menu Utama

set /p "choice=Masukkan pilihan (1-4): "

if "%choice%"=="1" goto lihat_jadwal_kuliah
if "%choice%"=="2" goto lihat_daftar_mata_kuliah
if "%choice%"=="3" goto lihat_nilai_mahasiswa
if "%choice%"=="4" goto menu

echo Pilihan tidak valid. Silakan coba lagi.
timeout 2
goto menu_akademik

:lihat_jadwal_kuliah
cls
echo Jadwal Kuliah
rem Tambahkan perintah untuk menampilkan jadwal kuliah
rem Misalnya: type "jadwal_kuliah.txt"
pause
goto menu_akademik

:lihat_daftar_mata_kuliah
cls
echo Daftar Mata Kuliah
rem Tambahkan perintah untuk menampilkan daftar mata kuliah
rem Misalnya: type "daftar_mata_kuliah.txt"
pause
goto menu_akademik

:lihat_nilai_mahasiswa
cls
echo Nilai Mahasiswa
rem Tambahkan perintah untuk menampilkan nilai mahasiswa
rem Misalnya: type "nilai_mahasiswa.txt"
pause
goto menu_akademik

:menu_utama
cls
echo Kembali ke Menu Utama...
timeout 2
goto menu

:nilai_mahasiswa
cls
echo Anda berada di Menu Nilai Mahasiswa.
REM Inisialisasi variabel
set "nama_mahasiswa="
set "nilai_tugas=0"
set "nilai_uts=0"
set "nilai_uas=0"
set "nilai_akhir=0"
set "keterangan="

REM Input data mahasiswa
cls
echo Aplikasi Penilaian Mahasiswa
echo -----------------------------
set /p "nama_mahasiswa=Masukkan nama mahasiswa: "
set /p "nilai_tugas=Masukkan nilai tugas: "
set /p "nilai_uts=Masukkan nilai UTS: "
set /p "nilai_uas=Masukkan nilai UAS: "

REM Hitung nilai akhir
set /a "nilai_akhir=(nilai_tugas + nilai_uts + nilai_uas) / 3"

REM Tentukan keterangan
if %nilai_akhir% gtr 80 (
    set "keterangan=Sangat Baik"
) else if %nilai_akhir% gtr 60 (
    set "keterangan=Baik"
) else if %nilai_akhir% gtr 40 (
    set "keterangan=Cukup"
) else (
    set "keterangan=Tidak Lulus"
)

REM Tampilkan hasil penilaian
cls
echo Hasil Penilaian Mahasiswa
echo -----------------------------
echo Nama Mahasiswa: %nama_mahasiswa%
echo Nilai Tugas: %nilai_tugas%
echo Nilai UTS: %nilai_uts%
echo Nilai UAS: %nilai_uas%
echo Nilai Akhir: %nilai_akhir%
echo Keterangan: %keterangan%

pause
goto menu

:laporan_nilai
cls
REM Inisialisasi variabel
set "nama_mahasiswa="
set "nim="
set "semester="
set "jumlah_mata_kuliah=0"
set "total_sks=0"
set "total_nilai=0"
set "ipk=0"

REM Input data mahasiswa
cls
echo Aplikasi Laporan Mahasiswa / KHS
echo -----------------------------
set /p "nama_mahasiswa=Masukkan nama mahasiswa: "
set /p "nim=Masukkan NIM mahasiswa: "
set /p "semester=Masukkan semester: "

REM Input data mata kuliah dan nilai
cls
echo Masukkan data mata kuliah dan nilai (Isi 'selesai' pada mata kuliah untuk menghentikan input):
:input_nilai
set /p "mata_kuliah=Masukkan nama mata kuliah: "
if /i "%mata_kuliah%"=="selesai" goto hitung_ipk
set /p "sks=Masukkan jumlah SKS: "
set /p "nilai=Masukkan nilai (A, A-, B+, ...): "

REM Konversi nilai ke dalam angka
set "nilai_angka=0"
if /i "%nilai%"=="A" set "nilai_angka=4"
if /i "%nilai%"=="A-" set "nilai_angka=3.7"
if /i "%nilai%"=="B+" set "nilai_angka=3.3"
if /i "%nilai%"=="B" set "nilai_angka=3"
if /i "%nilai%"=="B-" set "nilai_angka=2.7"
if /i "%nilai%"=="C+" set "nilai_angka=2.3"
if /i "%nilai%"=="C" set "nilai_angka=2"
if /i "%nilai%"=="C-" set "nilai_angka=1.7"
if /i "%nilai%"=="D" set "nilai_angka=1"
if /i "%nilai%"=="E" set "nilai_angka=0"

REM Hitung total SKS dan total nilai
set /a "total_sks+=sks"
set /a "total_nilai+=sks * nilai_angka"

REM Tambahkan data ke laporan
echo %mata_kuliah% - SKS: %sks% - Nilai: %nilai% >> laporan_khs.txt
goto input_nilai

:hitung_ipk
REM Hitung IPK (Indeks Prestasi Kumulatif)
if %total_sks% gtr 0 (
    set /a "ipk=total_nilai / total_sks"
)

REM Tambahkan informasi akhir ke laporan
echo ----------------------------- >> laporan_khs.txt
echo Nama Mahasiswa: %nama_mahasiswa% >> laporan_khs.txt
echo NIM: %nim% >> laporan_khs.txt
echo Semester: %semester% >> laporan_khs.txt
echo Total SKS: %total_sks% >> laporan_khs.txt
echo IPK: %ipk% >> laporan_khs.txt

echo Laporan KHS telah disimpan dalam file laporan_khs.txt
pause
goto menu

:aplikasi_perhitungan
cls
:menu_perhitungan
cls
echo Aplikasi Perhitungan
echo ------------------------
echo 1. Penjumlahan
echo 2. Pengurangan
echo 3. Perkalian
echo 4. Pembagian
echo 5. Kembali ke Menu Utama

set /p "choice=Masukkan pilihan (1-5): "

if "%choice%"=="1" goto penjumlahan
if "%choice%"=="2" goto pengurangan
if "%choice%"=="3" goto perkalian
if "%choice%"=="4" goto pembagian
if "%choice%"=="5" goto menu

echo Pilihan tidak valid. Silakan coba lagi.
timeout 2
goto menu_perhitungan

:penjumlahan
cls
echo Penjumlahan
echo ------------------------
set /p "angka1=Masukkan angka pertama: "
set /p "angka2=Masukkan angka kedua: "

set /a "hasil=angka1 + angka2"
echo Hasil: %hasil%
pause
goto menu_perhitungan

:pengurangan
cls
echo Pengurangan
echo ------------------------
set /p "angka1=Masukkan angka pertama: "
set /p "angka2=Masukkan angka kedua: "

set /a "hasil=angka1 - angka2"
echo Hasil: %hasil%
pause
goto menu_perhitungan

:perkalian
cls
echo Perkalian
echo ------------------------
set /p "angka1=Masukkan angka pertama: "
set /p "angka2=Masukkan angka kedua: "

set /a "hasil=angka1 * angka2"
echo Hasil: %hasil%
pause
goto menu_perhitungan

:pembagian
cls
echo Pembagian
echo ------------------------
set /p "angka1=Masukkan angka pertama: "
set /p "angka2=Masukkan angka kedua: "

if "%angka2%"=="0" (
    echo Error: Pembagian dengan nol tidak diizinkan.
) else (
    set /a "hasil=angka1 / angka2"
    echo Hasil: %hasil%
)
pause
goto menu_perhitungan

:menu_utama
cls
echo Kembali ke Menu Utama...
timeout 2
goto menu

:menu_perbaikan_komputer
cls
echo Menu Perbaikan Komputer
echo ------------------------
echo 1. Cek Kondisi Baterai Laptop
echo 2. Perbaiki Sistem Operasi
echo 3. Periksa Koneksi Internet
echo 4. Instal Driver Perangkat
echo 5. Kembali ke Menu Utama

set /p "choice=Masukkan pilihan (1-5): "

if "%choice%"=="1" goto cek_baterai_laptop
if "%choice%"=="2" goto perbaiki_sistem_operasi
if "%choice%"=="3" goto periksa_koneksi_internet
if "%choice%"=="4" goto instal_driver_perangkat
if "%choice%"=="5" goto menu_utama

echo Pilihan tidak valid. Silakan coba lagi.
timeout 2
goto menu_perbaikan_komputer

:cek_baterai_laptop
cls
echo Cek Kondisi Baterai Laptop
echo ------------------------
rem Tambahkan perintah untuk cek kondisi baterai laptop
echo Misalnya: powercfg /batteryreport
pause
goto menu_perbaikan_komputer

:perbaiki_sistem_operasi
cls
echo Perbaiki Sistem Operasi
echo ------------------------
rem Tambahkan perintah untuk perbaiki sistem operasi
echo Misalnya: sfc /scannow
pause
goto menu_perbaikan_komputer

:periksa_koneksi_internet
cls
echo Periksa Koneksi Internet
echo ------------------------
rem Tambahkan perintah untuk periksa koneksi internet
echo Misalnya: ping www.google.com
pause
goto menu_perbaikan_komputer

:instal_driver_perangkat
cls
echo Instal Driver Perangkat
echo ------------------------
rem Tambahkan perintah untuk instal driver perangkat
echo Misalnya: pnputil /add-driver "C:\Drivers\MyDriver.inf"
pause
goto menu_perbaikan_komputer

:menu_utama
cls
echo Kembali ke Menu Utama...
timeout 2
goto menu

:menu_jaringan_komputer
cls
echo Menu Jaringan Komputer
echo ------------------------
echo 1. Ping ke Host
echo 2. Cek IP Konfigurasi
echo 3. Tampilkan Daftar Koneksi
echo 4. Cek Kecepatan Internet
echo 5. Kembali ke Menu Utama

set /p "choice=Masukkan pilihan (1-5): "

if "%choice%"=="1" goto ping_ke_host
if "%choice%"=="2" goto cek_ip_konfigurasi
if "%choice%"=="3" goto tampilkan_daftar_koneksi
if "%choice%"=="4" goto cek_kecepatan_internet
if "%choice%"=="5" goto menu_utama

echo Pilihan tidak valid. Silakan coba lagi.
timeout 2
goto menu_jaringan_komputer

:ping_ke_host
cls
echo Ping ke Host
echo ------------------------
set /p "host=Masukkan alamat host atau IP: "
ping %host%
pause
goto menu_jaringan_komputer

:cek_ip_konfigurasi
cls
echo Cek IP Konfigurasi
echo ------------------------
ipconfig
pause
goto menu_jaringan_komputer

:tampilkan_daftar_koneksi
cls
echo Tampilkan Daftar Koneksi
echo ------------------------
netstat -a
pause
goto menu_jaringan_komputer

:cek_kecepatan_internet
cls
echo Cek Kecepatan Internet
echo ------------------------
rem Tambahkan perintah untuk cek kecepatan internet
echo Misalnya: speedtest-cli
pause
goto menu_jaringan_komputer

:menu_utama
cls
echo Kembali ke Menu Utama...
timeout 2
goto menu

:menu_aplikasi
cls
echo Menu Aplikasi
echo ------------------------
echo 1. Aplikasi Catatan
echo 2. Aplikasi Kalkulator
echo 3. Aplikasi Kalender
echo 4. Aplikasi Pengelola File
echo 5. Kembali ke Menu Utama

set /p "choice=Masukkan pilihan (1-5): "

if "%choice%"=="1" goto aplikasi_catatan
if "%choice%"=="2" goto aplikasi_kalkulator
if "%choice%"=="3" goto aplikasi_kalender
if "%choice%"=="4" goto aplikasi_pengelola_file
if "%choice%"=="5" goto menu_utama

echo Pilihan tidak valid. Silakan coba lagi.
timeout 2
goto menu_aplikasi

:aplikasi_catatan
cls
echo Aplikasi Catatan
echo ------------------------
echo Buat, lihat, atau edit catatan teks.
rem Tambahkan perintah untuk menjalankan aplikasi catatan
pause
goto menu_aplikasi

:aplikasi_kalkulator
cls
echo Aplikasi Kalkulator
echo ------------------------
echo Lakukan perhitungan matematika sederhana.
rem Tambahkan perintah untuk menjalankan aplikasi kalkulator
pause
goto menu_aplikasi

:aplikasi_kalender
cls
echo Aplikasi Kalender
echo ------------------------
echo Lihat tanggal dan jadwal dengan mudah.
rem Tambahkan perintah untuk menjalankan aplikasi kalender
pause
goto menu_aplikasi

:aplikasi_pengelola_file
cls
echo Aplikasi Pengelola File
echo ------------------------
echo Lihat, salin, atau hapus file dan folder.
rem Tambahkan perintah untuk menjalankan aplikasi pengelola file
pause
goto menu_aplikasi

:menu_utama
cls
echo Kembali ke Menu Utama...
timeout 2
goto menu

:menu_setting
cls
echo Menu Setting
echo ------------------------
echo 1. Ubah Nama Pengguna
echo 2. Ubah Warna Latar Belakang
echo 3. Atur Resolusi Layar
echo 4. Ubah Volume Suara
echo 5. Kembali ke Menu Utama

set /p "choice=Masukkan pilihan (1-5): "

if "%choice%"=="1" goto ubah_nama_pengguna
if "%choice%"=="2" goto ubah_warna_latar_belakang
if "%choice%"=="3" goto atur_resolusi_layar
if "%choice%"=="4" goto ubah_volume_suara
if "%choice%"=="5" goto menu_utama

echo Pilihan tidak valid. Silakan coba lagi.
timeout 2
goto menu_setting

:ubah_nama_pengguna
cls
echo Ubah Nama Pengguna
echo ------------------------
set /p "nama_baru=Masukkan nama pengguna baru: "
rem Tambahkan perintah untuk mengubah nama pengguna
echo Nama pengguna berhasil diubah menjadi: %nama_baru%
pause
goto menu_setting

:ubah_warna_latar_belakang
cls
echo Ubah Warna Latar Belakang
echo ------------------------
set /p "warna_baru=Masukkan kode warna latar belakang (misalnya 0A): "
rem Tambahkan perintah untuk mengubah warna latar belakang
echo Warna latar belakang berhasil diubah menjadi: %warna_baru%
pause
goto menu_setting

:atur_resolusi_layar
cls
echo Atur Resolusi Layar
echo ------------------------
set /p "resolusi_baru=Masukkan resolusi layar baru (misalnya 1920x1080): "
rem Tambahkan perintah untuk mengatur resolusi layar
echo Resolusi layar berhasil diatur menjadi: %resolusi_baru%
pause
goto menu_setting

:ubah_volume_suara
cls
echo Ubah Volume Suara
echo ------------------------
set /p "volume_baru=Masukkan level volume baru (0-100): "
rem Tambahkan perintah untuk mengubah volume suara
echo Volume suara berhasil diubah menjadi: %volume_baru%
pause
goto menu_setting

:menu_utama
cls
echo Kembali ke Menu Utama...
timeout 2
goto menu

:keluar
cls
echo Terima kasih telah menggunakan Aplikasi Menu.
pause
exit
