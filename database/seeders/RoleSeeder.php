<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Membuat role 'staff' dengan guard_name 'web'
        Role::create([
            'name' => 'staff',
            'guard_name' => 'web',
        ]);

        // Membuat role 'kaprodi' dengan guard_name 'web'
        Role::create([
            'name' => 'kaprodi',
            'guard_name' => 'web',
        ]);

        // Membuat role 'mahasiswa' dengan guard_name 'web'
        Role::create([
            'name' => 'mahasiswa',
            'guard_name' => 'web',
        ]);
    }
}
