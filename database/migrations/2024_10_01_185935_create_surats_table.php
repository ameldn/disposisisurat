<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('surats', function (Blueprint $table) {
            $table->id();
            $table->foreignId('mahasiswa_id')->constrained()->onDelete('cascade');
            $table->enum('jenis_surat', ['Keterangan Aktif Kuliah', 'Izin Magang', 'Izin Penelitian']);
            $table->json('detail_surat');  // Kolom JSON untuk menyimpan detail dinamis surat
            $table->date('tanggal_pengajuan');
            $table->enum('status', ['Menunggu', 'Diproses', 'Disetujui', 'Ditolak'])->default('Menunggu');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('surats');
    }
};
