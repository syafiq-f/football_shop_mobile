# football_shop

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

================================================== TUGAS 7 ===========================================================================
NOMOR 1 
Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
widget adalah objek dari UI yang dapat dikonfigurasi tampilan dan apa yang bisa dilakukannya. Sedangkan widget tree adalah struktur hierarkis dari widget-widget tersebut: satu widget menjadi “parent” (induk) dan bisa memiliki satu atau beberapa “child” (anak). Hubungannya adalah parent ngeconfigure dasar dasarnya seperti layout, constraint dan child itu ada di dalem parent buat ngambil bagiannya.

NOMOR 2
Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
MaterialApp	= Root app dengan tema dan navigasi global (Stateless)
Scaffold = Struktur dasar halaman (AppBar, Body, FAB)	(Stateless)
AppBar = Header dengan judul “Football News” (Stateless)
Padding = Memberi jarak di sekitar elemen	(Layout)
Column = Menyusun widget anak secara vertikal	(Layout)
Row = Menyusun InfoCard sejajar horizontal	(Layout)
InfoCard = Widget kustom berisi Card dengan NPM, nama, kelas (Stateless)
Card = Menampilkan informasi dengan bayangan lembut	(Stateless)
GridView.count = Menampilkan 3 item (ItemCard) dalam grid 3 kolom	(tateful)
ItemHomepage = Model data berisi nama, ikon, dan warna item	Model Class
ItemCard = Widget tombol warna-warni dengan ikon dan teks	Stateless
Material = Membuat tampilan sesuai gaya Material Design	UI Wrapper
InkWell = Menangani aksi klik (onTap)	Interactive
SnackBar = Pesan sementara muncul saat klik tombol	Overlay widget

NOMOR 3
Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Karena Materialapp merupakan widget yang membungkus semua widget widget penting lainnya seperti informasi tema, informasi routing pokoknya dasar biar widget2 lainnya tuh bisa ngeliat dasarnya tuh aplikasi ini tampilannya gimana dll makannya dijadiin root. Biar semua yang ada diatasnya ngeadapt sama apa yang udah di settle di awal.

NOMOR 4
Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
StatelessWidget adalah widget yang tampilan dan datanya tidak berubah setelah dibangun; ia hanya menerima nilai lewat konstruktor lalu merender UI berdasarkan nilai tersebut. Widget jenis ini cocok untuk komponen item menu yang hanya menampilkan data mutlak.

StatefulWidget memiliki objek State yang bisa berubah saat aplikasi berjalan melalui setState(), sehingga UI dapat diperbarui tanpa membuat ulang seluruh aplikasi. Ini dipakai kalo ada tampilan yang bakal berubah ketika user melakukan sesuatu misal add review kan reviewnya bakal naik gitu

NOMOR 5
Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang merepresentasikan posisi sebuah widget di dalam widget tree, sehingga widget tersebut bisa “melihat” ke atas dan mengakses hal-hal yang sudah disediakan di level lebih tinggi, seperti tema (Theme.of(context)), navigator (Navigator.of(context)), atau ukuran layar (MediaQuery.of(context)). Tanpa context yang benar, widget tidak tahu berada di dalam MaterialApp atau tidak, sehingga tidak bisa mengambil tema atau menampilkan SnackBar.Makannya konteks harus digunakan di dalam fase building widget widget lainnya, bukan disimpan aja gitu sembarangan buat dipake nanti setelah widget dibuang.

NOMOR 5
Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot reload adalah fitur Flutter yang menambahkan perubahan kode Dart ke aplikasi yang sedang berjalan lalu melakukan rebuild widget tree tanpa mengulang seluruh aplikasi, sehingga state yang sudah ada (misalnya halaman yang sedang dibuka atau nilai variabel di State) tetap dipertahankan. Ini bagus buat peruubahan UI kecil seperti mengubah teks, warna, padding, atau menambah widget di layout. 

Hot restart berbeda adaalh ketika Flutter akan menjalankan ulang aplikasi dari main(), membuang seluruh state, dan membangun ulang widget tree dari awal

================================================== TUGAS 8 ===========================================================================
NOMOR 1
Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Jadi sistem page pada flutter itu pake sistem stack, makannya ada push dan pushreplacement. Bedanya apa? Kalau pake push itu bakal nambahin page tersebut ke tumpukkan stack dan bisa back, jadi misal di footballshop itu kayak form buat input productnya, meskipun pagenya udah ditambah ke stack dan  kita udah pindah halaman lah intinya dia masih bisa balik ke awal. Sedangkan pushreplacement itu lebih kearah dia bakal ngegantiin current stack, dia dipake di drawer karena drawer itu lebih ke inisiasi pindah page bukan sementara doang.

NOMOR 2
Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Scaffold itu kerangka dasar halaman. Biar semua halaman YANG DIBUAT itu bentuknya konsisten 
AppBar bakal dipake di semua halaman supaya user tahu mereka masih di aplikasi yang sama
Drawer ditempel ke Scaffold yang butuh navigasi global
jadi kodenya kek gini 
return Scaffold(
  appBar: AppBar(
    title: const Text('Football Shop'),
  ),
  drawer: const LeftDrawer(), // ini Drawer sama di semua halaman
  body: ... // ini bisaa diisi halaman yang beda beda
);
Karena Scaffold-nya konsisten, jadi gak perlu bikin ulang drawer di setiap tempat—cukup panggil widget drawer yang sama aja

