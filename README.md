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
