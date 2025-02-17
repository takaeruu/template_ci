<section class="section">
    <div class="row" id="basic-table">
        <div class="col-12 col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Edit Upload</h4>
                </div>
                <div class="card-body">
                    <!-- Form Utama -->
                    <form action="<?= base_url('home/aksi_e_upload') ?>" method="post" enctype="multipart/form-data">
                        <div id="form-container">
                            <!-- Form Tambah Modal 1 (Form Pertama) -->
                            <div class="modal-form">
                                <div class="row">

                                    <div class="col-md-7 mb-3">
                                        <label for="foto">Nama Foto:</label>
                                        <input type="text" class="form-control" name="nama_upload" value="<?= $oke->nama_upload ?>" >
                                    </div>

                                    <div class="col-md-7 mb-3">
    <label for="nama_siswa">Foto:</label>
    <input type="file" class="form-control" name="file">
    <?php if (!empty($oke->foto)) { ?>
        <br>
        <img src="<?= base_url('uploads/' . $oke->foto) ?>" alt="Preview" width="500">
    <?php } ?>
</div>


                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-12">
                            <input type="hidden" name="id_upload" value="<?= $oke->id_upload ?>">
                                <button type="submit" class="btn btn-info">Save</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
