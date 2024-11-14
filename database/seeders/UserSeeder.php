<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Mahasiswa;
use App\Models\Staf;
use App\Models\Kaprodi;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Seeding Staff
        $user = User::create([
            'name' => 'staff',
            'email' => 'staff@gmail.com',
            'password' => Hash::make('123'), // Menggunakan Hash untuk password
        ]);
        $user->assignRole('staff');

        // Simpan data ke tabel Staf terkait
        Staf::create([
            'user_id' => $user->id,  // Relasi ke tabel users
            'nama' => 'Staff Teknik',
            'prodi_staf' => 'Teknik Informatika',  // Contoh Program Studi
        ]);

        // Seeding Kaprodi
        $user = User::create([
            'name' => 'kaprodi',
            'email' => 'kaprodi@gmail.com',
            'password' => Hash::make('123'),
        ]);
        $user->assignRole('kaprodi');

        // Simpan data ke tabel Kaprodi terkait
        Kaprodi::create([
            'user_id' => $user->id,  // Relasi ke tabel users
            'nama' => 'Kaprodi Teknik',
            'prodi_kaprodi' => 'Teknik Mesin',  // Contoh Program Studi
        ]);

        // Seeding Mahasiswa
        $user = User::create([
            'name' => 'mahasiswa',
            'email' => 'mahasiswa@gmail.com',
            'password' => Hash::make('123'),
        ]);
        $user->assignRole('mahasiswa');

        // Simpan data ke tabel Mahasiswa terkait
        Mahasiswa::create([
            'user_id' => $user->id,  // Relasi ke tabel users
            'nim' => '123456789',
            'nama' => 'NABSS',
            'prodi' => 'Teknik Informatika',  // Contoh Program Studi
            'email' => 'mahasiswa@gmail.com',

        ]);
    }
}
