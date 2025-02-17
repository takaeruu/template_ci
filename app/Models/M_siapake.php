<?php

namespace App\Models;

use CodeIgniter\Model;

class M_siapake extends Model
{

    public function tambah($table, $isi)
    {
        return $this->db->table($table)
            ->insert($isi);
    }
public function tampil($yoga)
    {
        return $this->db->table($yoga)
            ->get()
            ->getResult();
    }
    public function hapus($table, $where)
    {
        return $this->db->table($table)
            ->delete($where);
    }

    public function getAllFolders() {
        return $this->db->table('folder')
            ->get()
            ->getResultArray(); // Mengembalikan hasil sebagai array
    }
    
    
    public function tampilwhere($yoga, $where)
{
    // Jika kondisi where diberikan, maka tambahkan ke query
    return $this->db->table($yoga)
        ->where($where) // Menambahkan kondisi where jika ada
        ->get()
        ->getResult();
}

protected $table = 'user'; // Nama tabel
protected $primaryKey = 'id_user';  // Primary key tabel
protected $allowedFields = ['password'];
public function resetPassword($id)
    {
        // Mengatur password menjadi '1' dan mengenkripsinya dengan MD5
        $hashedPassword = md5('1'); // Password yang diatur menjadi '1' setelah di-hash
        return $this->update($id, ['password' => $hashedPassword]);
    }

    public function getById($id)
    {
        return $this->db->table('user')
            ->where('id_user', $id)
            ->get()
            ->getRow();
    }

