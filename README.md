# SaveKost
 <img src="https://github.com/Faisalia/mabatua/blob/main/assets/images/logo.png?raw=true">
 
  • Kelompok 1 R3 Manajemen Perangkat Perangkat Lunak (MPPL)

## Anggota dan Role :
<table>
    <thead>
        <tr>
            <th></th>
            <th>Nama</th>
            <th>NIM</th>
            <th>Role</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>Antonius Anre Sianturi</td>
            <td>G64190053</td>
            <td>Project Manager</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Renny Atikasari</td>
            <td>G64190040</td>
            <td>System Analyst</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Faisal Ibrahin Abusalam</td>
            <td>G64190054</td>
            <td>UI/UX</td>
        </tr>
        <tr>
            <td>4</td>
            <td>Bobby Williams K. Hara</td>
            <td>G64190061</td>
            <td>Front End Developer</td>
        </tr>
        <tr>
            <td>5</td>
            <td>Kreshna Bayu Ananta Phasya</td>
            <td>G64190098</td>
            <td>Back End Developer</td>
        </tr>
    </tbody>
</table>

## Deskripsi Aplikasi
Aplikasi yang dibuat adalah sebuah aplikasi rekomendasi perencanaan keuangan biaya makan dalam rentang waktu tertentu. Aplikasi ini akan memberikan rekomendasi pengeluaran seseorang berdasarkan jumlah dana yang dimiliki orang tersebut saat ini dan rentang waktu yang diinginkan pengguna.

## Latar Belakang
Kehidupan sehari-hari tidak terlepas dari adanya pengeluaran untuk mencukupi kebutuhan. Salah satu kebutuhan primer dari manusia adalah makan. Kerap kali pengeluaran yang diarahkan untuk membeli makanan tidak terkontrol yang membuat pengeluaran seseorang membengkak karena pembelian makanan di luar kebutuhan seharusnya. Oleh karena itu, aplikasi perencanaan keuangan dibuat guna mengontrol keuangan secara lebih baik sekaligus menjadi pengingat ataupun motivasi untuk mengeluarkan uang sesuai kemampuan dan kebutuhan.

## Tujuan
Pengembangan ini dilakukan dengan tujuan untuk memberikan rekomendasi pengeluaran makanan yang digunakan user berdasarkan dana yang dimiliki, hal ini memungkinkan agar dana bisa dipakai sesuai dengan porsinya.

## Ruang Lingkup
Adapun batasan yang akan diberlakukan pada pengembangan proyek kali ini adalah :
* Projek ini akan mencakup pemberian rekomendasi pengeluaran makanan per hari
* Rekomendasi outlet-outlet makanan akan menjadi bagian dari proyek
* Tidak terdapat fitur pembayaran ataupun pemesanan makanan
* Fitur penyimpanan saldo tidak akan dikembangkan

## Research Plan
   ### Empathy Map
   <img src="https://github.com/Faisalia/mabatua/blob/main/Research%20Plan/Empathy%20Map.png?raw=true">
   
   ### Customer Journey
   <img src="https://github.com/Faisalia/mabatua/blob/main/Research%20Plan/Customer%20Journey.png?raw=true">
   
   ### User Persona
   <img src="https://github.com/Faisalia/mabatua/blob/main/Research%20Plan/User%20Persona.png?raw=true">
   
## System Analysis
   ### Use Case Diagram
  <img src="https://github.com/Faisalia/mabatua/blob/main/System%20Analyst/Use%20Case%20-%20Save%20Kost.jpg?raw=true">
  
   ### Activity Diagram
   <img src="https://github.com/Faisalia/mabatua/blob/main/System%20Analyst/Activity%20Diagram%20-%20Save%20Kost.jpg?raw=true">
   
   ### ERD
   <img src="https://github.com/Faisalia/mabatua/blob/main/System%20Analyst/ERD%20-%20Save%20Kost.png?raw=true">
   
   ### Class Diagram
   <img src="https://github.com/Faisalia/mabatua/blob/main/System%20Analyst/Class%20Diagram%20-%20Save%20Kost.png?raw=true">
   
## Prototype
Dapat dilihat pada link berikut <a href="https://www.figma.com/proto/o0rv4COFL3Mg1k44Tf7Tmi/SaveKost?node-id=12%3A19&scaling=min-zoom&page-id=9%3A85&starting-point-node-id=12%3A19" target="_blank">Prototype SaveKost</a>

## Link Video Demo
Dapat dilihat pada link berikut <a href="https://drive.google.com/file/d/1e-v465rF0VzXwBoo65sx7CCz3lyRq6xT/view?usp=drivesdk" target="_blank">Video Demo Aplikasi Savekost</a>

## Link Aplikasi
Dapat dilihat pada link berikut <a href="https://drive.google.com/file/d/1dCzf-q4iQ-97j8Y-sldPqGzBVMX6vA4d/view?usp=drivesdk" target="_blank">APK Savekost</a>

