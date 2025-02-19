<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kalkulator</title>
</head>
<body class="bg-light">
<div class="container mt-5">
<div class="row">
<div class="col-md-6">
<div class="card p-4 shadow-sm text-center">
<div class="form-control text-end fs-2 mb-3" id="tampilanhasil">0</div>
<div class="row g-2">
<div class="col-3"></div>
<div class="col-3"></div>
<div class="col-3"><button class="btn btn-dark" style="width: 100%;" onclick="hapussatuangka()">DEL</button></div>

<div class="col-3"><button class="btn btn-danger" style="width: 100%;" onclick="hapusangka()">C</button></div>
<div class="col-3"><button class="btn btn-secondary" style="width: 100%;" onclick="tambahangka('7')">7</button></div>
<div class="col-3"><button class="btn btn-secondary" style="width: 100%;" onclick="tambahangka('8')">8</button></div>
<div class="col-3"><button class="btn btn-secondary" style="width: 100%;" onclick="tambahangka('9')">9</button></div>
<div class="col-3"><button class="btn btn-light" style="width: 100%;" onclick="operasiperhitungan('/')">/</button></div>
<div class="col-3"><button class="btn btn-secondary" style="width: 100%;" onclick="tambahangka('4')">4</button></div>
<div class="col-3"><button class="btn btn-secondary" style="width: 100%;" onclick="tambahangka('5')">5</button></div>
<div class="col-3"><button class="btn btn-secondary" style="width: 100%;" onclick="tambahangka('6')">6</button></div>
<div class="col-3"><button class="btn btn-light" style="width: 100%;" onclick="operasiperhitungan('*')">x</button></div>
<div class="col-3"><button class="btn btn-secondary" style="width: 100%;" onclick="tambahangka('1')">1</button></div>
<div class="col-3"><button class="btn btn-secondary" style="width: 100%;" onclick="tambahangka('2')">2</button></div>
<div class="col-3"><button class="btn btn-secondary" style="width: 100%;" onclick="tambahangka('3')">3</button></div>
<div class="col-3"><button class="btn btn-light" style="width: 100%;" onclick="operasiperhitungan('-')">-</button></div>
<div class="col-3"><button class="btn btn-secondary" style="width: 100%;" onclick="tambahangka('0')">0</button></div>
<div class="col-3"><button class="btn btn-info" style="width: 100%;" onclick="hitung()">=</button></div>
<div class="col-3"></div>
<div class="col-3"><button class="btn btn-light" style="width: 100%;" onclick="operasiperhitungan('+')">+</button></div>

                </div>
            </div>
        </div>

<div class="col-md-6">
<div class="card p-4">
<h3 class="mb-3 text-center">Hasil Perhitungan</h3>
<a href="<?= base_url('home/hapussemuahasil') ?>">
    <button class="btn btn-danger">Hapus Hasil</button>
</a>
<table class="table">
    <thead class="table">
        <tr>
            <th>No</th>
            <th>Perhitungan</th>
        </tr>
    </thead>
    <tbody id="tableBody">
        <?php
            $no = 1;
             foreach ($yoga as $ok) {
        ?>
        <tr>
            <td><?= $no++ ?></td>
            <td><?= ($ok->perhitungan) ?></td>
            <td>
                
            </td>
        </tr>
        
        <?php } ?>
    </tbody>
</table>
</div>
</div>
</div>
</div>
</div>

<script>
let sedanginput = '';
let operasi = '';
let datapertama = '';
let hasilakhir = null;

function updatetampilan() {
    document.getElementById("tampilanhasil").innerText = 
        (datapertama + " " + operasi + " " + sedanginput).trim() || "0";
}


function tambahangka(angka) {
    if (hasilakhir !== null && operasi === '') {
        datapertama = angka;
        hasilakhir = null;
    } else if (!operasi) {
        datapertama += angka;
    } else {
        sedanginput += angka;
    }
    updatetampilan();
}

function operasiperhitungan(op) {
    if(hasilakhir !== null) {
        datapertama = hasilakhir.toString();
        hasilakhir = null;
    }
    if (datapertama !== '') {
        operasi = op;
        sedanginput = '';
    }
    updatetampilan();
}

function hitung() {
    if (!operasi || !datapertama || !sedanginput) return;

    let angka1 = parseFloat(datapertama);
    let angka2 = parseFloat(sedanginput);
    let hasil = 0;
    let operasisebelumreset = operasi;

    if (operasi === '+') {
        hasil = angka1 + angka2;
    } else if (operasi === '-') {
        hasil = angka1 - angka2;
    } else if (operasi === '*') {
        hasil = angka1 * angka2;
    } else if (operasi === '/') {
        if (angka2 === 0) {
            alert("TIDAK BOLEH BAGI NOL");
            return;
        }
        hasil = angka1 / angka2;
    }

    hasilakhir = hasil;
    datapertama = String(hasil);
    sedanginput = '';
    operasi = '';

    updatetampilan();
    simpandata(angka1, operasisebelumreset, angka2, hasil);
}

function simpandata(angka1, operasi, angka2, hasil){

let formData = new FormData();
let perhitungan = angka1 + " " + operasi + " " + angka2 + " = " + hasil;
formData.append("perhitungan", perhitungan);
    fetch('/home/aksi_t_hasil', {
        method: 'POST',
        body: formData
    })
    .then(() => {
        let table = document.getElementById("tableBody");
        let row = table.insertRow();
        let noCell = row.insertCell(0);
        let calcCell = row.insertCell(1);

        noCell.textContent = table.rows.length;
        calcCell.textContent = perhitungan;
    });
}

function hapusangka() {
    sedanginput = '';
    operasi = '';
    datapertama = '';
    hasilakhir = null;
    updatetampilan();
}

function hapussatuangka() {
    if (sedanginput) {
        sedanginput = sedanginput.slice(0, -1);
    } else if (operasi) {
        operasi = '';
    } else if (datapertama) {
        datapertama = datapertama.slice(0, -1);
    }
    updatetampilan();
}

</script>
</body>
</html>