    public function getPassword($userId)
    {
        return $this->db->table('user')
            ->select('password')
            ->where('id_user', $userId)
            ->get()
            ->getRow()
            ->password;
    }

public function get_detail($table, $where)
{
    return $this->db->table($table)->where($where)->get()->getRow();
}

public function get_pelamar_email($id_pelamar)
{
    $query = $this->db->query("
        SELECT u.email, p.nama_pelamar 
        FROM pelamar p
        JOIN user u ON p.id_user = u.id
        WHERE p.id_pelamar = $id_pelamar
    ");
    
    return $query->getRow();
}

public function tampilwherepelamar($table, $where) {
    return $this->db->table($table)
        ->select('pelamar.*, lowongan.nama_lowongan') // Mengambil data dari pelamar dan nama_lowongan dari lowongan
        ->join('lowongan', 'pelamar.id_lowongan = lowongan.id_lowongan') // Disesuaikan dengan kolom yang sesuai
        ->where($where)
        ->get()->getResult();
}
public function tampilpelamar($yoga)
{
    return $this->db->table($yoga)
        ->select('pelamar.*, lowongan.nama_lowongan') // Ambil semua kolom pelamar dan nama lowongan
        ->join('lowongan', 'pelamar.id_lowongan = lowongan.id_lowongan')
        ->get()
        ->getResult();
}


public function tampil_karyawan()
{
    return $this->db->table('karyawan')
        ->select('karyawan.*, pelamar.nama_pelamar, pelamar.id_lowongan, lowongan.nama_lowongan')
        ->join('pelamar', 'karyawan.id_pelamar = pelamar.id_pelamar')
        ->join('lowongan', 'pelamar.id_lowongan = lowongan.id_lowongan')
        ->get()
        ->getResult();
}
public function tampilByLevel($table, $levels)
{
    return $this->db->table($table)
        ->where('id_level', $levels) // Filter berdasarkan id_level
        ->get()
        ->getResult();
}


    public function edit($tabel, $isi, $where)
    {
        return $this->db->table($tabel)
            ->update($isi, $where);
    }
    public function getWhere1($table, $where)
    {
        return $this->db->table($table)->where($where)->get();
    }

    public function restoreProduct($table,$column,$id)
    {
        // Ambil data dari tabel backup
        $backupData = $this->db->table($table)->where($column, $id)->get()->getRowArray();
    
        if ($backupData) {
            // Tentukan nama tabel utama tempat data akan di-restore
            $mainTable = str_replace('_backup', '', $table);
    
            // Update data di tabel utama
            $this->db->table($mainTable)->where($column, $id)->update($backupData);
        }
    }
    
    // Model join
public function join($tabel1, $tabel2, $on)
{
    return $this->db->table($tabel1)
                    ->join($tabel2, $on, 'left')
                    ->get();
}

public function getJenisSuratOptions() {
    return $this->db->table('jenis_surat')->get()->getResultArray();
}


public function getDokumenById($id_dokumen) {
    return $this->db->table('dokumen')
                    ->join('jenis_surat', 'jenis_surat.id_jenis_surat = dokumen.id_jenis_surat', 'left')
                    ->join('surat_masuk', 'surat_masuk.id_surat_masuk = dokumen.id_surat_masuk', 'left')
                    ->join('surat_keluar', 'surat_keluar.id_surat_keluar = dokumen.id_surat_keluar', 'left')
                    ->join('surat_keterlambatan', 'surat_keterlambatan.id_surat_keterlambatan = dokumen.id_surat_keterlambatan', 'left')
                    ->join('pengajuan_cuti', 'pengajuan_cuti.id_pengajuan_cuti = dokumen.id_pengajuan_cuti', 'left')
                    ->where('id_dokumen', $id_dokumen)
                    ->get()
                    ->getRowArray();
}

public function join2($tabel1, $tabel2, $on)
{
    // Lakukan join dan ambil hasilnya sebagai array objek
    return $this->db->table($tabel1)
                    ->join($tabel2, $on, 'left')
                    ->get()
                    ->getResult(); // Mengembalikan hasil sebagai array objek
}


public function get_surat_masuk_with_access()
{
    return $this->db->table('surat_masuk')
                    ->select('surat_masuk.*, GROUP_CONCAT(surat_masuk_user.status) as akses_level')
                    ->join('surat_masuk_user', 'surat_masuk.id_surat_masuk = surat_masuk_user.id_surat_masuk', 'left')
                    ->groupBy('surat_masuk.id_surat_masuk')
                    ->get()
                    ->getResult();
}
public function join1($tabel1, $tabel2, $on)
    {
        return $this->db->table($tabel1)
            ->join($tabel2, $on, 'inner')
            ->get()
            ->getResult();
    }

    
    public function getWhere($tabel,$where){
        return $this->db->table($tabel)
                        ->getwhere($where)
                        ->getRow();
    }
    public function logActivity($data)
{
    return $this->db->table('user_activity')->insert($data);
}
public function getSuratKeluarById($id_surat_keluar)
{
    return $this->where('id_surat_keluar', $id_surat_keluar)
                ->first(); // Mengambil 1 data berdasarkan id_surat_keluar
}

public function getAllUsers()
{
    // Fetch all users for the dropdown filter
    return $this->db->table('user')->select('id_user, username')->get()->getResultArray();
}

public function getLogsByUser($userId)
    {
        $builder = $this->db->table('user_activity');
        $builder->join('user', 'user.id_user = user_activity.id_user');
        $builder->select('user_activity.*, user.username');
        $builder->where('user_activity.id_user', $userId);  // Filter by user ID
        $builder->orderBy('time', 'DESC');
        
        $query = $builder->get();
    
        if ($query === false) {
            $error = $this->db->error();
            log_message('error', 'Query error: ' . $error['message']);
            return [];
        }
    
        return $query->getResultArray();
    }

    public function getLogs()
{
    $builder = $this->db->table('user_activity');  // Pastikan nama tabel benar
    $builder->join('user', 'user.id_user = user_activity.id_user');
    $builder->select('user_activity.*, user.username');
    $builder->orderBy('time', 'DESC');
    
    $query = $builder->get();

    if ($query === false) {
        // Log the error for debugging
        $error = $this->db->error();
        log_message('error', 'Query error: ' . $error['message']);
        return [];
    }

    return $query->getResultArray();
}

// In M_eoffice model
public function getDocumentsByJenisSurat($id_jenis_surat) {
    switch ($id_jenis_surat) {
        case 3:
            return $this->db->table('pengajuan_cuti')->where('id_jenis_surat', $id_jenis_surat)->get()->getResult();
        case 2:
            return $this->db->table('surat_masuk')->where('id_jenis_surat', $id_jenis_surat)->get()->getResult();
        case 1:
            return $this->db->table('surat_masuk')->where('id_jenis_surat', $id_jenis_surat)->get()->getResult();
        case 4:
            return $this->db->table('surat_keterlambatan')->where('id_jenis_surat', $id_jenis_surat)->get()->getResult();
        default:
            return []; // Jika id_jenis_surat tidak ditemukan
    }
}

public function getFolderByJenisSurat($id_jenis_surat) {
    return $this->db->table('folder')->where('id_jenis_surat', $id_jenis_surat)->get()->getRowArray();
}



public function tampilrestore($yoga)
    {
        return $this->db->table($yoga)
            ->where('deleted_at IS NOT NULL') // Menambahkan kondisi deleted_at IS NOT NULL
            ->get()
            ->getResult();
    }

    public function tampilActive($tableName)
{
    return $this->db->table($tableName)
        ->where('deleted_at', null) // Filtering records where deleted_at is null
        ->get()
        ->getResult();
}

public function tampil_user()
{
    return $this->db->table('user')
        ->select('user.*, level.level')
        ->join('level', 'user.id_level = level.id_level')
        ->get()
        ->getResult();
}

public function saveToBackup($table, $data)
    {
        return $this->db->table($table)->insert($data);
    }

    public function get_pelamar_by_id($id_lamaran)
    {
        return $this->db->table('pelamar')
            ->select('nama_pelamar, id_user') // Pastikan kolom sesuai
            ->where('id_pelamar', $id_lamaran)
            ->get()
            ->getRow();
    }

    // Method untuk mengambil data user berdasarkan id_user
    public function get_user_by_id($id_user)
{
    return $this->db->table('user')
        ->select('email') // Pilih hanya kolom email
        ->where('id_user', $id_user)
        ->get()
        ->getRow();
}


}