NOMOR 3
Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

padding itu buat memposisikan formnya gimana biar gak nempel diujung ujung banget jadi dikasih padding biar bisa ketengahan applied to all form ini
singlechilscrollview itu penting banget buat form panjang, jadi kalau keyboard muncul atau layar kecil, form masih bisa discroll dan gak bikin overflow dipake ditambah produk
Kalau litview atau column digunakan buat menata elemen-elemen dalam formulir secara vertikal

NOMOR 4
 Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
 membuat semacam class yang mengidentifikasikan kira kira warna, design, dll apa saja yang mainly akan dipakai dan tinggal dipanggil di fungsi2 bawahnya supaya sesuai semua tanpa harus build design ulang

================================================== TUGAS 9 ===========================================================================
NOMOR 1
1. Mengapa perlu model Dart? Apa akibatnya kalau pakai Map saja?
Model Dart itu sebenarnya dipakai supaya data JSON yang diterima atau dikirim punya struktur yang jelas dan aman. Kalo pakae Map<String, dynamic>, emang gampang si tapi rawan banget salah ketik key, salah tipe data, atau dapat null yang bikin aplikasi crash tanpa ketauan gitu susah keliatannya

NOMOR 2
2. Apa fungsi http dan CookieRequest? Apa bedanya?

http itu kayak alat standar buat kirimget atau post tanpa ada fitur tambahan—semua manual, termasuk cookie dan session. Meanwhile,  CookieRequest itu khusus banget buat Django karena dia otomatis nyimpen dan ngirim cookie session dari server. Jadi kalau login, Django bikin session, dan CookieRequest otomatis bawa cookie itu ke request berikutnya. Tapi kalau pakai `http`, jadi harus nyimpen cookie sendiri

NOMOR 3
3. Mengapa CookieRequest harus dibagikan ke semua komponen?

CookieRequest harus dishare karena session login ada di dalam instance CookieRequest itu. Kalo tiap halaman punya instance sendiri, session-nya nggak kebawa, dan Flutter bakal ngira kita belom login. Makanya harus dibungkus pakai Provider di root widget, supaya semua halaman—dari login, list produk, sampai detail—pakai instance CookieRequest yang sama

NOMOR 4
4. Mengapa perlu ALLOWED_HOSTS, CORS, SameSite, dan izin Internet Android?
Flutter dan Django sebenarnya saling komunikasi lewat Internet, tapi emulator Android itu punya alamat sendiri, bukan localhost, jadi harus pakai `10.0.2.2`. makannya django pun harus diizinkan menerima alamat itu di allowed host, kalau gak ya Django bakal menolak request. CORS juga harus dibuka sedikit supaya Android boleh mengambil data dari Django, karena kalau tidak bakal dianggap request lintas domain yang mencurigakan. Pengaturan SameSite/cookie diperlukan supaya cookie session bisa dikirim balik ke Django tanpa diblokir oleh aturan keamanan browser/OS. Dan AndroidManifest wajib menambahkan izin Internet, kalau tidak, aplikasinya tidak bisa request ke mana-mana. Kalau salah satu setting ini lupa, hasilnya request gagal, login nggak tersimpan, atau gambar/thumbnails ga bisa diload

NOMOR 5
5. Mekanisme pengiriman data dari input ke Flutter
Ketika user mengisi form di Flutter, data itu dikumpulkan dalam variabel, lalu diubah menjadi JSON menggunakan jsonencode. JSON itu dikirim ke Django melalui CookieRequest atau http POST. Django menerima JSON, memvalidasi, menyimpannya ke database, lalu ngebales JSON baru sebagai respons. Flutter kemudian menerima respons ini dan menampilkan perubahan tersebut di UI. Jadi kayak oper operan data aja buat nyamain

NOMOR 6
6. Mekanisme autentikasi login-register-logout
pas waktu login, Flutter ngirim username dan password ke endpoint Django, dan Django bakal memeriksa kecocokan data dengan database, kalau benar, Django membuat session dan memberikan cookie ke Flutter melalui CookieRequest. 
CookieRequest menyimpan cookie itu sehingga setiap request berikutnya otomatis bakal terautentikasi. Pada register, Flutter hanya mengirim data user baru, Django buat usernya, lalu Flutter bisa langsung login setelahnya. 
Logout ya bekerja dengan mengirim permintaan logout ke Django, Django menghapus session user, dan Flutter membuang cookie lokal lalu kembali ke halaman login.semuanya berjalan memakai mekanisme cookie session Django.

NOMOR 7
7. Bagaimana mengimplementasikan checklist secara bertahap
membuat model Django dan endpoint JSON dulu biar Flutter punya data yang bisa dibaca
buat model Dart lewat Quicktype biar parsing JSON lebih aman
konfigurasi CookieRequest di main.dart supaya satu instance dipakai di seluruh aplikasi lewat Provider
buat file halaman list, card, detail, dan form yang semuanya mengambil atau mengirim data memakai CookieRequest.
pasang proxy-image dan perbaikan ALLOWED_HOSTS, CORS, serta izin Internet Android supaya gambar dan request bisa masuk ke Django
terakhir itu implementasi login-register-logout dengan CookieRequest, buat mastiin semua navigasi bekerja dari halaman ke halaman