## Testing
### Login
<table>
    <tbody>
        <tr>
            <td>ID</td>
            <td>TC01</td>
        </tr>
        <tr>
            <td>Name</td>
            <td>Login gagal</td>
        </tr>
        <tr>
            <td>Description</td>
            <td>Pengguna melakukan login ke dalam aplikasi</td>
        </tr>
        <tr>
            <td>Precondictions</td>
            <td>Pengguna sudah terdaftar dan poerangkat seluler terhubung internet</td>
        </tr>
        <tr>
            <td>Steps</td>
            <td> 
              <ul>
               <li>Pengguna memasukkan username</li>
               <li>Pengguna memasukkan password</li>
               <li>Menekan tombol login</li>
              </ul>
            </td>
        </tr>
        <tr>
            <td>Expected Results</td>
            <td>Pengguna berhasil login dan masuk ke halaman input dana dan rentang waktu</td>
        </tr>
        <tr>
            <td>Results</td>
            <td>Accepted</td>
        </tr>
    </tbody>
</table>

### Login 2
<table>
    <tbody>
        <tr>
            <td>ID</td>
            <td>TC02</td>
        </tr>
        <tr>
            <td>Name</td>
            <td>Login gagal</td>
        </tr>
        <tr>
            <td>Description</td>
            <td>Pengguna melakukan login ke dalam aplikasi dan salah memasukkan password atau username</td>
        </tr>
        <tr>
            <td>Precondictions</td>
            <td>Pengguna sudah terdaftar dan perangkat seluler terhubung internet</td>
        </tr>
        <tr>
            <td>Steps</td>
            <td> 
              <ul>
               <li>Pengguna memasukkan username yang sesuai</li>
               <li>Pengguna memasukkan password yang tidak sesuai</li>
               <li>Menekan tombol login</li>
              </ul>
            </td>
        </tr>
        <tr>
            <td>Expected Results</td>
            <td>Pengguna kembali ke halaman login dengan peringatan password yang dimasukkan tidak sesuai</td>
        </tr>
        <tr>
            <td>Results</td>
            <td>Accepted</td>
        </tr>
    </tbody>
</table>

### Register
<table>
    <tbody>
        <tr>
            <td>ID</td>
            <td>TC03</td>
        </tr>
        <tr>
            <td>Name</td>
            <td>Register berhasil</td>
        </tr>
        <tr>
            <td>Description</td>
            <td>Pengguna baru mendaftar ke dalam aplikasi</td>
        </tr>
        <tr>
            <td>Precondictions</td>
            <td>Pengguna seluler terhubung internet</td>
        </tr>
        <tr>
            <td>Steps</td>
            <td> 
              <ul>
               <li>Pengguna mengisi username, nama depan, nama belakang password dan konfirmasi password</li>
               <li>Pengguna menekan tombol daftar</li>
              </ul>
            </td>
        </tr>
        <tr>
            <td>Expected Results</td>
            <td>Pengguna berhasil terdaftar dan masuk ke laman login</td>
        </tr>
        <tr>
            <td>Results</td>
            <td>Accepted</td>
        </tr>
    </tbody>
</table>


### Register 2
<table>
    <tbody>
        <tr>
            <td>ID</td>
            <td>TC04</td>
        </tr>
        <tr>
            <td>Name</td>
            <td>Register gagal</td>
        </tr>
        <tr>
            <td>Description</td>
            <td>Pengguna baru mendaftar ke dalam aplikasi namun terdapat kesalahan input pendaftaran</td>
        </tr>
        <tr>
            <td>Precondictions</td>
            <td>Pengguna sudah terdaftar dan perangkat seluler terhubung internet</td>
        </tr>
        <tr>
            <td>Steps</td>
            <td> 
              <ul>
               <li>Pengguna mengisi username, nama depan, nama belakang password dan konfirmasi password</li>
               <li>Pengguna mengisi input konfirmasi password yang tidak sesuai</li>
              </ul>
            </td>
        </tr>
        <tr>
            <td>Expected Results</td>
            <td>Pengguna gagal terdaftar dan kembali ke halaman registrasi dengan peringatan konfirmasi password yang dimasukkan tidak sesuai</td>
        </tr>
        <tr>
            <td>Results</td>
            <td>Accepted</td>
        </tr>
    </tbody>
</table>

### Rekomendasi
<table>
    <tbody>
        <tr>
            <td>ID</td>
            <td>TC05</td>
        </tr>
        <tr>
            <td>Name</td>
            <td>Rekomendasi berhasil</td>
        </tr>
        <tr>
            <td>Description</td>
            <td>Pengguna melakukan input dana dan rentang waktu untuk mendapatkan dana anjuran dan list rekomendasi</td>
        </tr>
        <tr>
            <td>Precondictions</td>
            <td>Pengguna sudah login</td>
        </tr>
        <tr>
            <td>Steps</td>
            <td> 
              <ul>
               <li>Pengguna memasukan dana yang dimiliki dan rentang waktu penggunaan dana</li>
               <li>Pengguna menekan tombol di sebelah tempat input</li>
              </ul>
            </td>
        </tr>
        <tr>
            <td>Expected Results</td>
            <td>Pengguna ditampilkan dana anjuran dan list rekomendasi makanan</td>
        </tr>
        <tr>
            <td>Results</td>
            <td>Accepted</td>
        </tr>
    </tbody>
</table>
## Documents

