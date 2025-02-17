<section class="section">
    <div class="row" id="basic-table">
        <div class="col-12 col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Tambah Upload</h4>
                </div>
                <div class="card-body">
                    <!-- Form Utama -->
                    <form action="<?= base_url('home/aksi_t_upload') ?>" method="post" enctype="multipart/form-data">
                        <div id="form-container">
                            <!-- Form Tambah Modal 1 (Form Pertama) -->
                            <div class="modal-form">
                                <div class="row">

                                    <div class="col-md-7 mb-3">
                                        <label for="foto">Nama Foto:</label>
                                        <input type="text" class="form-control" name="nama_upload" placeholder="Masukkan Nama Foto" >
                                    </div>

                                    <div class="col-md-7 mb-3">
                                        <label for="nama_siswa">Foto:</label>
                                        <input type="file" class="form-control" name="file" >
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <button type="submit" class="btn btn-info">Save</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
