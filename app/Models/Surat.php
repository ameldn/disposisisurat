<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Surat extends Model
{
    use HasFactory;
    protected $fillable = ['mahasiswa_id', 'jenis_surat', 'detail_surat', 'tanggal_pengajuan', 'status','file'];

    protected $casts = [
        'detail_surat' => 'array',  // Casting kolom detail_surat sebagai array
        'tanggal_pengajuan' => 'date',
    ];

    public function mahasiswa(): BelongsTo
    {
        return $this->belongsTo(Mahasiswa::class);
    }
}
